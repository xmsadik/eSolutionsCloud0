  METHOD outgoing_invoice_save_vbrk.
    TYPES:
      BEGIN OF ty_vbrk,
        vbeln TYPE belnr_d,
        fkdat TYPE datum,
        fkart TYPE zetr_e_fkart,
        vkorg TYPE zetr_e_vkorg,
        vtweg TYPE zetr_e_vtweg,
        rfbsk TYPE c LENGTH 1,
        ernam TYPE usnam,
        erdat TYPE datum,
        erzet TYPE uzeit,
        kurrf TYPE zetr_e_kursf,
        waerk TYPE waers,
      END OF ty_vbrk,
      BEGIN OF ty_vbrp,
        posnr TYPE sd_sls_document_item,
        gsber TYPE gsber,
        werks TYPE werks_d,
        fkimg TYPE menge_d,
        netwr TYPE p LENGTH 15 DECIMALS 2,
        mwsbp TYPE wrbtr_cs,
        mwskz TYPE mwskz,
      END OF ty_vbrp,
      BEGIN OF ty_vbpa,
        parvw TYPE c LENGTH 2,
        kunnr TYPE zetr_e_partner,
      END OF ty_vbpa.
    DATA: ls_company_data       TYPE mty_company_data,
          lt_vbpa               TYPE TABLE OF ty_vbpa,
          ls_vbpa               TYPE ty_vbpa,
          ls_vbrk               TYPE ty_vbrk,
          lt_vbrp               TYPE TABLE OF ty_vbrp,
          ls_vbrp               TYPE ty_vbrp,
          ls_document           TYPE zetr_t_oginv,
          ls_invoice_rule_input TYPE zetr_s_invoice_rules_in,
          lv_parvw              TYPE c LENGTH 2.

    SELECT COUNT(*)
      FROM zetr_t_oginv
      WHERE awtyp EQ @iv_awtyp
        AND bukrs EQ @iv_bukrs
        AND belnr EQ @iv_belnr
        AND gjahr EQ @iv_gjahr.
    CHECK sy-subrc NE 0.

    SELECT SINGLE *
      FROM zetr_t_oginv
      WHERE awtyp = @iv_awtyp
        AND belnr = @iv_belnr
      INTO @ls_document.
    IF sy-subrc = 0.
      SELECT SINGLE billingdocumentdate
        FROM i_billingdocument
        WHERE billingdocument = @iv_belnr
        INTO @ls_document-bldat.
      IF sy-subrc IS INITIAL.
        SELECT SUM( netamount ) AS wrbtr,
               SUM( taxamount ) AS fwste
          FROM i_billingdocumentitem
          WHERE billingdocument = @iv_belnr
          INTO (@ls_document-wrbtr, @ls_document-fwste).

        UPDATE zetr_t_oginv
          SET bldat = @ls_document-bldat,
              wrbtr = @ls_document-wrbtr,
              fwste = @ls_document-fwste
          WHERE docui = @ls_document-docui.
        COMMIT WORK.
      ENDIF.
    ENDIF.
    CHECK ls_document IS INITIAL.

    SELECT SINGLE billingdocument AS vbeln,
                  billingdocumentdate AS fkdat,
                  billingdocumenttype AS fkart,
                  salesorganization AS vkorg,
                  distributionchannel AS vtweg,
                  accountingtransferstatus AS rfbsk,
                  createdbyuser AS ernam,
                  creationdate AS erdat,
                  creationtime AS erzet,
                  accountingexchangerate AS kurrf,
                  transactioncurrency AS waerk
      FROM i_billingdocument
      WHERE billingdocument = @iv_belnr
        AND billingdocumentiscancelled = ''
        AND cancelledbillingdocument = ''
      INTO @ls_vbrk.
    CHECK ls_vbrk IS NOT INITIAL.

    SELECT billingdocumentitem AS posnr,
           businessarea AS gsber,
           plant AS werks,
           billingquantity AS fkimg,
           netamount AS netwr,
           taxamount AS mwsbp,
           taxcode AS mwskz
      FROM i_billingdocumentitem
      WHERE billingdocument = @iv_belnr
      INTO TABLE @lt_vbrp.

    SELECT partnerfunction AS parvw, customer AS kunnr
      FROM i_billingdocumentpartner
      WHERE billingdocument = @iv_belnr
      INTO TABLE @lt_vbpa.

    SORT lt_vbpa BY parvw.
    READ TABLE lt_vbpa INTO ls_vbpa WITH KEY parvw = 'RE' BINARY SEARCH.
    IF sy-subrc <> 0.
      READ TABLE lt_vbpa INTO ls_vbpa WITH KEY parvw = 'AG' BINARY SEARCH.
    ENDIF.
    CHECK sy-subrc = 0.

    DATA(ls_partner_data) = get_partner_register_data( iv_customer = ls_vbpa-kunnr ).
    TRY .
        ls_document-docui = cl_system_uuid=>create_uuid_c22_static( ).
        ls_document-invui = cl_system_uuid=>create_uuid_c36_static( ).
      CATCH cx_uuid_error.
        RETURN.
    ENDTRY.
    ls_document-taxid = ls_partner_data-bptaxnumber.
    ls_document-partner = ls_partner_data-businesspartner.
    LOOP AT lt_vbrp INTO ls_vbrp.
      CHECK ls_vbrp-fkimg IS NOT INITIAL.
      ls_document-wrbtr += ls_vbrp-netwr.
      ls_document-fwste += ls_vbrp-mwsbp.
      ls_document-wrbtr += ls_vbrp-mwsbp.
      IF ls_vbrp-mwsbp IS INITIAL OR ls_vbrp-netwr IS INITIAL.
        ls_document-texex = abap_true.
      ENDIF.
      ls_document-werks = ls_vbrp-werks.
      ls_document-gsber = ls_vbrp-gsber.
    ENDLOOP.
    ls_document-bldat = ls_vbrk-fkdat.
    ls_document-docty = ls_vbrk-fkart.
    ls_document-awtyp = iv_awtyp(4).
    ls_document-bukrs = iv_bukrs.
    ls_document-belnr = iv_belnr.
    ls_document-gjahr = iv_gjahr.
    ls_document-erzet = ls_vbrk-erzet.
    ls_document-kursf = ls_vbrk-kurrf.
    ls_document-waers = ls_vbrk-waerk.
    ls_document-ernam = ls_vbrk-ernam.
    ls_document-vkorg = ls_vbrk-vkorg.
    ls_document-vtweg = ls_vbrk-vtweg.

    ls_invoice_rule_input-awtyp = iv_awtyp.
    ls_invoice_rule_input-sddty = ls_vbrk-fkart.
    ls_invoice_rule_input-partner = ls_document-partner.
    ls_invoice_rule_input-vkorg = ls_vbrk-vkorg.
    ls_invoice_rule_input-vtweg = ls_vbrk-vtweg.
    ls_invoice_rule_input-werks = ls_vbrp-werks.
    ls_invoice_rule_input-vbeln = ls_vbrk-vbeln.

    determine_invoice_scenario(
      EXPORTING
        is_invoice_rule_input = ls_invoice_rule_input
      CHANGING
        cs_company_data       = ls_company_data
        cs_document           = ls_document ).
    CHECK ls_document-prfid IS NOT INITIAL.
    IF ls_document-prfid NE 'IHRACAT' AND ls_document-prfid NE 'YOLCU'.
      CHECK ls_vbrk-rfbsk CA 'CD'.
    ENDIF.
    ls_invoice_rule_input-ityin = ls_document-invty.
    ls_invoice_rule_input-pidin = ls_document-prfid.

    IF ( ls_document-invty IS INITIAL OR
         ls_document-taxex IS INITIAL OR
         ls_document-taxty IS INITIAL ) AND
         ls_vbrp-mwskz IS NOT INITIAL.
      determine_invoice_tax_type(
        EXPORTING
          iv_tax_code = ls_vbrp-mwskz
        CHANGING
          cs_document = ls_document ).
    ENDIF.

    determine_invoice_prefix(
      EXPORTING
        is_invoice_rule_input = ls_invoice_rule_input
      CHANGING
        cs_document           = ls_document ).

    determine_invoice_xslt(
      EXPORTING
        is_invoice_rule_input = ls_invoice_rule_input
      CHANGING
        cs_document           = ls_document ).

    change_invoice_fields(
      EXPORTING
        is_invoice_rule_input = ls_invoice_rule_input
      CHANGING
        cs_document           = ls_document ).

    rs_document = ls_document.
  ENDMETHOD.
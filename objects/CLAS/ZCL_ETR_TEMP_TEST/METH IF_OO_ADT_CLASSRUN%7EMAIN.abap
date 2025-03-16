  METHOD if_oo_adt_classrun~main.

    DATA lt_taxpayers TYPE STANDARD TABLE OF zetr_t_inv_ruser.
    APPEND INITIAL LINE TO lt_taxpayers ASSIGNING FIELD-SYMBOL(<ls_taxpayer>).
    <ls_taxpayer>-aliass = 'urn:mail:defaultpk@hotmail.com'.
    <ls_taxpayer>-recno = '001'.
    <ls_taxpayer>-regdt = '20250121'.
    <ls_taxpayer>-regtm = '130641'.
    <ls_taxpayer>-taxid = '31150234526'.
    <ls_taxpayer>-title = 'BARIŞ AYDIN'.
    <ls_taxpayer>-txpty = 'OZEL'.

    INSERT zetr_t_inv_ruser FROM TABLE @lt_taxpayers.


*    DATA : gr_budat TYPE RANGE OF datum,
*           gr_belnr TYPE RANGE OF belnr_d.
*
*    TYPES: BEGIN OF ty_budat,
*             sign   TYPE c LENGTH 1,
*             option TYPE c LENGTH 2,
*             low    TYPE datum,
*             high   TYPE datum,
*           END OF ty_budat.
*    DATA lr_budat TYPE ty_budat.
*
*    DATA(ledger_general) = NEW zcl_etr_ledger_general( ).
*
*    lr_budat-option = 'BT'.
*    lr_budat-sign = 'I'.
*    lr_budat-low = '20240101'.
*    lr_budat-high = '20240131'.
*    APPEND lr_budat TO gr_budat.
*
*    DATA(lv_bukrs) = '1000'.
*    DATA : lv_gjahr TYPE gjahr.
*    lv_gjahr = '2024'.
*    DATA : lv_monat TYPE monat.
*    lv_monat = '01'.
*
*    ledger_general->generate_ledger_data(
*      EXPORTING
*        i_bukrs  = lv_bukrs
*        i_bcode  = ' '
*        i_tsfyd  = ' '
*        i_ledger = 'X'
*        tr_budat = gr_budat
*        tr_belnr = gr_belnr
*      IMPORTING
*        te_return = DATA(return)
*        te_ledger = DATA(ledger)
*        ).
*
*    ledger_general->set_ledger_partial(
*      i_bukrs = lv_bukrs
*      i_monat = lv_monat
*      i_gjahr = lv_gjahr
*    ).
*
*    ledger_general->process_xml_data(
*      EXPORTING
*        iv_bukrs       = lv_bukrs
*        it_budat_range = gr_budat
*        iv_tsfyd       = ' '
**        iv_auto        =
*      IMPORTING
*        ev_subrc       = DATA(subrc)
*    ).
*
*
*    ledger_general->send_ledger_to_service(
*      EXPORTING
*        iv_bukrs  = lv_bukrs
*        iv_gjahr  = lv_gjahr
*        iv_monat  = lv_monat
*      IMPORTING
*        ev_return = DATA(ev_return2)
*        s_subrc   = DATA(s_subrc)
*        tr_budat  = DATA(tr_budat)
*        te_return = DATA(return1)
*    ).
*
*    ledger_general->delete_ledger(
*      EXPORTING
*        iv_bukrs  = lv_bukrs
*        iv_gjahr  = lv_gjahr
*        iv_monat  = lv_monat
*      RECEIVING
*        rs_return = DATA(return2)
*    ).
*
*
*    out->write( return ).
*    out->write( ledger ).
*    out->write( return2 ).






*    DATA(lv_doc) = 'F989CF44-BCA6-1EEF-9EF9-2909744831B4'.
*    out->write( 'https://' && zcl_etr_regulative_common=>get_ui_url( ) &&
*                '/sap/opu/odata/sap/ZETR_DDL_D_INCOMING_INV/InvoiceContents(DocumentUUID=guid''' &&
*                lv_doc && ''',ContentType=''PDF'',DocumentType=''INCINVDOC'')/$value' ).
*
*    DATA lv_amount TYPE wrbtr_cs VALUE '100987.23'.
*    DATA lv_date TYPE datum VALUE '20240131'.
*    out->write( |{ lv_amount CURRENCY = 'TRY' NUMBER = USER }| ).
*    out->write( |{ lv_date COUNTRY = 'TR ' }| ).


*    DATA(Descriptor) = CAST cl_abap_structdescr( cl_abap_datadescr=>describe_by_name( p_name = 'ZETR_DDL_I_INCOMING_INVOICES' ) ).
*    DATA(lt_list) = Descriptor->get_components( ).
*    LOOP AT lt_list INTO DATA(ls_line).
*      DATA(lv_name) = ls_line-type->get_relative_name( ).
*      DATA(lo_text_attribute) = xco_cp_data_element=>text_attribute->medium_field_label.
*      DATA(lo_target) = xco_cp_i18n=>target->data_element->object( CONV #( lv_name ) ).
*      TRY.
*          DATA(lo_translation) = lo_target->get_translation( io_language        = xco_cp=>language( 'E' )
*                                                             it_text_attributes = VALUE #( ( lo_text_attribute ) ) ).
*          LOOP AT lo_translation->texts INTO DATA(lo_text).
*            DATA(lv_value) = lo_text_attribute->if_xco_i18n_text_attribute~get_string_for_text( lo_text->value ).
*            out->write( ls_line-name && `: ` && lv_value ).
*          ENDLOOP.
*        CATCH cx_root.
*          out->write( 'Hata:' && ls_line-name ).
*      ENDTRY.
*    ENDLOOP.
*
*    CHECK sy-subrc = 0.







*    DATA lt_blart TYPE RANGE OF blart.
*    SELECT 'E' AS sign, 'EQ' AS option, fidty AS low
*      FROM zetr_t_eirules
*      WHERE fidty <> ''
*      INTO TABLE @lt_blart.

*    DATA lt_uuid TYPE RANGE OF sysuuid_c22.
*    DO.
*      CLEAR lt_uuid.
*      SELECT 'I' AS sign, 'EQ' AS option, documentuuid AS low
*        FROM zetr_ddl_i_outgoing_invoices AS z
*        INNER JOIN i_journalentry AS j
*        ON  j~CompanyCode = z~CompanyCode
*        AND j~AccountingDocument = z~DocumentNumber
*        AND j~FiscalYear = z~FiscalYear
*        WHERE z~StatusCode IN ('','2')
*          AND j~AccountingDocumentType IN ('KZ','DT','UE','DZ','DD','KO')
*        INTO TABLE @lt_uuid
*        UP TO 1000 ROWS.
*      IF sy-subrc = 0 AND lt_uuid IS NOT INITIAL.
*        DELETE FROM zetr_t_oginv WHERE docui IN @lt_uuid.
*        DELETE FROM zetr_t_arcd WHERE docui IN @lt_uuid.
*        DELETE FROM zetr_t_logs WHERE docui IN @lt_uuid.
*        COMMIT WORK AND WAIT.
*      ELSE.
*        EXIT.
*      ENDIF.
*    ENDDO.
*    TRY.
*        DATA(lo_delivery) = zcl_etr_delivery_operations=>factory( 'TR01' ).
*        DATA(lv_html) = lo_delivery->outgoing_delivery_download( iv_document_uid  = 'ovBHSJQ07k{d}{sQ4wJ2YW'
*                                                                 iv_content_type  = 'HTML' ).
*        DATA(lo_pdf) = cl_rspo_pdf_merger=>create_instance( ).
*        lo_pdf->add_document( document = lv_html ).
*        DATA(lv_pdf) = lo_pdf->merge_documents( ).
*        CHECK lv_pdf IS NOT INITIAL.
*      CATCH cx_root INTO DATA(lx_root).
*        out->write( 'Hata' ).
*        out->write( lx_root->get_text( ) ).
*    ENDTRY.
  ENDMETHOD.
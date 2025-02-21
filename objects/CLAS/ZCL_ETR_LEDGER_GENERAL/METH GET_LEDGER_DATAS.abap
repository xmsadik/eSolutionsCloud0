  METHOD get_ledger_datas.
****    TYPES: BEGIN OF lty_cash_sel,
****             comp_code      TYPE bukrs,
****             cajo_number    TYPE c LENGTH 4,
****             posting_number TYPE belnr_d,
****           END OF lty_cash_sel.
***
***    TYPES: BEGIN OF ty_blart,
***             blart   TYPE zetr_t_hbbtr-blart,
***             hkon1   TYPE zetr_t_hbbtr-hkon1,
***             hflg1   TYPE c LENGTH 1,
***             hkon2   TYPE zetr_t_hbbtr-hkon2,
***             hflg2   TYPE c LENGTH 1,
***             hkon3   TYPE zetr_t_hbbtr-hkon3,
***             hflg3   TYPE c LENGTH 1,
***             hkon4   TYPE zetr_t_hbbtr-hkon4,
***             hflg4   TYPE c LENGTH 1,
***             blart_t TYPE zetr_t_defky-blart_t,
***             gbtur   TYPE zetr_t_defky-gbtur,
***             oturu   TYPE zetr_t_defky-oturu,
***             chcok   TYPE c LENGTH 1,
***           END OF ty_blart.
***
***    TYPES: BEGIN OF ty_colitem,
***             bukrs TYPE bukrs,
***             belnr TYPE belnr_d,
***             gjahr TYPE gjahr,
***             buzei TYPE buzei,
***             docln TYPE c LENGTH 6,
***             cldoc TYPE zetr_e_descr255,
***           END OF ty_colitem.
***
****    TYPES : BEGIN OF ty_bkpf ,
****              bukrs TYPE bukrs,
****              belnr TYPE belnr_d,
****              gjahr TYPE gjahr,
****              blart TYPE blart,
****              awtyp TYPE c LENGTH 5,
****              awkey TYPE c LENGTH 20,
****              stblg TYPE belnr_d,
****              xblnr TYPE xblnr1,
****              bstat TYPE zetr_e_bstat,
****              tcode TYPE tcode,
****              bktxt TYPE bktxt,
****              budat TYPE budat,
****              bldat TYPE bldat,
****              rldnr TYPE fins_ledger,
****            END OF ty_bkpf.
***
***    TYPES: BEGIN OF ty_bkpf,
***             CompanyCode                  TYPE bukrs,
***             AccountingDocument           TYPE belnr_d,
***             FiscalYear                   TYPE gjahr,
***             DocumentType                 TYPE blart,
***             ReferenceDocumentType        TYPE c LENGTH 5,
***             OriginalReferenceDocument    TYPE c LENGTH 20,
***             ReverseDocument              TYPE belnr_d,
***             DocumentReferenceID          TYPE xblnr1,
***             AccountingDocumentCategory   TYPE zetr_e_bstat,
***             TransactionCode              TYPE tcode,
***             AccountingDocumentHeaderText TYPE bktxt,
***             PostingDate                  TYPE budat,
***             DocumentDate                 TYPE bldat,
***             Ledger                       TYPE fins_ledger,
***           END OF ty_bkpf.
***
***    TYPES : BEGIN OF ty_bseg ,
***              CompanyCode                 TYPE bukrs,
***              GLAccount                   TYPE hkont,
***              FiscalYear                  TYPE gjahr,
***              ControllingDocumentItem     TYPE buzei,
***              BusinessArea                TYPE gsber,
***              AlternativeGLAccount        TYPE c LENGTH 10,
***              AccountingDocument          TYPE belnr_d,
***              LedgerGLLineItem            TYPE c LENGTH 6,
***              PostingDate                 TYPE budat,
***              DocumentDate                TYPE bldat,
***              CompanyCodeCurrency         TYPE waers,
***              DocumentType                TYPE blart,
***              DebitCreditCode             TYPE shkzg,
***              TaxCode                     TYPE mwskz,
***              AmountInCompanyCodeCurrency TYPE zetr_e_edf_dmbtr,
***              Supplier                    TYPE lifnr,
***              Customer                    TYPE lifnr,
***              FinancialAccountType        TYPE koart,
***              DocumentItemText            TYPE sgtxt,
***            END OF ty_bseg.
***
****    TYPES : BEGIN OF ty_bseg ,
****              CompanyCode TYPE bukrs,
****              hkont TYPE hkont,
****              gjahr TYPE gjahr,
****              buzei TYPE buzei,
****              gsber TYPE gsber,
****              lokkt TYPE c LENGTH 10,
****              belnr TYPE belnr_d,
****              docln TYPE c LENGTH 6,
****              budat TYPE budat,
****              bldat TYPE bldat,
****              rhcur TYPE waers,
****              blart TYPE blart,
****              drcrk TYPE shkzg,
****              mwskz TYPE mwskz,
****              hsl   TYPE zetr_e_edf_dmbtr,
****              lifnr TYPE lifnr,
****              kunnr TYPE lifnr,
****              koart TYPE koart,
****              sgtxt TYPE sgtxt,
****              shkzg TYPE c LENGTH 1,
****              dmbtr TYPE zetr_e_edf_dmbtr,
****              posn2 TYPE n LENGTH 6,
****              xcpdd TYPE c LENGTH 1,
****              wrbtr TYPE zetr_e_edf_dmbtr,
****              dmbe3 TYPE zetr_e_edf_dmbtr,
****              dmbe2 TYPE zetr_e_edf_dmbtr,
****              waers TYPE waers,
****            END OF ty_bseg.
***
***
***
***
***
***
***
***
***
***
***
***    TYPES : BEGIN OF ty_bsec,
***              bukrs TYPE bukrs,
***              belnr TYPE belnr_d,
***              gjahr TYPE gjahr,
***              buzei TYPE buzei,
***              name1 TYPE name1_gp,
***              name2 TYPE name1_gp,
***              name3 TYPE name1_gp,
***              name4 TYPE name1_gp,
***            END OF ty_bsec.
***
***    TYPES : BEGIN OF ty_bsed,
***              bukrs TYPE bukrs,
***              belnr TYPE belnr_d,
***              gjahr TYPE gjahr,
***              buzei TYPE buzei,
***              boeno TYPE c LENGTH 10,
***
***            END OF ty_bsed.
***
***    TYPES : BEGIN OF ty_kna1 ,
***              kunnr TYPE lifnr,
***              name1 TYPE name1_gp,
***              name2 TYPE name1_gp,
***            END OF ty_kna1.
***
***
***    TYPES : BEGIN OF ty_lfa1 ,
***              lifnr TYPE lifnr,
***              name1 TYPE name1_gp,
***              name2 TYPE name1_gp,
***            END OF ty_lfa1.
***
***
***    TYPES: BEGIN OF ty_gsber,
***             sign   TYPE c LENGTH 1,
***             option TYPE c LENGTH 2,
***             low    TYPE gsber,
***             high   TYPE gsber,
***           END OF ty_gsber.
***
***    TYPES: BEGIN OF ty_hkont,
***             sign   TYPE c LENGTH 1,
***             option TYPE c LENGTH 2,
***             low    TYPE hkont,
***             high   TYPE hkont,
***           END OF ty_hkont.
***
***    TYPES: BEGIN OF ty_dybel,
***             bukrs TYPE bukrs,
***             belnr TYPE belnr_d,
***             gjahr TYPE gjahr,
***           END OF ty_dybel.
***
***    TYPES: BEGIN OF ty_blryb,
***             bukrs TYPE bukrs,
***             blart TYPE blart,
***           END OF ty_blryb.
***
***    DATA: lv_cursor          TYPE cursor,
***          lt_bkpf            TYPE SORTED TABLE OF ty_bkpf WITH UNIQUE KEY  CompanyCode AccountingDocument FiscalYear AccountingDocumentCategory  ReferenceDocumentType,
***          lt_bkpf_send       TYPE TABLE OF ty_bkpf,
***          ls_bkpf_send       TYPE ty_bkpf,
****          lt_cash_sel        TYPE TABLE OF lty_cash_sel,
****          lt_cash_data       TYPE SORTED TABLE OF tcj_positions WITH UNIQUE KEY comp_code cajo_number posting_number transact_number,
****          lt_cash_post       TYPE SORTED TABLE OF tcj_positions WITH NON-UNIQUE KEY comp_code cajo_number posting_number,
***          lt_bkpf_add        TYPE TABLE OF ty_bkpf,
***          lt_bkpf_tmp        TYPE TABLE OF ty_bkpf,
***          lt_bseg            TYPE SORTED TABLE OF ty_bseg WITH NON-UNIQUE KEY companycode accountingdocument fiscalyear controllingdocumentitem glaccount alternativeglaccount businessarea customer supplier,
***          ls_bseg            LIKE LINE OF lt_bseg,
***          lt_bseg_tmp        TYPE TABLE OF ty_bseg,
***          lt_bseg_dat        TYPE TABLE OF ty_bseg,
***          lt_colitm          TYPE SORTED TABLE OF ty_colitem WITH UNIQUE KEY bukrs belnr gjahr buzei docln,
***          lt_colitm_bseg     TYPE SORTED TABLE OF ty_colitem WITH UNIQUE KEY bukrs belnr gjahr,
***          ls_colitm          LIKE LINE OF lt_colitm,
***          lt_bsec            TYPE SORTED TABLE OF ty_bsec WITH UNIQUE KEY bukrs belnr gjahr buzei,
***          lt_bsed            TYPE SORTED TABLE OF ty_bsed WITH UNIQUE KEY bukrs belnr gjahr buzei,
****          lt_payr            TYPE SORTED TABLE OF ty_payr WITH NON-UNIQUE KEY zbukr vblnr gjahr,
***          lt_bsec_sel        LIKE lt_bseg,
***          lt_faglflexa       TYPE SORTED TABLE OF faglflexa WITH NON-UNIQUE KEY rbukrs docnr ryear buzei docln,
***          lt_ledger          TYPE TABLE OF zetr_t_defky,
***          lt_skb1            TYPE TABLE OF ty_skb1,
***          lc_root            TYPE REF TO cx_root,
***          lt_kna1_tmp        TYPE TABLE OF ty_kna1,
***          lt_lfa1_tmp        TYPE TABLE OF ty_kna1,
***          lt_kna1            TYPE SORTED TABLE OF ty_kna1 WITH NON-UNIQUE KEY kunnr,
***          lt_lfa1            TYPE SORTED TABLE OF ty_kna1 WITH NON-UNIQUE KEY kunnr,
***          lt_wrong_types     TYPE SORTED TABLE OF zetr_t_bthbl  WITH UNIQUE KEY bukrs belnr gjahr,
***          lt_wrong_types_tmp TYPE TABLE OF zetr_t_bthbl,
***          lt_copy_belnr      TYPE SORTED TABLE OF zetr_t_blryb WITH UNIQUE KEY blart,
***          lt_copy_belnr_tmp  TYPE TABLE OF zetr_t_blryb,
***          lt_ex_docs         TYPE SORTED TABLE OF zetr_t_dybel WITH UNIQUE KEY belnr gjahr,
***          lt_ex_docs_tmp     TYPE TABLE OF zetr_t_dybel,
***          lt_cash            TYPE SORTED TABLE OF zetr_t_ksbel WITH UNIQUE KEY blart tisno,
***          lt_cash_tmp        TYPE TABLE OF zetr_t_ksbel,
***          lt_cash_temp       TYPE SORTED TABLE OF zetr_t_ksbel WITH NON-UNIQUE KEY blart,
***          lv_stblg           TYPE belnr_d,
***          lv_stjah           TYPE gjahr,
***          lv_awkey           TYPE c LENGTH 20,
***          lv_satici          TYPE c LENGTH 1,
***          lv_anahesap        TYPE c LENGTH 1,
***          lv_count           TYPE i,
***          lt_blart           TYPE SORTED TABLE OF zetr_t_hbbtr WITH NON-UNIQUE KEY blart,
***          lt_hbbtr           TYPE TABLE OF zetr_t_hbbtr,
***          lt_blart_tmp       TYPE SORTED TABLE OF ty_blart WITH NON-UNIQUE KEY blart,
***          ls_blart_tmp       TYPE ty_blart,
***          lt_blart_temp      LIKE gt_blart,
***          lv_count_th        TYPE i,
***          lv_count_fh        TYPE i,
***          lv_skip            TYPE c LENGTH 1,
***          lv_hkont           TYPE saknr,
***          lv_bktxt           TYPE zetr_e_descr255,
***          lv_45day           TYPE i,
***          lv_char            TYPE c LENGTH 1000,
***          lv_changed         TYPE c LENGTH 1,
***          lv_subrc           TYPE sy-subrc,
***          lv_count_send      TYPE i,
***          lv_taskname        TYPE c LENGTH 20,
***          lv_taskcount       TYPE n LENGTH 2,
***          lr_hkont           TYPE RANGE OF hkont,
***          ls_hkont           TYPE ty_hkont.
***
***    FIELD-SYMBOLS <fs_bseg> TYPE ty_bseg.
***
***    SELECT *
***      FROM zetr_t_bthbl
***        WHERE bukrs = @gv_bukrs
***     INTO TABLE @lt_wrong_types.
***
***    SELECT * FROM zetr_t_blryb WHERE bukrs = @gv_bukrs_tmp INTO TABLE @lt_copy_belnr.
***    SELECT * FROM zetr_t_dybel WHERE bukrs = @gv_bukrs_tmp INTO TABLE @lt_ex_docs.
***    SELECT * FROM zetr_t_ksbel WHERE bukrs = @gv_bukrs_tmp INTO TABLE @lt_cash_temp.
***    SELECT * FROM zetr_t_hbbtr WHERE bukrs = @gv_bukrs_tmp INTO TABLE @lt_blart.
***
***    LOOP AT lt_cash_temp INTO DATA(ls_cash_temp).
***
***      CONDENSE ls_cash_temp-tisno NO-GAPS.
***
***      DATA(lv_output) = |{ ls_cash_temp-tisno ALPHA = OUT }|.
***      ls_cash_temp-tisno = lv_output.
***
***      MODIFY lt_cash_temp FROM ls_cash_temp TRANSPORTING tisno.
***
***    ENDLOOP.
***
***    lt_cash[] = lt_cash_temp[].
***
***
***    SELECT *
***        FROM i_journalentry
***       WHERE CompanyCode EQ @gv_bukrs
***         AND AccountingDocument IN @gr_belnr
***         AND PostingDate IN @gr_budat
***         AND AccountingDocumentCategory IN @gr_bstat
***         AND LedgerGroup IN @gr_ldgrp
***         AND AccountingDocumentType IN @gr_blart
***          INTO CORRESPONDING FIELDS OF TABLE @lt_bkpf.
***
***    lt_ex_docs_tmp[] = lt_ex_docs[].
***    lt_wrong_types_tmp[] = lt_wrong_types[].
***    lt_copy_belnr_tmp[] = lt_copy_belnr[].
***    lt_cash_tmp[] = lt_cash[].
***    lt_skb1[] = gt_skb1[].
***    lt_blart_temp[] = gt_blart[].
***    lt_hbbtr[] = lt_blart[].
***
***
***    LOOP AT lt_bkpf INTO DATA(ls_bkpf).
***      CLEAR gv_results.
***      lv_count_send = lv_count_send + 1.
***      MOVE-CORRESPONDING ls_bkpf TO ls_bkpf_send.
***
***
***      TYPES: BEGIN OF lty_cash_sel,
***               comp_code      TYPE tcj_positions-comp_code,
***               cajo_number    TYPE tcj_positions-cajo_number,
***               posting_number TYPE tcj_positions-posting_number,
***             END OF lty_cash_sel.
***
****      TYPES: BEGIN OF ty_blart,
****               blart   TYPE /itetr/edf_hbbtr-blart,
****               hkon1   TYPE /itetr/edf_hbbtr-hkon1,
****               hflg1   TYPE c LENGTH 1,
****               hkon2   TYPE /itetr/edf_hbbtr-hkon2,
****               hflg2   TYPE c LENGTH 1,
****               hkon3   TYPE /itetr/edf_hbbtr-hkon3,
****               hflg3   TYPE c LENGTH 1,
****               hkon4   TYPE /itetr/edf_hbbtr-hkon4,
****               hflg4   TYPE c LENGTH 1,
****               blart_t TYPE /itetr/edf_defky-blart_t,
****               gbtur   TYPE /itetr/edf_defky-gbtur,
****               oturu   TYPE /itetr/edf_defky-oturu,
****               chcok   TYPE c LENGTH 1,
****             END OF ty_blart.
***
****      TYPES: BEGIN OF ty_colitem,
****               bukrs TYPE bukrs,
****               belnr TYPE belnr,
****               gjahr TYPE gjahr,
****               buzei TYPE buzei,
****               docln TYPE docln6,
****               cldoc TYPE /itetr/edf_cldoc,
****             END OF ty_colitem.
***
***
***      DATA: t_cash_sel  TYPE TABLE OF lty_cash_sel,
***            ls_cash_sel TYPE  lty_cash_sel,
***            t_cash_data TYPE SORTED TABLE OF tcj_positions WITH UNIQUE KEY comp_code cajo_number posting_number transact_number,
***            t_cash_post TYPE SORTED TABLE OF tcj_positions WITH NON-UNIQUE KEY comp_code cajo_number posting_number,
***            t_bkpf_add  TYPE TABLE OF i_journalentry.
***      " lt_bseg        TYPE SORTED TABLE OF bseg WITH NON-UNIQUE KEY bukrs belnr gjahr buzei hkont lokkt gsber kunnr lifnr WITH HEADER LINE,
****            lt_bseg        TYPE TABLE OF I_JournalEntryItem,
****            ls_bseg        LIKE LINE OF lt_bseg,
****            lt_bseg_tmp    TYPE TABLE OF I_JournalEntryItem,
****            lt_bseg_dat    TYPE TABLE OF I_JournalEntryItem,
****            lt_colitm      TYPE SORTED TABLE OF ty_colitem WITH UNIQUE KEY bukrs belnr gjahr buzei docln,
****            lt_colitm_bseg TYPE SORTED TABLE OF ty_colitem WITH UNIQUE KEY bukrs belnr gjahr,
****            ls_colitm      LIKE LINE OF lt_colitm,
****            lt_bsec        TYPE SORTED TABLE OF bsec WITH UNIQUE KEY bukrs belnr gjahr buzei,
****            lt_bsed        TYPE SORTED TABLE OF bsed WITH UNIQUE KEY bukrs belnr gjahr buzei,
****            lt_payr        TYPE SORTED TABLE OF payr WITH NON-UNIQUE KEY zbukr vblnr gjahr,
****            lt_bsec_sel    LIKE lt_bseg ,
****            lt_faglflexa   TYPE SORTED TABLE OF faglflexa WITH NON-UNIQUE KEY rbukrs docnr ryear buzei docln,
****            lt_ledger      LIKE /itetr/edf_defky,
****            lc_root        TYPE REF TO cx_root,
****            lt_kna1_tmp    LIKE kna1 OCCURS 0 WITH HEADER LINE,
****            lt_lfa1_tmp    LIKE kna1 OCCURS 0 WITH HEADER LINE,
****            lt_kna1        TYPE SORTED TABLE OF kna1 WITH NON-UNIQUE KEY kunnr WITH HEADER LINE,
****            lt_lfa1        TYPE SORTED TABLE OF kna1 WITH NON-UNIQUE KEY kunnr WITH HEADER LINE,
****            lv_stblg       TYPE rbkp-stblg,
****            lv_stjah       TYPE rbkp-stjah,
****            lv_awkey       TYPE bkpf-awkey,
****            lv_satici      TYPE c LENGTH 1,
****            lv_anahesap    TYPE c LENGTH 1,
****            lv_count       TYPE i,
****            lt_blart       TYPE SORTED TABLE OF /itetr/edf_hbbtr WITH NON-UNIQUE KEY blart WITH HEADER LINE,
****            lt_blart_tmp   TYPE SORTED TABLE OF ty_blart WITH NON-UNIQUE KEY blart WITH HEADER LINE,
****            lv_count_th    TYPE i,
****            lv_count_fh    TYPE i,
****            lv_skip        TYPE c LENGTH 1,
****            lv_hkont       TYPE saknr,
****            lv_bktxt       TYPE  zetr*edf    "/itetr/edf_bktxt,
****            lv_45day       TYPE i,
****            lv_char        TYPE c LENGTH 1000,
****            lv_changed     TYPE char01,
****            lv_subrc       TYPE sy-subrc,
****            lv_count_send  TYPE i.
***
****      FIELD-SYMBOLS : <fs_bseg>    TYPE bseg,
****                     <lfs_ledger> TYPE /itetr/edf_defky.
***
****      RANGES: lr_hkont FOR bseg-hkont.
***
***      LOOP AT lt_bkpf INTO ls_bkpf.
***        READ TABLE lt_ex_docs  INTO DATA(ls_ex_docs) WITH KEY belnr = ls_bkpf-accountingdocument
***                                                               gjahr = ls_bkpf-fiscalyear.
***        IF sy-subrc EQ 0.
***          DELETE lt_bkpf.CONTINUE.
***        ENDIF.
***
***        READ TABLE lt_wrong_types INTO DATA(ls_wrong_types) WITH KEY  bukrs = ls_bkpf-companycode
***                                                                      belnr = ls_bkpf-accountingdocument
***                                                                      gjahr = ls_bkpf-fiscalyear.
***        IF sy-subrc EQ 0.
***          ls_bkpf-documenttype = ls_wrong_types-blart.
***          MODIFY lt_bkpf FROM ls_bkpf TRANSPORTING documenttype.
***        ENDIF.
***
***        "Miro Faturaları Ters Kayıt Kontrolü
***        IF ls_bkpf-referencedocumenttype EQ 'RMRP'.
***          CLEAR : lv_stblg,lv_stjah,lv_awkey.
***
***          SELECT SINGLE ReverseDocument, ReverseDocumentFiscalYear
***            FROM I_SupplierInvoice
***           WHERE SupplierInvoice EQ @ls_bkpf-OriginalReferenceDocument(10)
***             AND FiscalYear EQ @ls_bkpf-OriginalReferenceDocument+10(4)
***             AND CompanyCode EQ @ls_bkpf-companycode
***             INTO (@lv_stblg, @lv_stjah).
***
***          IF lv_stblg IS NOT INITIAL.
***            CONCATENATE lv_stblg lv_stjah INTO lv_awkey.
***
***            SELECT SINGLE AccountingDocument
***              FROM I_JournalEntry
***             WHERE CompanyCode EQ @ls_bkpf-companycode
***               AND FiscalYear   EQ @lv_stjah
***               AND ReferenceDocumentType   EQ 'RMRP'
***               AND OriginalReferenceDocument   EQ @lv_awkey
***               INTO @ls_bkpf-reversedocument.
***            IF sy-subrc EQ 0.
***              MODIFY lt_bkpf FROM ls_bkpf TRANSPORTING reversedocument.
***            ENDIF.
***          ENDIF.
***
***        ENDIF.
***
***        READ TABLE lt_copy_belnr WITH KEY blart = ls_bkpf-documenttype TRANSPORTING NO FIELDS.
***        IF sy-subrc EQ 0 AND ls_bkpf-documentreferenceid IS INITIAL.
***          ls_bkpf-documentreferenceid = ls_bkpf-accountingdocument.
***          MODIFY lt_bkpf FROM ls_bkpf TRANSPORTING documentreferenceid.
***        ENDIF.
***
***
***        SELECT *
***          FROM I_JournalEntryItem
***         WHERE CompanyCode EQ @ls_bkpf-companycode
***           AND accountingdocument EQ @ls_bkpf-accountingdocument
***           AND fiscalyear EQ @ls_bkpf-fiscalyear
***           APPENDING CORRESPONDING FIELDS OF TABLE @lt_bseg.
***
***
***        IF gs_params-dfvhs IS NOT INITIAL.
***          lv_subrc = 4.
***          LOOP AT lt_bseg TRANSPORTING NO FIELDS
***                          WHERE companycode = ls_bkpf-companycode
***                             AND accountingdocument = ls_bkpf-accountingdocument
***                             AND fiscalyear = ls_bkpf-fiscalyear
***                             AND DebitCreditCode = 'S'
***                             AND AmountInCompanyCodeCurrency < 0.
***            lv_subrc = 0.
***            EXIT.
***          ENDLOOP.
***
***          LOOP AT lt_bseg TRANSPORTING NO FIELDS
***                          WHERE companycode = ls_bkpf-companycode
***                            AND AccountingDocument = ls_bkpf-AccountingDocument
***                            AND fiscalyear = ls_bkpf-fiscalyear
***                            AND DebitCreditCode = 'H'
***                            AND AmountInCompanyCodeCurrency > 0.
***            lv_subrc = 0.
***            EXIT.
***          ENDLOOP.
***
***          IF lv_subrc EQ 0.
***            SELECT SINGLE COUNT(*)
***              FROM I_JournalEntryItem
***             WHERE companycode EQ @ls_bkpf-companycode
***               AND AccountingDocument EQ @ls_bkpf-AccountingDocument
***               AND fiscalyear EQ @ls_bkpf-fiscalyear.
***            IF sy-subrc EQ 0.
***              DELETE lt_bseg WHERE companycode EQ ls_bkpf-companycode
***                               AND AccountingDocument EQ ls_bkpf-AccountingDocument
***                               AND fiscalyear EQ ls_bkpf-fiscalyear.
***
***              SELECT *
***                FROM I_JournalEntryItem
***               WHERE companycode EQ @ls_bkpf-companycode
***                 AND AccountingDocument EQ @ls_bkpf-AccountingDocument
***                 AND fiscalyear EQ @ls_bkpf-fiscalyear
***                   APPENDING CORRESPONDING FIELDS OF TABLE @lt_bseg.
***
***
***              CLEAR ls_colitm.
***              MOVE-CORRESPONDING ls_bkpf TO ls_colitm.
***              INSERT ls_colitm INTO TABLE lt_colitm_bseg.
***            ENDIF.
***          ENDIF.
***        ENDIF.
***
****        IF gs_params-rflop IS NOT INITIAL.
****          SELECT *
****            FROM faglflexa
****           WHERE ryear  EQ ls_bkpf-fiscalyear
****             AND docnr  EQ ls_bkpf-AccountingDocument
****             AND rldnr  EQ is_bukrs-rldnr
****             AND rbukrs EQ ls_bkpf-companycode
****             APPENDING CORRESPONDING FIELDS OF TABLE lt_faglflexa.
****        ENDIF.
***
***        IF ls_bkpf-AccountingDocumentCategory EQ 'L'.
***          APPEND ls_bkpf TO t_bkpf_add.
***        ENDIF.
***
***        READ TABLE lt_cash TRANSPORTING NO FIELDS WITH KEY blart = ls_bkpf-documenttype.
***        IF sy-subrc EQ 0.
***          CLEAR ls_cash_sel.
***          ls_cash_sel-comp_code      = ls_bkpf-companycode.
***          ls_cash_sel-posting_number = ls_bkpf-originalreferencedocument+0(10).
***          ls_cash_sel-cajo_number    = ls_bkpf-originalreferencedocument+10(4).
***          APPEND ls_cash_sel TO t_cash_sel.CLEAR t_cash_sel.
***        ENDIF.
***      ENDLOOP.
***
***      DATA lv_tabixx TYPE sy-tabix.
***
***      IF t_bkpf_add[] IS NOT INITIAL.
***
***        LOOP AT t_bkpf_add INTO DATA(ls_bkpf_add) .
***
***          lv_tabixx = sy-tabix.
***          READ TABLE lt_bseg TRANSPORTING NO FIELDS WITH KEY CompanyCode = ls_bkpf_add-CompanyCode
***                                                             AccountingDocument = ls_bkpf_add-AccountingDocument
***                                                             FiscalYear = ls_bkpf_add-FiscalYear.
***
***          IF sy-subrc IS INITIAL.
***            DELETE t_bkpf_add FROM ls_bkpf_add. "INDEX lv_tabixx.
***          ENDIF.
***
***        ENDLOOP.
***
***        IF t_bkpf_add[] IS NOT INITIAL.
***
****          SELECT *
****            FROM bseg_add
****            FOR ALL ENTRIES IN @t_bkpf_add
****            WHERE bukrs EQ @t_bkpf_add-CompanyCode
****              AND belnr EQ @t_bkpf_add-AccountingDocument
****              AND gjahr EQ @t_bkpf_add-FiscalYear
****              APPENDING CORRESPONDING FIELDS OF TABLE @lt_bseg.
***
***        ENDIF.
***
***      ENDIF.
***
****      lt_bseg_tmp[] = lt_bseg[].
****
****      CALL FUNCTION '/ITETR/EDF_EXIT_006'
****        EXPORTING
****          i_bukrs   = iv_bukrs
****          i_bcode   = iv_bcode
****          i_gjahr   = iv_gjahr
****          i_monat   = iv_monat
****        IMPORTING
****          c_changed = lv_changed
****        TABLES
****          t_bseg    = lt_bseg_tmp.
****      IF lv_changed IS NOT INITIAL.
****        lt_bseg[] = lt_bseg_tmp[].
****      ENDIF.
***
****      CLEAR:lt_bseg_tmp,lt_bseg_tmp[].
***
***      IF gv_alternative IS NOT INITIAL.
***        DATA lv_altkt TYPE  skb1-altkt.
***        LOOP AT lt_bseg INTO ls_bseg WHERE AlternativeGLAccount = space.
***          SELECT SINGLE altkt FROM skb1 WHERE bukrs = @ls_bseg-companycode  AND
***                                                            saknr = @ls_bseg-alternativeglaccount INTO @lv_altkt .
***          IF sy-subrc IS INITIAL.
***            ls_bseg-alternativeglaccount = lv_altkt.
***            MODIFY  lt_bseg FROM ls_bseg.
***          ENDIF.
***        ENDLOOP.
***
***        DELETE lt_bseg WHERE alternativeglaccount NOT IN gr_hkont.
***      ELSE.
***        DELETE lt_bseg WHERE GLAccount NOT IN gr_hkont.
***      ENDIF.
***      DELETE lt_bseg WHERE BusinessArea NOT IN gr_gsber.
***      IF lt_bseg[] IS INITIAL.
***        EXIT.
***      ENDIF.
***
***      IF gs_params-rfagl IS NOT INITIAL.
****        IF gs_params-rflop IS INITIAL.
****          SELECT *
****            FROM faglflexa
*****             FOR ALL ENTRIES IN @ls_bkpf
****           WHERE ryear  EQ @ls_bkpf-fiscalyear
****             AND docnr  EQ @ls_bkpf-AccountingDocument
****             AND rldnr  EQ @gs_bukrs-rldnr
****             AND rbukrs EQ @ls_bkpf-companycode
****             AND racct  IN @gr_hkont
****             INTO CORRESPONDING FIELDS OF TABLE @lt_faglflexa.
****        ENDIF.
***
****        IF gs_params-nbseg IS INITIAL.
****          DELETE lt_faglflexa WHERE buzei IS INITIAL.
****        ENDIF.
***
****        LOOP AT lt_bseg INTO ls_bseg.
****
****          LOOP AT lt_faglflexa INTO DATA(ls_faglflexa) WHERE rbukrs = ls_bseg-companycode
****                                 AND docnr  = ls_bseg-accountingdocument
****                                 AND ryear  = ls_bseg-fiscalyear
****                                 AND buzei  = ls_bseg-ControllingDocumentItem
****                                 AND docln  = ls_bseg-LedgerGLLineItem.
****            CLEAR lt_bseg_tmp.
****            lt_bseg_tmp = lt_bseg.
****
****            " rieter özel yapıldı.
****            ""BEGİN-OF-""" NEGATİF BELGE
******        IF lt_faglflexa-drcrk = 'H' AND lt_faglflexa-hsl > 0.
******          lt_faglflexa-drcrk = 'S'.
******        ENDIF.
******
******        IF lt_faglflexa-drcrk = 'S' AND lt_faglflexa-hsl < 0.
******          lt_faglflexa-drcrk = 'H'.
******        ENDIF.
****            SELECT SINGLE COUNT(*)
****              FROM bseg
****             WHERE bukrs EQ lt_bseg-bukrs
****               AND belnr EQ lt_bseg-belnr
****               AND gjahr EQ lt_bseg-gjahr
****               AND buzei EQ lt_bseg-buzei
****              AND  xnegp = 'X'.
****
****            IF sy-subrc IS INITIAL.
****
****              IF lt_faglflexa-drcrk = 'H' AND lt_faglflexa-hsl > 0.
****                lt_faglflexa-drcrk = 'S'.
****              ENDIF.
****
****              IF lt_faglflexa-drcrk = 'S' AND lt_faglflexa-hsl < 0..
****                lt_faglflexa-drcrk = 'H'.
****              ENDIF.
****
****
******        IF lt_bseg-xnegp IS NOT INITIAL.
****
******          IF lt_faglflexa-drcrk = 'S' .
******            IF lt_faglflexa-hsl < 0.
******              lt_faglflexa-hsl = abs( lt_faglflexa-hsl ).
******              lt_faglflexa-ksl = abs( lt_faglflexa-ksl ).
******              lt_faglflexa-osl = abs( lt_faglflexa-osl ).
******              lt_faglflexa-tsl = abs( lt_faglflexa-tsl ).
******            ENDIF.
******          ENDIF.
******
******          IF lt_faglflexa-drcrk = 'H'.
******            IF lt_faglflexa-hsl > 0.
******              lt_faglflexa-hsl = -1 * lt_faglflexa-hsl .
******              lt_faglflexa-ksl = -1 * lt_faglflexa-ksl .
******              lt_faglflexa-osl = -1 * lt_faglflexa-osl .
******              lt_faglflexa-tsl = -1 * lt_faglflexa-tsl .
******            ENDIF.
******          ENDIF.
****
****
****            ENDIF.
****
****            ""END-OF-""" NEGATİF BELGE
****            IF gs_params-xhana IS  INITIAL.
****              lt_bseg_tmp-posn2 = lt_faglflexa-docln. "posn2 alanını docln olarak kullanıyorum
****              lt_bseg_tmp-dmbtr = abs( lt_faglflexa-hsl ).
****              lt_bseg_tmp-dmbe2 = abs( lt_faglflexa-ksl ).
****              lt_bseg_tmp-dmbe2 = abs( lt_faglflexa-osl ).
****              lt_bseg_tmp-wrbtr = abs( lt_faglflexa-tsl ).
****              lt_bseg_tmp-shkzg = lt_faglflexa-drcrk.
****              APPEND lt_bseg_tmp.CLEAR lt_bseg_tmp.
****            ELSE.
****              lt_bseg_tmp-posn2 = lt_faglflexa-docln. "posn2 alanını docln olarak kullanıyorum
****              lt_bseg_tmp-dmbtr = lt_faglflexa-hsl .
****              lt_bseg_tmp-dmbe2 = lt_faglflexa-ksl .
****              lt_bseg_tmp-dmbe2 = lt_faglflexa-osl .
****              lt_bseg_tmp-wrbtr = lt_faglflexa-tsl .
****              lt_bseg_tmp-shkzg = lt_faglflexa-drcrk.
****              APPEND lt_bseg_tmp.CLEAR lt_bseg_tmp.
****            ENDIF.
****            DELETE lt_faglflexa.CONTINUE.
****          ENDLOOP.
****
****          IF sy-subrc EQ 0.
****            DELETE lt_bseg.CONTINUE.
****          ENDIF.
****        ENDLOOP.
***
****        IF gs_params-nbseg IS NOT INITIAL.
****          "Kalem Numarası 0 olup yinede yansıması gereken kayıtlar
****          LOOP AT lt_faglflexa WHERE buzei = '000'.
****            CLEAR : lt_bseg_tmp.
****            MOVE-CORRESPONDING lt_faglflexa TO lt_bseg_tmp.
****            lt_bseg_tmp-bukrs = lt_faglflexa-rbukrs.
****            lt_bseg_tmp-belnr = lt_faglflexa-docnr.
****            lt_bseg_tmp-gjahr = lt_faglflexa-ryear.
****            lt_bseg_tmp-buzei = lt_faglflexa-buzei.
****            lt_bseg_tmp-posn2 = lt_faglflexa-docln. "posn2 alanını docln olarak kullanıyorum
****            lt_bseg_tmp-hkont = lt_faglflexa-racct.
****            READ TABLE t_skb1 WITH KEY saknr = lt_faglflexa-racct.
****            IF sy-subrc EQ 0.
****              lt_bseg_tmp-lokkt = t_skb1-altkt.
****            ENDIF.
****
****
****            " rieter özel yapıldı.
****            ""BEGIN-OF-""" NEGATİF BELGE
*******        IF lt_faglflexa-drcrk = 'H' AND lt_faglflexa-hsl > 0.
*******          lt_faglflexa-drcrk = 'S'.
*******        ENDIF.
****
*******        IF lt_faglflexa-drcrk = 'S' AND lt_faglflexa-hsl < 0.
*******          lt_faglflexa-drcrk = 'H'.
*******        ENDIF.
****
****            SELECT SINGLE COUNT(*)
****              FROM bseg
****             WHERE bukrs EQ lt_bseg-bukrs
****               AND belnr EQ lt_bseg-belnr
****               AND gjahr EQ lt_bseg-gjahr
****               AND  buzei EQ lt_bseg-buzei
****              AND  xnegp = 'X'.
****
****            IF sy-subrc IS INITIAL.
****
****              IF lt_faglflexa-drcrk = 'H' AND lt_faglflexa-hsl > 0..
****                lt_faglflexa-drcrk = 'S'.
****              ENDIF.
****
****              IF lt_faglflexa-drcrk = 'S' AND lt_faglflexa-hsl < 0..
****                lt_faglflexa-drcrk = 'H'.
****              ENDIF.
****
****
****
****            ENDIF.
****            ""END-OF-""" NEGATİF BELGE
****            IF gs_params-xhana IS  INITIAL.
****              lt_bseg_tmp-dmbtr = abs( lt_faglflexa-hsl ).
****              lt_bseg_tmp-dmbe2 = abs( lt_faglflexa-ksl ).
****              lt_bseg_tmp-dmbe3 = abs( lt_faglflexa-osl ).
****              lt_bseg_tmp-wrbtr = abs( lt_faglflexa-tsl ).
****              lt_bseg_tmp-shkzg = lt_faglflexa-drcrk.
****              APPEND lt_bseg_tmp.CLEAR lt_bseg_tmp.
****            ELSE.
****              lt_bseg_tmp-dmbtr =  lt_faglflexa-hsl .
****              lt_bseg_tmp-dmbe2 =  lt_faglflexa-ksl .
****              lt_bseg_tmp-dmbe3 =  lt_faglflexa-osl .
****              lt_bseg_tmp-wrbtr =  lt_faglflexa-tsl .
****              lt_bseg_tmp-shkzg = lt_faglflexa-drcrk.
****              APPEND lt_bseg_tmp.CLEAR lt_bseg_tmp.
****            ENDIF.
****          ENDLOOP.
****        ENDIF.
***
****        IF lt_bseg_tmp[] IS NOT INITIAL.
****          CLEAR:lt_bseg,lt_bseg[].
****          lt_bseg[] = lt_bseg_tmp[].
****        ENDIF.
****      ENDIF.
***
****      CLEAR:lt_kna1_tmp,lt_kna1_tmp[],lt_lfa1_tmp,lt_lfa1_tmp[],
****            lt_kna1,lt_kna1[],lt_lfa1,lt_lfa1[].
****
****      LOOP AT lt_bseg ASSIGNING <fs_bseg>.
****
****        IF <fs_bseg>-ControllingDocumentItem IS INITIAL AND <fs_bseg>-docln IS NOT INITIAL.
****          <fs_bseg>-posn2 = <fs_bseg>-docln.
****        ENDIF.
****
****        IF <fs_bseg>-kunnr NE space OR <fs_bseg>-lifnr NE space.
****          IF <fs_bseg>-kunnr IS NOT INITIAL.
****            lt_kna1_tmp-kunnr = <fs_bseg>-kunnr.
****            COLLECT lt_kna1_tmp.
****          ELSEIF <fs_bseg>-lifnr IS NOT INITIAL.
****            lt_lfa1_tmp-lifnr = <fs_bseg>-lifnr.
****            COLLECT lt_lfa1_tmp.
****          ENDIF.
****
****          IF <fs_bseg>-xcpdd IS NOT INITIAL.
****            lt_bsec_sel = <fs_bseg>.
****            APPEND lt_bsec_sel.CLEAR lt_bsec_sel.
****          ENDIF.
****        ENDIF.
****
****      ENDLOOP.
****
****      IF lt_kna1_tmp[] IS NOT INITIAL.
****        SELECT kunnr name1 name2
****          FROM kna1
****          INTO CORRESPONDING FIELDS OF TABLE lt_kna1
****           FOR ALL ENTRIES IN lt_kna1_tmp
****         WHERE kunnr = lt_kna1_tmp-kunnr.
****      ENDIF.
****
****      IF lt_lfa1_tmp[] IS NOT INITIAL.
****        SELECT lifnr name1 name2
****          FROM lfa1
****          INTO CORRESPONDING FIELDS OF TABLE lt_lfa1
****           FOR ALL ENTRIES IN lt_lfa1_tmp
****         WHERE lifnr = lt_lfa1_tmp-lifnr.
****      ENDIF.
****
****      IF lt_bsec_sel[] IS NOT INITIAL.
****        SELECT *
****          FROM bsec
****          INTO TABLE lt_bsec
****           FOR ALL ENTRIES IN lt_bsec_sel
****         WHERE bukrs = lt_bsec_sel-bukrs
****           AND belnr = lt_bsec_sel-belnr
****           AND gjahr = lt_bsec_sel-gjahr
****           AND buzei = lt_bsec_sel-buzei.
****      ENDIF.
***
****      IF lt_bseg[] IS NOT INITIAL.
****        SELECT *
****          FROM bsed
****          INTO TABLE lt_bsed
****           FOR ALL ENTRIES IN lt_bseg
****         WHERE bukrs = lt_bseg-bukrs
****           AND belnr = lt_bseg-belnr
****           AND gjahr = lt_bseg-gjahr
****           AND buzei = lt_bseg-buzei.
****      ENDIF.
***
****      IF ls_bkpf[] IS NOT INITIAL.
****        SELECT zbukr vblnr gjahr chect
****          FROM payr
****          INTO CORRESPONDING FIELDS OF TABLE lt_payr
****           FOR ALL ENTRIES IN ls_bkpf
****         WHERE zbukr EQ ls_bkpf-companycode
****           AND vblnr EQ ls_bkpf-AccountingDocument
****           AND gjahr EQ ls_bkpf-fiscalyear
****           AND chect NE space.
****      ENDIF.
***
****      IF t_cash_sel[] IS NOT INITIAL.
****        REFRESH: t_cash_post, t_cash_data.
****        SELECT comp_code cajo_number posting_number transact_number
****          FROM tcj_positions
****          INTO CORRESPONDING FIELDS OF TABLE t_cash_post
****           FOR ALL ENTRIES IN t_cash_sel
****         WHERE comp_code EQ t_cash_sel-comp_code
****           AND cajo_number EQ t_cash_sel-cajo_number
****           AND posting_number EQ t_cash_sel-posting_number.
****
****        LOOP AT t_cash_post.
****
****          CONDENSE t_cash_post-transact_number NO-GAPS.
****
****          CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
****            EXPORTING
****              input  = t_cash_post-transact_number
****            IMPORTING
****              output = t_cash_post-transact_number.
****
****          MODIFY t_cash_post.
****
****        ENDLOOP.
****
****        t_cash_data[] = t_cash_post[].
****
****      ENDIF.
***
****        LOOP AT lt_bkpf INTO ls_bkpf.
****          CLEAR : lt_ledger,Gt_blart,lv_satici,lv_anahesap,
****                  lt_blart_tmp,lt_blart_tmp[],lt_bseg_dat,lt_bseg_dat[].
****
****          LOOP AT Lt_hbbtr INTO DATA(ls_hbbtr) WHERE blart = ls_bkpf-documenttype.
****            MOVE-CORRESPONDING ls_hbbtr TO ls_blart_tmp .
****            APPEND ls_blart_tmp TO lt_blart_tmp.
****          ENDLOOP.
****
****          IF gs_params-dfvhs IS NOT INITIAL.
****            "BSEG negatif kayıt tutmuyor
****            "BSEG ile çekilen hatalı kayıtlar için bu işlemi yapmasın
****            READ TABLE lt_colitm_bseg WITH KEY bukrs = ls_bkpf-companycode
****                                               belnr = ls_bkpf-AccountingDocument
****                                               gjahr = ls_bkpf-fiscalyear.
****            IF sy-subrc NE 0.
****              LOOP AT lt_bseg INTO ls_bseg WHERE bukrs = ls_bkpf-companycode
****                                             AND belnr = ls_bkpf-AccountingDocument
****                                             AND gjahr = ls_bkpf-fiscalyear
****                                             AND shkzg = 'S'
****                                             AND dmbtr < 0.
****
****                ls_bseg-dmbtr = abs( ls_bseg-dmbtr ).
***
****                LOOP AT lt_bseg WHERE bukrs = ls_bkpf-companycode
****                                  AND belnr = ls_bkpf-AccountingDocument
****                                  AND gjahr = ls_bkpf-fiscalyear
****                                  AND shkzg = 'S'
****                                  AND dmbtr > ls_bseg-dmbtr.
****
****                  IF lt_bseg-buzei EQ ls_bseg-buzei AND
****                     lt_bseg-docln EQ ls_bseg-docln.
****                    CONTINUE.
****                  ENDIF.
****
****                  LOOP AT lt_colitm INTO ls_colitm WHERE bukrs = lt_bseg-bukrs
****                                                     AND belnr = lt_bseg-belnr
****                                                     AND gjahr = lt_bseg-gjahr
****                                                     AND buzei = lt_bseg-buzei
****                                                     AND docln = lt_bseg-docln.
****                    IF ls_bseg-buzei IS NOT INITIAL AND ls_bseg-docln IS NOT INITIAL.
****                      CONCATENATE ls_bseg-buzei ',' ls_bseg-docln INTO lv_char.
****                    ELSEIF ls_bseg-docln IS NOT INITIAL.
****                      lv_char = ls_bseg-docln.
****                    ELSEIF ls_bseg-buzei IS NOT INITIAL.
****                      lv_char = ls_bseg-buzei.
****                    ENDIF.
****
****                    CONCATENATE ls_colitm-cldoc '/' lv_char INTO ls_colitm-cldoc.
****                    MODIFY lt_colitm FROM ls_colitm.
****                  ENDLOOP.
****                  IF sy-subrc NE 0.
****                    CLEAR ls_colitm.
****
****                    IF ls_bseg-buzei IS NOT INITIAL AND ls_bseg-docln IS NOT INITIAL.
****                      CONCATENATE ls_bseg-buzei ',' ls_bseg-docln INTO lv_char.
****                    ELSEIF ls_bseg-docln IS NOT INITIAL.
****                      lv_char = ls_bseg-docln.
****                    ELSEIF ls_bseg-buzei IS NOT INITIAL.
****                      lv_char = ls_bseg-buzei.
****                    ENDIF.
****
****                    ls_colitm-bukrs = lt_bseg-bukrs.
****                    ls_colitm-belnr = lt_bseg-belnr.
****                    ls_colitm-gjahr = lt_bseg-gjahr.
****                    ls_colitm-buzei = lt_bseg-buzei.
****                    ls_colitm-docln = lt_bseg-docln.
****                    ls_colitm-cldoc = lv_char.
****                    INSERT ls_colitm INTO TABLE lt_colitm.
****                  ENDIF.
****
****                  lt_bseg-dmbtr = lt_bseg-dmbtr - ls_bseg-dmbtr.
****                  MODIFY lt_bseg.
****                  EXIT.
****                ENDLOOP.
****
****                DELETE lt_bseg.CONTINUE.
****              ENDLOOP.
****
****              LOOP AT lt_bseg INTO ls_bseg WHERE companycode = ls_bkpf-companycode
****                                             AND AccountingDocument = ls_bkpf-AccountingDocument
****                                             AND fiscalyear = ls_bkpf-fiscalyear
****                                             AND shkzg = 'H'
****                                             AND dmbtr > 0.
****
****                ls_bseg-dmbtr = abs( ls_bseg-dmbtr ).
****
****                LOOP AT lt_bseg WHERE bukrs = ls_bkpf-companycode
****                                  AND belnr = ls_bkpf-AccountingDocument
****                                  AND gjahr = ls_bkpf-fiscalyear
****                                  AND shkzg = 'H'
****                                  AND dmbtr < ls_bseg-dmbtr.
****
****                  IF lt_bseg-buzei EQ ls_bseg-buzei AND
****                     lt_bseg-docln EQ ls_bseg-docln.
****                    CONTINUE.
****                  ENDIF.
****
****                  LOOP AT lt_colitm INTO ls_colitm WHERE bukrs = lt_bseg-bukrs
****                                                     AND belnr = lt_bseg-belnr
****                                                     AND gjahr = lt_bseg-gjahr
****                                                     AND buzei = lt_bseg-buzei
****                                                     AND docln = lt_bseg-docln.
****                    IF ls_bseg-buzei IS NOT INITIAL AND ls_bseg-docln IS NOT INITIAL.
****                      CONCATENATE ls_bseg-buzei ',' ls_bseg-docln INTO lv_char.
****                    ELSEIF ls_bseg-docln IS NOT INITIAL.
****                      lv_char = ls_bseg-docln.
****                    ELSEIF ls_bseg-buzei IS NOT INITIAL.
****                      lv_char = ls_bseg-buzei.
****                    ENDIF.
****
****                    CONCATENATE ls_colitm-cldoc '/' lv_char INTO ls_colitm-cldoc.
****                    MODIFY lt_colitm FROM ls_colitm.
****                  ENDLOOP.
****                  IF sy-subrc NE 0.
****                    CLEAR ls_colitm.
****
****                    IF ls_bseg-buzei IS NOT INITIAL AND ls_bseg-docln IS NOT INITIAL.
****                      CONCATENATE ls_bseg-buzei ',' ls_bseg-docln INTO lv_char.
****                    ELSEIF ls_bseg-docln IS NOT INITIAL.
****                      lv_char = ls_bseg-docln.
****                    ELSEIF ls_bseg-buzei IS NOT INITIAL.
****                      lv_char = ls_bseg-buzei.
****                    ENDIF.
****
****                    ls_colitm-bukrs = lt_bseg-bukrs.
****                    ls_colitm-belnr = lt_bseg-belnr.
****                    ls_colitm-gjahr = lt_bseg-gjahr.
****                    ls_colitm-buzei = lt_bseg-buzei.
****                    ls_colitm-docln = lt_bseg-docln.
****                    ls_colitm-cldoc = lv_char.
****                    INSERT ls_colitm INTO TABLE lt_colitm.
****                  ENDIF.
****
****                  lt_bseg-dmbtr = lt_bseg-dmbtr + ls_bseg-dmbtr.
****                  MODIFY lt_bseg.
****                  EXIT.
****                ENDLOOP.
****
****                DELETE lt_bseg.CONTINUE.
****              ENDLOOP.
****            ENDIF.
****          ENDIF.
***
***        LOOP AT lt_bseg INTO ls_bseg WHERE companycode = ls_bkpf-companycode
***                          AND AccountingDocument = ls_bkpf-AccountingDocument
***                          AND fiscalyear = ls_bkpf-fiscalyear.
***
***          APPEND ls_bseg TO lt_bseg_dat.
***          LOOP AT lt_blart_tmp INTO ls_blart_tmp.
***            CLEAR:lv_count_th,lv_count_fh.
***
***            IF ls_blart_tmp-hkon1 IS NOT INITIAL.
***              FREE:gr_hkont,gr_hkont[].
***              IF ls_blart_tmp-hkon1 CA '+*'.
***                ls_hkont-option  = 'ICP'.
***              ELSE.
***                ls_hkont-option   = 'IEQ'.
***              ENDIF.
***              ls_hkont-low = ls_blart_tmp-hkon1.
***              APPEND ls_hkont TO gr_hkont .CLEAR ls_hkont.
***
***              IF ls_bseg-glaccount IN gr_hkont.
***                ls_blart_tmp-hflg1 = 'X'.
***                ADD 1 TO lv_count_fh.
***              ENDIF.
***              ADD 1 TO lv_count_th.
***            ENDIF.
***
***            IF ls_blart_tmp-hkon2 IS NOT INITIAL.
***              FREE:gr_hkont,gr_hkont[].
***              IF ls_blart_tmp-hkon2 CA '+*'.
***                ls_hkont-option = 'ICP'.
***              ELSE.
***                ls_hkont-option  = 'IEQ'.
***              ENDIF.
***              ls_hkont-low = ls_blart_tmp-hkon2.
***              APPEND ls_hkont TO gr_hkont.CLEAR ls_hkont.
***
***              IF ls_bseg-glaccount IN gr_hkont.
***                ls_blart_tmp-hflg2 = 'X'.
***                ADD 1 TO lv_count_fh.
***              ENDIF.
***              ADD 1 TO lv_count_th.
***            ENDIF.
***
***            IF ls_blart_tmp-hkon3 IS NOT INITIAL.
***              FREE:gr_hkont,gr_hkont[].
***              IF ls_blart_tmp-hkon3 CA '+*'.
***                ls_hkont-option = 'ICP'.
***              ELSE.
***                ls_hkont-option = 'IEQ'.
***              ENDIF.
***              ls_hkont-low = ls_blart_tmp-hkon3.
***              APPEND ls_hkont TO gr_hkont.CLEAR ls_hkont.
***
***              IF ls_bseg-glaccount IN gr_hkont.
***                ls_blart_tmp-hflg3 = 'X'.
***                ADD 1 TO lv_count_fh.
***              ENDIF.
***              ADD 1 TO lv_count_th.
***            ENDIF.
***
***            IF ls_blart_tmp-hkon4 IS NOT INITIAL.
***              FREE:gr_hkont,gr_hkont[].
***              IF ls_blart_tmp-hkon4 CA '+*'.
***                ls_hkont-option = 'ICP'.
***              ELSE.
***                ls_hkont-option = 'IEQ'.
***              ENDIF.
***              ls_hkont-low = ls_blart_tmp-hkon4.
***              APPEND ls_hkont TO gr_hkont.CLEAR ls_hkont.
***
***              IF ls_bseg-glaccount IN gr_hkont.
***                ls_blart_tmp-hflg4 = 'X'.
***                ADD 1 TO lv_count_fh.
***              ENDIF.
***              ADD 1 TO lv_count_th.
***            ENDIF.
***
***            IF lv_count_th EQ lv_count_fh.
***              ls_blart_tmp-chcok = 'X'.
***              MODIFY lt_blart_tmp FROM ls_blart_tmp.
***            ENDIF.
***          ENDLOOP.
***        ENDLOOP.
***
***
***        IF gv_f51_blart EQ ls_bkpf-documenttype AND
***           gv_f51_tcode EQ ls_bkpf-transactioncode.
***          LOOP AT lt_bseg INTO ls_bseg WHERE companycode = ls_bkpf-companycode
***                            AND AccountingDocument = ls_bkpf-AccountingDocument
***                            AND fiscalyear = ls_bkpf-fiscalyear.
***            IF ls_bseg-FinancialAccountType EQ 'K'.
***              lv_satici = 'X'.
***            ELSEIF ls_bseg-FinancialAccountType EQ 'S'.
***              lv_anahesap = 'X'.
***            ENDIF.
***          ENDLOOP.
***        ENDIF.
***
***        READ TABLE Gt_blart INTO DATA(ls_blart) WITH KEY blart = ls_bkpf-documenttype.
***
****        LOOP AT lt_cash INTO DATA(ls_cash) WHERE blart = ls_bkpf-documenttype.
****          READ TABLE t_cash_data TRANSPORTING NO FIELDS WITH KEY comp_code = ls_bkpf-companycode
****                                         cajo_number = ls_bkpf-originalreferencedocument+10(4)
****                                      posting_number = ls_bkpf-originalreferencedocument+0(10)
****                                      transact_number = ls_cash-tisno.
****          IF sy-subrc EQ 0.
****            CLEAR:ls_blart-gbtur,ls_blart-blart_t,ls_blart-oturu.
****            ls_blart-gbtur   = ls_cash-gbtur.
****            IF ls_blart-gbtur = 'other'.
****              ls_blart-blart_t = ls_cash-blart_t.
****            ENDIF.
****            ls_blart-oturu   = ls_cash-oturu.
****            EXIT.
****          ENDIF.
****        ENDLOOP.
***
****        IF ls_blart-gbtur EQ 'check' OR ls_blart-gbtur EQ 'voucher'.
****          CLEAR lv_count.
****          LOOP AT lt_bsed INTO data(ls_bsed) WHERE bukrs EQ ls_bkpf-companycode
****                            AND belnr EQ ls_bkpf-AccountingDocument
****                            AND gjahr EQ ls_bkpf-fiscalyear
****                            AND boeno NE space.
****            ADD 1 TO lv_count.
****          ENDLOOP.
****
****          IF lv_count EQ 1.
****            ls_bkpf-documentreferenceid = ls_bsed-boeno.
****          ELSEIF lv_count GT 1.
****            IF Gt_blart-gbtur EQ 'check'.
****              Gt_blart-blart_t = 'Çek Bordrosu'.
****            ELSE.
****              Gt_blart-blart_t = 'Senet Bordrosu'.
****            ENDIF.
****
****            Gt_blart-gbtur = 'other'.
****          ELSE.
****            CLEAR lv_count.
****            LOOP AT lt_payr WHERE zbukr = ls_bkpf-companycode
****                              AND vblnr = ls_bkpf-AccountingDocument
****                              AND gjahr = ls_bkpf-fiscalyear.
****              ADD 1 TO lv_count.
****            ENDLOOP.
****
****            IF lv_count EQ 1.
****              ls_bkpf-xblnr = lt_payr-chect.
****            ELSEIF lv_count > 1.
****              ls_bkpf-xblnr = lt_payr-vblnr.
****
****              IF Gt_blart-gbtur EQ 'check'.
****                Gt_blart-blart_t = 'Çek Bordrosu'.
****              ELSE.
****                Gt_blart-blart_t = 'Senet Bordrosu'.
****              ENDIF.
****
****              Gt_blart-gbtur = 'other'.
****            ENDIF.
****          ENDIF.
****        ENDIF.
***
****        IF gv_f51_blart EQ ls_bkpf-blart AND
****           gv_f51_tcode EQ ls_bkpf-tcode.
****
****          IF lv_satici EQ 'X' AND lv_anahesap EQ 'X'.
****
****            IF Gt_blart-gbtur EQ 'check'.
****              Gt_blart-gbtur   = 'check'.
****              Gt_blart-blart_t = space.
****              Gt_blart-oturu   = 'Çek'.
****            ELSEIF Gt_blart-gbtur EQ 'voucher'.
****              Gt_blart-gbtur   = 'voucher'.
****              Gt_blart-blart_t = space.
****              Gt_blart-oturu   = 'Senet'.
****            ENDIF.
****
****          ENDIF.
****
****
****        ENDIF.
***
***        LOOP AT lt_blart_tmp WHERE chcok IS NOT INITIAL.
***          EXIT.
***        ENDLOOP.
***        IF sy-subrc EQ 0.
***          ls_blart-blart_t = ls_blart_tmp-blart_t.
***          ls_blart-gbtur   = ls_blart_tmp-gbtur.
***          ls_blart-oturu   = ls_blart_tmp-oturu.
***        ENDIF.
***
****        CLEAR lv_skip.
****        lv_bktxt = ls_bkpf-bktxt.
***
****        CALL FUNCTION '/ITETR/EDF_EXIT_001'
****          EXPORTING
****            is_bkpf   = ls_bkpf
****          TABLES
****            t_bseg    = lt_bseg_dat
****          CHANGING
****            c_blart_t = Gt_blart-blart_t
****            c_gbtur   = Gt_blart-gbtur
****            c_oturu   = Gt_blart-oturu
****            c_xblnr   = ls_bkpf-xblnr
****            c_bktxt   = lv_bktxt
****            c_skip    = lv_skip.
***
****        IF lv_skip IS NOT INITIAL.
****          CONTINUE.
****        ENDIF.
***
***        LOOP AT lt_bseg WHERE bukrs = ls_bkpf-companycode
***                          AND belnr = ls_bkpf-AccountingDocument
***                          AND gjahr = ls_bkpf-fiscalyear.
***
***          IF iv_alternative IS INITIAL.
***            WRITE lt_bseg-hkont TO lv_hkont NO-ZERO.
***            CONDENSE lv_hkont.
***          ELSE.
***            WRITE lt_bseg-lokkt TO lv_hkont NO-ZERO.
***            CONDENSE lv_hkont.
***            lt_bseg-hkont = lt_bseg-lokkt.
***          ENDIF.
***
***          CLEAR lt_ledger.
***          MOVE-CORRESPONDING ls_bkpf TO lt_ledger.
***          MOVE-CORRESPONDING lt_bseg TO lt_ledger.
***          lt_ledger-bktxt   = lv_bktxt.
***
***          IF gs_params-xhana IS  INITIAL.
***            lt_ledger-docln   = lt_bseg-posn2.
***          ELSE.
***            lt_ledger-docln   = lt_bseg-docln.
***          ENDIF.
***
***          lt_ledger-bcode   = iv_bcode.
***          lt_ledger-tsfyd   = iv_tasfiye.
***          lt_ledger-gbtur   = Gt_blart-gbtur.
***          IF lt_ledger-gbtur EQ 'other'.
***            lt_ledger-blart_t = Gt_blart-blart_t.
***          ENDIF.
***          lt_ledger-oturu   = Gt_blart-oturu.
***
***          lt_ledger-hkont_3 = lv_hkont+0(3).
***
***          IF gs_params-natpb EQ 'DMBTR'.
***            lt_ledger-dmbtr_def = abs( lt_bseg-dmbtr ).
***          ELSEIF gs_params-natpb EQ 'WRBTR'.
***            lt_ledger-dmbtr_def = abs( lt_bseg-wrbtr ).
***          ELSEIF gs_params-natpb EQ 'DMBE2'.
***            lt_ledger-dmbtr_def = abs( lt_bseg-dmbe2 ).
***          ELSEIF gs_params-natpb EQ 'DMBE3'.
***            lt_ledger-dmbtr_def = abs( lt_bseg-dmbe3 ).
***          ELSE.
***            lt_ledger-dmbtr_def = abs( lt_bseg-dmbtr ).
***          ENDIF.
***
***          lt_ledger-shkzg_srt = lt_ledger-shkzg.
***          IF lt_ledger-shkzg EQ 'S'.
***            lt_ledger-shkzg_srt = 'B'.
***          ENDIF.
***
***          IF lt_bseg-kunnr IS NOT INITIAL OR lt_bseg-lifnr IS NOT INITIAL.
***            IF lt_bseg-xcpdd IS NOT INITIAL.
***              READ TABLE lt_bsec WITH KEY bukrs = lt_bseg-bukrs
***                                          belnr = lt_bseg-belnr
***                                          gjahr = lt_bseg-gjahr
***                                          buzei = lt_bseg-buzei.
***              IF sy-subrc EQ 0.
***                IF lt_bseg-kunnr IS NOT INITIAL.
***                  CONCATENATE lt_bsec-name1 lt_bsec-name2
***                              lt_bsec-name3 lt_bsec-name4
***                         INTO lt_ledger-kname SEPARATED BY space.
***                ELSEIF lt_bseg-lifnr IS NOT INITIAL.
***                  CONCATENATE lt_bsec-name1 lt_bsec-name2
***                              lt_bsec-name3 lt_bsec-name4
***                         INTO lt_ledger-lname SEPARATED BY space.
***                ENDIF.
***              ENDIF.
***            ELSE.
***            ENDIF.
***          ENDIF.
***
***          IF lt_ledger-kunnr IS NOT INITIAL AND lt_ledger-kname IS INITIAL.
***            READ TABLE lt_kna1 WITH KEY kunnr = lt_ledger-kunnr.
***            IF sy-subrc EQ 0.
***              CONCATENATE lt_kna1-name1 lt_kna1-name2
***                     INTO lt_ledger-kname SEPARATED BY space.
***            ENDIF.
***          ELSEIF lt_ledger-lifnr IS NOT INITIAL AND lt_ledger-lname IS INITIAL.
***            READ TABLE lt_lfa1 WITH KEY lifnr = lt_ledger-lifnr.
***            IF sy-subrc EQ 0.
***              CONCATENATE lt_lfa1-name1 lt_lfa1-name2
***                     INTO lt_ledger-lname SEPARATED BY space.
***            ENDIF.
***          ENDIF.
***
***          lv_45day = abs( ls_bkpf-budat - ls_bkpf-bldat ).
***          IF lv_45day > 45 AND is_bukrs-days45 IS NOT INITIAL.
***            lt_ledger-dif45 = 'X'.
***          ENDIF.
***
***          READ TABLE lt_colitm INTO ls_colitm WITH KEY bukrs = lt_bseg-bukrs
***                                                       belnr = lt_bseg-belnr
***                                                       gjahr = lt_bseg-gjahr
***                                                       buzei = lt_bseg-buzei
***                                                       docln = lt_bseg-docln.
***          IF sy-subrc EQ 0.
***            lt_ledger-clitm = 'X'.
***            lt_ledger-cldoc = ls_colitm-cldoc.
***          ENDIF.
***
***          REPLACE ALL OCCURRENCES OF REGEX '[^(0-9)(a-z)(A-Z)( )]' IN lt_ledger-bktxt WITH ''.
***          REPLACE ALL OCCURRENCES OF REGEX '[^(0-9)(a-z)(A-Z)( )]' IN lt_ledger-sgtxt WITH ''.
***          REPLACE ALL OCCURRENCES OF REGEX '[^(0-9)(a-z)(A-Z)( )]' IN lt_ledger-kname WITH ''.
***          REPLACE ALL OCCURRENCES OF REGEX '[^(0-9)(a-z)(A-Z)( )]' IN lt_ledger-lname WITH ''.
***
***
***          IF gs_params-colac IS NOT INITIAL.
***            READ TABLE lt_ledger ASSIGNING <lfs_ledger> WITH KEY belnr = lt_ledger-belnr
***                                                                 hkont = lt_ledger-hkont
***                                                                 shkzg = lt_ledger-shkzg. " AS 26.06.2023
***            IF sy-subrc EQ 0.
***              <lfs_ledger>-dmbtr_def = <lfs_ledger>-dmbtr_def + lt_ledger-dmbtr_def.
***              CONTINUE.
***            ENDIF.
***          ENDIF.
***
***          APPEND lt_ledger.CLEAR lt_ledger.
***
***        ENDLOOP.
***      ENDLOOP.
***
***      DELETE lt_ledger WHERE dmbtr_def = 0.
***
***      TRY.
***          IF iv_ledger IS INITIAL.
****        INSERT /itetr/edf_defky FROM TABLE lt_ledger[].
***            MODIFY /itetr/edf_defky FROM TABLE lt_ledger[].
***            COMMIT WORK AND WAIT.
***          ELSE.
***            APPEND LINES OF lt_ledger TO t_ledger.
***          ENDIF.
***        CATCH cx_root INTO lc_root.
***      ENDTRY.
***    ENDLOOP.
***
***
***
***

  ENDMETHOD.
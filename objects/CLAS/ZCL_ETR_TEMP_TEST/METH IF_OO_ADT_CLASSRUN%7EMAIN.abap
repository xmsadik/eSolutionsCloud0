  METHOD if_oo_adt_classrun~main.
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
    TRY.
        DATA(lo_delivery) = zcl_etr_delivery_operations=>factory( 'TR01' ).
        DATA(lv_html) = lo_delivery->outgoing_delivery_download( iv_document_uid  = 'ovBHSJQ07k{d}{sQ4wJ2YW'
                                                                 iv_content_type  = 'HTML' ).
        DATA(lo_pdf) = cl_rspo_pdf_merger=>create_instance( ).
        lo_pdf->add_document( document = lv_html ).
        DATA(lv_pdf) = lo_pdf->merge_documents( ).
        CHECK lv_pdf IS NOT INITIAL.
      CATCH cx_root INTO DATA(lx_root).
        out->write( 'Hata' ).
        out->write( lx_root->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
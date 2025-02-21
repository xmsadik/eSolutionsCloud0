  METHOD if_oo_adt_classrun~main.
  out->write( 'deneme' ).
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
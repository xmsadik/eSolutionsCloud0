CLASS lhc_ledgerparts DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR LedgerParts RESULT result.

    METHODS LoadExcelContent FOR MODIFY
      IMPORTING keys FOR ACTION LedgerParts~LoadExcelContent RESULT result.

ENDCLASS.

CLASS lhc_ledgerparts IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD LoadExcelContent.



    " Get the first parameter record
    DATA(ls_params) = VALUE #( keys[ 1 ]-%key DEFAULT VALUE #( ) ).




  ENDMETHOD.

ENDCLASS.

CLASS lhc_zetr_ddl_i_created_ledger DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR CreatedLedger RESULT result.

    METHODS create_ledger FOR MODIFY
      IMPORTING keys FOR ACTION CreatedLedger~create_ledger.
    METHODS delete_ledger FOR MODIFY
      IMPORTING keys FOR ACTION CreatedLedger~delete_ledger RESULT result.

    METHODS send_ledger FOR MODIFY
      IMPORTING keys FOR ACTION CreatedLedger~send_ledger RESULT result.

ENDCLASS.

CLASS lhc_zetr_ddl_i_created_ledger IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create_ledger.
    " Data declarations
    DATA: ls_reported TYPE RESPONSE FOR REPORTED zetr_ddl_i_created_ledger,
          gr_budat    TYPE RANGE OF datum,
          gr_belnr    TYPE RANGE OF belnr_d.

    TYPES: BEGIN OF ty_budat,
             sign   TYPE c LENGTH 1,
             option TYPE c LENGTH 2,
             low    TYPE datum,
             high   TYPE datum,
           END OF ty_budat.
    DATA: lr_budat TYPE ty_budat.

    " Get the first parameter record
    DATA(ls_params) = VALUE #( keys[ 1 ]-%param DEFAULT VALUE #( ) ).

    " Simple validations for initial values
    IF ls_params-CompanyCode IS INITIAL.
      APPEND VALUE #( %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-error
                       text     = 'Please fill Company Code' )
                     %element-bukrs = if_abap_behv=>mk-on )
        TO ls_reported-createdledger.
    ENDIF.

    IF ls_params-FiscalYear IS INITIAL.
      APPEND VALUE #( %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-error
                       text     = 'Please fill Fiscal Year' )
                     %element-gjahr = if_abap_behv=>mk-on )
        TO ls_reported-createdledger.
    ENDIF.

    IF ls_params-FinancialPeriod IS INITIAL.
      APPEND VALUE #( %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-error
                       text     = 'Please fill Fiscal Period' )
                     %element-monat = if_abap_behv=>mk-on )
        TO ls_reported-createdledger.
    ENDIF.

    " Check for existing records in defcl table
    SELECT SINGLE @abap_true
      FROM zetr_t_defcl
      WHERE bukrs = @ls_params-CompanyCode
        AND gjahr = @ls_params-FiscalYear
        AND monat = @ls_params-FinancialPeriod
      INTO @DATA(lv_defcl_exists).

    IF lv_defcl_exists IS NOT INITIAL.
      APPEND VALUE #( %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-error
                       text     = 'Girilen Mali Yıl ve Döneme Ait Kayıt Mevcut, Kayıt oluşturalamaz' )
                     %element-bukrs = if_abap_behv=>mk-on
                     %element-gjahr = if_abap_behv=>mk-on
                     %element-monat = if_abap_behv=>mk-on )
        TO ls_reported-createdledger.
    ENDIF.

    " If any validation failed, return messages and exit
    IF ls_reported IS NOT INITIAL.
      reported = CORRESPONDING #( DEEP ls_reported ).
      RETURN.
    ENDIF.

    " If validation passed, proceed with ledger generation
    IF ls_reported IS INITIAL.

      " Create instance of ledger generation class
      DATA(ledger_general) = NEW zcl_etr_ledger_general( ).

      " Prepare date range based on fiscal year and period
      lr_budat-option = 'BT'.
      lr_budat-sign = 'I'.

      " Calculate first and last day of the month
      DATA: lv_first_day TYPE datum,
            lv_last_day  TYPE datum.

      CONCATENATE ls_params-FiscalYear ls_params-FinancialPeriod '01' INTO lv_first_day.

      ledger_general->last_day_of_months(
        EXPORTING
          day_in            = lv_first_day
        RECEIVING
          last_day_of_month = lv_last_day
      ).

      lr_budat-low  = lv_first_day.
      lr_budat-high = lv_last_day.
      APPEND lr_budat TO gr_budat.

      " Generate ledger data
      TRY.
          ledger_general->generate_ledger_data(
            EXPORTING
              i_bukrs  = ls_params-CompanyCode
              i_bcode  = space
              i_tsfyd  = space
              i_ledger = space
              tr_budat = gr_budat
              tr_belnr = gr_belnr
            IMPORTING
              te_return = DATA(lt_return)
              te_ledger = DATA(ledger)
          ).

          ledger_general->set_ledger_partial(
            i_bukrs = ls_params-CompanyCode
            i_monat = ls_params-FinancialPeriod
            i_gjahr = ls_params-FiscalYear
          ).

          ledger_general->process_xml_data(
            EXPORTING
              iv_bukrs       = ls_params-CompanyCode
*              iv_tsfyd       =
*              iv_auto        =
              it_budat_range = gr_budat
            IMPORTING
              ev_subrc       = DATA(lv_subrc)
          ).


          " Process BAPIRET2 messages
          LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<fs_return>).
            CASE <fs_return>-type.
              WHEN 'E' OR 'A'. " Error or Abort
                APPEND VALUE #( %msg = new_message_with_text(
                               severity = if_abap_behv_message=>severity-error
                               text     = <fs_return>-message )
                             %element-bukrs = if_abap_behv=>mk-on )
                  TO ls_reported-createdledger.

              WHEN 'W'. " Warning
                APPEND VALUE #( %msg = new_message_with_text(
                               severity = if_abap_behv_message=>severity-warning
                               text     = <fs_return>-message )
                             %element-bukrs = if_abap_behv=>mk-on )
                  TO ls_reported-createdledger.

              WHEN 'I' OR 'S'. " Information or Success
                APPEND VALUE #( %msg = new_message_with_text(
                               severity = if_abap_behv_message=>severity-success
                               text     = <fs_return>-message )
                             %element-bukrs = if_abap_behv=>mk-on )
                  TO ls_reported-createdledger.
            ENDCASE.
          ENDLOOP.

          " If no messages were returned, add a default success message
          IF lt_return IS INITIAL.
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-success
                           text     = |Ledger generated successfully for Company Code { ls_params-CompanyCode }| )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          ENDIF.

        CATCH cx_root INTO DATA(lx_error).
          " Handle any exceptions
          APPEND VALUE #( %msg = new_message_with_text(
                         severity = if_abap_behv_message=>severity-error
                         text     = lx_error->get_text( ) )
                       %element-bukrs = if_abap_behv=>mk-on )
            TO ls_reported-createdledger.
      ENDTRY.
    ENDIF.

    " Return messages
    reported = CORRESPONDING #( DEEP ls_reported ).


  ENDMETHOD.

  METHOD delete_ledger.
    " Data declarations
    DATA: ls_reported TYPE RESPONSE FOR REPORTED zetr_ddl_i_created_ledger.
    DATA(ledger_general) = NEW zcl_etr_ledger_general( ).

    " Read selection parameters
    READ ENTITIES OF zetr_ddl_i_created_ledger IN LOCAL MODE
        ENTITY CreatedLedger
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(lt_params).

    " Get the first parameter record
    DATA(ls_params) = VALUE #( keys[ 1 ]-%key DEFAULT VALUE #( ) ).

    " Perform deletion logic
    TRY.
        ledger_general->delete_ledger(
            EXPORTING
              iv_bukrs  = ls_params-bukrs
              iv_gjahr  = ls_params-gjahr
              iv_monat  = ls_params-monat
            RECEIVING
              rs_return = DATA(return_message)
          ).

        " Process BAPIRET2 messages
        CASE return_message-type.
          WHEN 'S'. " Success
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-success
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          WHEN 'E'. " Error
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          WHEN 'W'. " Warning
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-warning
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          WHEN 'I'. " Information
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-information
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
        ENDCASE.


      CATCH cx_root INTO DATA(lx_error).
        " Handle any exceptions
        APPEND VALUE #( %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-error
                       text     = lx_error->get_text( ) )
                     %element-bukrs = if_abap_behv=>mk-on )
          TO ls_reported-createdledger.
    ENDTRY.

    " Return messages
    reported = CORRESPONDING #( DEEP ls_reported ).

  ENDMETHOD.

  METHOD send_ledger.
    " Data declarations
    DATA: ls_reported TYPE RESPONSE FOR REPORTED zetr_ddl_i_created_ledger.
    DATA(ledger_general) = NEW zcl_etr_ledger_general( ).
    " Read selection parameters
    READ ENTITIES OF zetr_ddl_i_created_ledger IN LOCAL MODE
        ENTITY CreatedLedger
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(lt_params).

    " Get the first parameter record
    DATA(ls_params) = VALUE #( keys[ 1 ]-%key DEFAULT VALUE #( ) ).

    TRY.
        ledger_general->send_ledger_to_service(
          EXPORTING
           iv_bukrs  = ls_params-bukrs
           iv_gjahr  = ls_params-gjahr
           iv_monat  = ls_params-monat
          IMPORTING
            ev_return = DATA(return_message)
        ).

        " Process messages
        CASE return_message-type.
          WHEN 'S'. " Success
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-success
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          WHEN 'E'. " Error
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          WHEN 'W'. " Warning
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-warning
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
          WHEN 'I'. " Information
            APPEND VALUE #( %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-information
                           text     = return_message-message )
                         %element-bukrs = if_abap_behv=>mk-on )
              TO ls_reported-createdledger.
        ENDCASE.

      CATCH cx_root INTO DATA(lx_error).
        " Handle any exceptions
        APPEND VALUE #( %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-error
                       text     = lx_error->get_text( ) )
                     %element-bukrs = if_abap_behv=>mk-on )
          TO ls_reported-createdledger.
    ENDTRY.

    " Return messages
    reported = CORRESPONDING #( DEEP ls_reported ).

  ENDMETHOD.

ENDCLASS.
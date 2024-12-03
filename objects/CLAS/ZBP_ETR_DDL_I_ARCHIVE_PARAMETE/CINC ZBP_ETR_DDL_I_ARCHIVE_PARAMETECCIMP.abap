CLASS lhc_zetr_ddl_i_archive_serials DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS checkSerials FOR VALIDATE ON SAVE
      IMPORTING keys FOR zetr_ddl_i_archive_serials~checkSerials.

ENDCLASS.

CLASS lhc_zetr_ddl_i_archive_serials IMPLEMENTATION.

  METHOD checkSerials.
    READ ENTITIES OF zetr_ddl_i_archive_parameters IN LOCAL MODE
      ENTITY zetr_ddl_i_archive_serials
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_serials).
    CHECK sy-subrc = 0.

    READ ENTITIES OF zetr_ddl_i_archive_parameters IN LOCAL MODE
      ENTITY zetr_ddl_i_archive_parameters
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_parameters).
    CHECK sy-subrc = 0.

    LOOP AT lt_serials INTO DATA(ls_serial).
      READ TABLE lt_parameters
        INTO DATA(ls_parameter)
        WITH TABLE KEY id
        COMPONENTS CompanyCode = ls_serial-CompanyCode.
      CHECK sy-subrc = 0.
      CASE ls_parameter-GenerateSerial.
        WHEN 'D'.
          IF strlen( ls_serial-NumberRangeNumber ) <> 1.
            APPEND VALUE #( %msg = new_message( id       = 'ZETR_COMMON'
                                                number   = '214'
                                                severity = if_abap_behv_message=>severity-error ) ) TO reported-zetr_ddl_i_archive_parameters.
          ENDIF.
        WHEN 'X'.
          IF strlen( ls_serial-NumberRangeNumber ) <> 2.
            APPEND VALUE #( %msg = new_message( id       = 'ZETR_COMMON'
                                                number   = '215'
                                                severity = if_abap_behv_message=>severity-error ) ) TO reported-zetr_ddl_i_archive_parameters.
          ENDIF.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zetr_ddl_i_archive_paramet DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zetr_ddl_i_archive_parameters RESULT result.

ENDCLASS.

CLASS lhc_zetr_ddl_i_archive_paramet IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
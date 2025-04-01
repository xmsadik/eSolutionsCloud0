  METHOD if_oo_adt_classrun~main.
    SELECT SINGLE bukrs
      FROM zetr_t_cmpin
      INTO @DATA(lv_exists).
    IF lv_exists IS NOT INITIAL.
      TRY.
          DATA: ls_job_info TYPE cl_apj_rt_api=>ty_job_info.
          GET TIME STAMP FIELD DATA(lv_timestamp).
          TRY.
              DATA(lv_timezone) = cl_abap_context_info=>get_user_time_zone( ).
            CATCH cx_abap_context_info_error.
          ENDTRY.
          lv_timestamp += 1000.
          cl_apj_rt_api=>schedule_job_commit_immstart(
            EXPORTING
                iv_job_template_name = 'ZETR_AJT_INVOICE_USERS'
                iv_job_text = 'eSolutions - Invoice Users'
                is_start_info = VALUE #( start_immediately = abap_true )
            IMPORTING
              ev_jobname = DATA(lv_jobname)
              ev_jobcount = DATA(lv_jobcount)
              et_message = DATA(lt_message) ).
*          cl_apj_rt_api=>schedule_job(
*            EXPORTING
*                iv_job_template_name = 'ZETR_AJT_INVOICE_USERS'
*                iv_job_text = 'eSolutions - Invoice Users'
*                is_start_info = VALUE #( timestamp = lv_timestamp )
*                is_scheduling_info = VALUE #( periodic_granularity = abap_false
*                                              timezone = lv_timezone )
*                it_job_parameter_value = VALUE #( ( name = 'P_BUKRS'
*                                                    t_value = VALUE #( ( sign = 'I'
*                                                                         option = 'EQ'
*                                                                         low = lv_exists ) ) ) )
*            IMPORTING
*              ev_jobname = DATA(lv_jobname)
*              ev_jobcount = DATA(lv_jobcount)
*              et_message = DATA(lt_message) ).
          IF lv_jobname IS INITIAL OR line_exists( lt_message[ type = 'E' ] ).
            LOOP AT lt_message INTO DATA(ls_message).
              MESSAGE ID ls_message-id TYPE ls_message-type NUMBER ls_message-number
                      WITH ls_message-message_v1 ls_message-message_v2 ls_message-message_v3 ls_message-message_v4
                      INTO ls_message-message.
              out->write( ls_message-message ).
            ENDLOOP.
          ELSE.
            ls_job_info = cl_apj_rt_api=>get_job_details( iv_jobname = lv_jobname
                                                          iv_jobcount = lv_jobcount ).
            MESSAGE ID 'ZETR_COMMON' TYPE 'E' NUMBER '082'
                    INTO ls_message-message.
            out->write( ls_message-message ).
          ENDIF.
        CATCH cx_apj_rt INTO DATA(lx_regulative_exception).
          MESSAGE ID 'ZETR_COMMON' TYPE 'E' NUMBER '000' WITH lx_regulative_exception->get_text( )
                  INTO ls_message-message.
          out->write( ls_message-message ).
      ENDTRY.
    ELSE.
      MESSAGE ID 'ZETR_COMMON' TYPE 'E' NUMBER '001'
              INTO ls_message-message.
      out->write( ls_message-message ).
    ENDIF.
  ENDMETHOD.
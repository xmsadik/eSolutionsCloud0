  METHOD build_delivery_data_likp_head.
    IF ms_outdel_data-likp-wbstk <> 'C' AND ms_outdel_data-likp-wbstk <> ''.
      RAISE EXCEPTION TYPE zcx_etr_regulative_exception
        MESSAGE e230(zetr_common).
    ENDIF.
    build_delivery_data_common_hdr( ).
  ENDMETHOD.
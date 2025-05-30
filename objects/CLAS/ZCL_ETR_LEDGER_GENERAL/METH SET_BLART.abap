  METHOD set_blart.
    CLEAR:gt_blart,gt_blart[],gr_blart,gr_blart[].

    SELECT *
      FROM zetr_t_beltr
      INTO CORRESPONDING FIELDS OF TABLE @gt_blart.
*   WHERE bukrs = gv_bukrs.                          "YiğitcanÖ. 1307023 Closed.

    SELECT *
      FROM zetr_t_rbzgb
     WHERE bukrs = @gv_bukrs
     INTO TABLE @gt_check_ref.

    LOOP AT gt_blart ASSIGNING FIELD-SYMBOL(<ls_blart>).
      READ TABLE gt_check_ref WITH KEY gbtur = <ls_blart>-gbtur TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        <ls_blart>-refob = 'X'.
      ENDIF.
    ENDLOOP.

    LOOP AT gt_blart INTO DATA(ls_blart).
      APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_blart-blart ) TO gr_blart.

      IF ls_blart-ocblg EQ 'O'.
        APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_blart-blart ) TO gr_ablart.
      ELSEIF ls_blart-ocblg EQ 'C'.
        APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_blart-blart ) TO gr_kblart.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
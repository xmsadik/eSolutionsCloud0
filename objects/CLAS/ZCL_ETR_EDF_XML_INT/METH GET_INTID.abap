  METHOD get_intid.

    SELECT SINGLE intid
           FROM zetr_t_srkdb
           WHERE bukrs EQ @iv_bukrs
           INTO @rv_intid.

  ENDMETHOD.
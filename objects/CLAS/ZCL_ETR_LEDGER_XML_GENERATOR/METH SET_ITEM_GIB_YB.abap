  METHOD set_item_gib_yb.

    DATA lv_line TYPE i.
    FIELD-SYMBOLS <fs_entryheader> TYPE zif_etr_edf_xml_yb=>ty_entryheader.
    FIELD-SYMBOLS <fs_entrydetail> TYPE zif_etr_edf_xml_yb=>ty_entrydetail.

    lv_line = lines( ms_root_gib_yb-accountingentries-entryheader ).

    READ TABLE ms_root_gib_yb-accountingentries-entryheader ASSIGNING <fs_entryheader> INDEX lv_line.
    CHECK <fs_entryheader> IS ASSIGNED.

    READ TABLE <fs_entryheader>-entrydetail ASSIGNING <fs_entrydetail> WITH KEY account-accountmainid-content = is_item-accountmainid
                                                                                debitcreditcode-content       = is_item-debitcreditcode.
    CHECK <fs_entrydetail> IS ASSIGNED.
    ADD is_item-item-dmbtr_def TO <fs_entrydetail>-amount-content.
    CONDENSE <fs_entrydetail>-amount-content NO-GAPS.

  ENDMETHOD.
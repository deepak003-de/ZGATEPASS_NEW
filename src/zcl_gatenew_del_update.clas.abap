CLASS zcl_gatenew_del_update DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS default_inventory_id          TYPE c LENGTH 1                        VALUE '1'.
    CONSTANTS wait_time_in_seconds          TYPE i                                 VALUE 5.
    CONSTANTS selection_name                TYPE c LENGTH 8                        VALUE 'INVENT'.
    CONSTANTS selection_description         TYPE c LENGTH 255                      VALUE 'Inventory data'.
    CONSTANTS application_log_object_name   TYPE if_bali_object_handler=>ty_object VALUE 'ZAPP_GATEDEL_ALOG_01'.
    CONSTANTS application_log_sub_obj1_name TYPE if_bali_object_handler=>ty_object VALUE 'ZAPP_GATEDEL_ALOGS_01'.

    INTERFACES if_apj_dt_exec_object.
    INTERFACES if_apj_rt_exec_object.
    INTERFACES if_oo_adt_classrun.

    METHODS constructor.

  PRIVATE SECTION.
    METHODS add_text_to_app_log_or_console
      IMPORTING i_text TYPE cl_bali_free_text_setter=>ty_text
      RAISING   cx_bali_runtime.

    DATA out             TYPE REF TO if_oo_adt_classrun_out.
    DATA application_log TYPE REF TO if_bali_log.
ENDCLASS.



CLASS ZCL_GATENEW_DEL_UPDATE IMPLEMENTATION.


  METHOD add_text_to_app_log_or_console.
    IF sy-batch = abap_true.
      FINAL(application_log_free_text) = cl_bali_free_text_setter=>create(
                                             severity = if_bali_constants=>c_severity_status
                                             text     = i_text ).
      application_log_free_text->set_detail_level( detail_level = '1' ).
      application_log->add_item( item = application_log_free_text ).
      cl_bali_log_db=>get_instance( )->save_log( log = application_log
*                                                 assign_to_current_appl_job = abap_true
                                                 ).
    ELSE.
      out->write( |sy-batch = abap_false | ).
      out->write( i_text ).
    ENDIF.
  ENDMETHOD.


  METHOD constructor.
    TRY.
        application_log = cl_bali_log=>create_with_header(
                              header = cl_bali_header_setter=>create( object      = 'ZAPP_GATEDEL_01_LOG'
                                                                      subobject   = 'ZAPP_GATEDEL_01_SUB'
                                                                      external_id = 'External ID' ) ).
      CATCH cx_bali_runtime.
        "handle exception
    ENDTRY.
  ENDMETHOD.


  METHOD if_apj_dt_exec_object~get_parameters.

  ENDMETHOD.


  METHOD if_apj_rt_exec_object~execute.

*    DATA : lv_gatepass TYPE char10.
*    DATA : ls_delupd TYPE zdt_del_qty.
*    DATA : lv_qty TYPE menge_d.
*    DATA : lv_date TYPE datum.
*    lv_date = sy-datum - 31.
*    DATA : lv_date1 TYPE datum.
*    lv_date = sy-datum - 61.
*
*
*    SELECT * FROM i_deliverydocument
*    WHERE creationdate >= @lv_date
*    INTO TABLE @DATA(lt_del).
*
*    DELETE lt_del WHERE yy1_gatepass_dlh IS INITIAL.
*
*    SELECT * FROM zdt_del_qty
*    WHERE creationdate >= @lv_date1
*    INTO TABLE @DATA(lt_upd)
*    .
*    LOOP AT lt_del ASSIGNING FIELD-SYMBOL(<fs_del>).
*      IF <fs_del> IS ASSIGNED.
*
*
*        lv_gatepass = <fs_del>-yy1_gatepass_dlh.
*        lv_gatepass = |{ lv_gatepass ALPHA = IN }|.
*
*        SELECT * FROM i_deliverydocumentitem
*        WHERE deliverydocument = @<fs_del>-deliverydocument
*        INTO TABLE @DATA(lt_delitem).
*        IF sy-subrc = 0.
*          LOOP AT lt_delitem ASSIGNING FIELD-SYMBOL(<fs_delitem>).
*            READ TABLE lt_upd INTO DATA(wa_upd) WITH KEY delivery = <fs_del>-deliverydocument deliveryitem  = <fs_delitem>-deliverydocumentitem .
*            IF sy-subrc <> 0.
*
*              SELECT SINGLE *
*                  FROM zv_gateitem
*                  WHERE gatepassno = @lv_gatepass
*                  AND salesorder = @<fs_delitem>-referencesddocument
*                  AND gateitem = @<fs_delitem>-referencesddocumentitem
*                  INTO  @DATA(ls_gateitem).
*              IF sy-subrc = 0.
*                lv_qty = ls_gateitem-qtyactual.
**                lv_qty = lv_qty / 1000.
*
*                MODIFY ENTITIES OF i_outbounddeliverytp
*                       ENTITY outbounddeliveryitem
*                       UPDATE
*                       FIELDS ( actualdeliveredqtyinorderunit orderquantityunit )
*                       WITH VALUE #( ( actualdeliveredqtyinorderunit          = lv_qty
*                                       PickQuantityInBaseUnit = lv_qty
*                                       PickQuantityInOrderUnit = lv_qty
*                                       %control-PickQuantityInBaseUnit = if_abap_behv=>mk-on
*                                       %control-PickQuantityInOrderUnit = if_abap_behv=>mk-on
*                                       %control-actualdeliveredqtyinorderunit = if_abap_behv=>mk-on
*                                       orderquantityunit                      = <fs_delitem>-BaseUnit
*                                       %control-orderquantityunit             = if_abap_behv=>mk-on
*                                       %tky-outbounddelivery                  = <fs_delitem>-deliverydocument
*                                       %tky-outbounddeliveryitem              = <fs_delitem>-deliverydocumentitem ) )
*                       FAILED   FINAL(ls_failed_upd)
*                       REPORTED FINAL(ls_reported_upd).
*
*                IF ls_failed_upd IS INITIAL AND ls_reported_upd IS INITIAL.
*
*                  COMMIT ENTITIES BEGIN
*                  RESPONSE OF i_outbounddeliverytp
*                  FAILED DATA(lt_commit_failed)
*                  REPORTED DATA(lt_commit_reported).
*                  COMMIT ENTITIES END.
*
*                  ls_delupd-delivery = <fs_delitem>-deliverydocument.
*                  ls_delupd-deliveryitem = <fs_delitem>-deliverydocumentitem.
*                  ls_delupd-creationdate = sy-datum.
*                  ls_delupd-flag = 'X'.
*                  MODIFY zdt_del_qty FROM @ls_delupd.
*                  CLEAR : ls_delupd.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*          ENDLOOP.
*        ENDIF.
*      ENDIF.
*    ENDLOOP.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA et_parameters TYPE if_apj_rt_exec_object=>tt_templ_val.

    TRY.
        "
        if_apj_rt_exec_object~execute( it_parameters = et_parameters ).
        out->write( |Finished| ).
        "
      CATCH cx_root INTO FINAL(job_scheduling_exception). " TODO: variable is assigned but only used in commented-out code (ABAP cleaner) " TODO: variable is assigned but never used (ABAP cleaner)
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

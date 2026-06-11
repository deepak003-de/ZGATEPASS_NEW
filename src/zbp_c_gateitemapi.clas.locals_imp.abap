CLASS lhc_zc_gateitemapi DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zc_gateitemapi RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zc_gateitemapi.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zc_gateitemapi.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zc_gateitemapi.

    METHODS read FOR READ
      IMPORTING keys FOR READ zc_gateitemapi RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zc_gateitemapi.

ENDCLASS.

CLASS lhc_zc_gateitemapi IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

***    DATA : ls_item TYPE zdt_gate_item.
***    DATA(lt_entities) = entities.
***    LOOP AT lt_entities ASSIGNING FIELD-SYMBOL(<fs>).
***      <fs>-grossqty = <fs>-grossqty .
***      <fs>-tareqty = <fs>-tareqty.
***      <fs>-qtyactual = <fs>-grossqty - <fs>-tareqty .
***      ls_item = CORRESPONDING #( <fs> ).
***
****      ls_item-wuom = 'MT'.
****      ls_item-tareqty = ls_item-tareqty  / 1000.
****      ls_item-grossqty = ls_item-grossqty  / 1000.
***
***       IF ls_item-wuom IS NOT INITIAL.
***        UPDATE zdt_gate_item SET wuom = @ls_item-wuom
***        WHERE gatepassno = @ls_item-gatepassno AND gateitemapi = @ls_item-gateitemapi.
***      ENDIF.
***
***      IF ls_item-weighbentrydate IS NOT INITIAL.
***        UPDATE zdt_gate_item SET weighbentrydate = @ls_item-weighbentrydate, weighbentrytime = @ls_item-weighbentrytime
***        WHERE gatepassno = @ls_item-gatepassno AND gateitemapi = @ls_item-gateitemapi.
***      ENDIF.
***
***      IF ls_item-weighbexitdate IS NOT INITIAL.
***        UPDATE zdt_gate_item SET weighbexitdate = @ls_item-weighbexitdate, weighbexittime = @ls_item-weighbexittime
***        WHERE gatepassno = @ls_item-gatepassno AND gateitemapi = @ls_item-gateitemapi.
***      ENDIF.
***
***      IF ls_item-tareqty  IS NOT INITIAL.
***
***
***        UPDATE zdt_gate_item SET tareqty = @ls_item-tareqty WHERE gatepassno = @ls_item-gatepassno AND gateitemapi = @ls_item-gateitemapi.
***      ENDIF.
***
***      IF ls_item-grossqty IS NOT INITIAL.
***
***        UPDATE zdt_gate_item SET grossqty = @ls_item-grossqty WHERE gatepassno = @ls_item-gatepassno AND gateitemapi = @ls_item-gateitemapi.
***      ENDIF.
***
***      IF ls_item-grossqty IS NOT INITIAL AND ls_item-tareqty IS NOT INITIAL.
***        ls_item-qtyactual = ls_item-grossqty - ls_item-tareqty.
***        UPDATE zdt_gate_item SET qtyactual = @ls_item-qtyactual WHERE gatepassno = @ls_item-gatepassno AND gateitemapi = @ls_item-gateitemapi.
***      ENDIF.
***
***    ENDLOOP.

    DATA: ls_head TYPE zdt_gatehead.
    DATA: ls_head_final TYPE zdt_gatehead.

    DATA(lt_entities) = entities.
    LOOP AT lt_entities ASSIGNING FIELD-SYMBOL(<fs>).
      <fs>-overallqtyactual = <fs>-overallgrossqty - <fs>-overalltareqty .

      ls_head = CORRESPONDING #( <fs> ).

      IF ls_head-wuom IS NOT INITIAL.
        UPDATE zdt_gatehead SET wuom = @ls_head-wuom
        WHERE gatepassno = @ls_head-gatepassno .
      ENDIF.

      IF ls_head-weighbentrydate IS NOT INITIAL.
        UPDATE zdt_gatehead SET weighbentrydate = @ls_head-weighbentrydate, weighbentrytime = @ls_head-weighbentrytime
        WHERE gatepassno = @ls_head-gatepassno .
      ENDIF.

      IF ls_head-weighbexitdate IS NOT INITIAL.
        UPDATE zdt_gatehead SET weighbexitdate = @ls_head-weighbexitdate, weighbexittime = @ls_head-weighbexittime
       WHERE gatepassno = @ls_head-gatepassno .
      ENDIF.

      IF <fs>-overalltareqty  IS NOT INITIAL.
        UPDATE zdt_gatehead SET tareqty = @<fs>-overalltareqty WHERE gatepassno = @ls_head-gatepassno .
      ENDIF.

      IF <fs>-overallgrossqty IS NOT INITIAL.
        UPDATE zdt_gatehead SET grossqty = @<fs>-overallgrossqty WHERE gatepassno = @ls_head-gatepassno .
      ENDIF.

      IF <fs>-overallgrossqty IS NOT INITIAL AND <fs>-overalltareqty IS NOT INITIAL.
        UPDATE zdt_gatehead SET qtyactual = @<fs>-overallqtyactual WHERE gatepassno = @ls_head-gatepassno .
      ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zc_gateitemapi DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zc_gateitemapi IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

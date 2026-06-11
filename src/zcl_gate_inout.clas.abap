CLASS zcl_gate_inout DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GATE_INOUT IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA lt_original_data1 TYPE STANDARD TABLE OF zc_po_details WITH DEFAULT KEY.
    lt_original_data1 = CORRESPONDING #( it_original_data ).
    LOOP AT lt_original_data1 ASSIGNING FIELD-SYMBOL(<fs_original_data>).

      IF <fs_original_data>-id IS NOT INITIAL.
        SELECT SINGLE movementtype, materialprocess
        FROM zdt_gatehead
        WHERE id = @<fs_original_data>-id
        INTO @DATA(lv_movementtype).


        IF sy-subrc = 0.
***SAR Team added by 26-11-2025----
          IF lv_movementtype-movementtype = 'OUTWARD' and lv_movementtype-materialprocess = 'RGP'.
            <fs_original_data>-showso = abap_false.
            <fs_original_data>-showpo =  abap_true .
***SAR Team added by 26-11-2025----
          ELSEif lv_movementtype-movementtype = 'OUTWARD' and lv_movementtype-materialprocess ne 'RGP'.
            <fs_original_data>-showso = abap_true .
            <fs_original_data>-showpo =  abap_false .

            else.
            <fs_original_data>-showpo = abap_true .
            <fs_original_data>-showso =  abap_false .

            ENDIF.
        ELSE.
         SELECT SINGLE movementtype,materialprocess
         FROM zdr_gatehead
         WHERE id = @<fs_original_data>-id
         INTO @DATA(lv_matprocess).


***SAR Team added by 26-11-2025----
          IF sy-subrc = 0.
            IF lv_matprocess-movementtype = 'OUTWARD' and lv_matprocess-materialprocess = 'RGP'.
            <fs_original_data>-showso = abap_false.
            <fs_original_data>-showpo =  abap_true.
***SAR Team added by 26-11-2025----
          ELSEif lv_matprocess-movementtype = 'OUTWARD' and lv_movementtype-materialprocess ne 'RGP'.
            <fs_original_data>-showso = abap_true .
            <fs_original_data>-showpo =  abap_false .

            ELSE.
            <fs_original_data>-showpo = abap_true .
            <fs_original_data>-showso =  abap_false .
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( lt_original_data1 ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.
ENDCLASS.

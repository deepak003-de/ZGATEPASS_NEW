CLASS lhc_zi_transporter DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zi_transporter RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_transporter RESULT result.

    METHODS headerdet FOR DETERMINE ON SAVE
      IMPORTING keys FOR zi_transporter~headerdet.

ENDCLASS.

CLASS lhc_zi_transporter IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD headerdet.

      DATA nr_number      TYPE cl_numberrange_runtime=>nr_number.
    DATA: lv_numb TYPE zdegate.

     DATA lv_date TYPE datn.
    DATA lv_time TYPE timn.

    READ ENTITIES OF zi_transporter IN LOCAL MODE
           ENTITY zi_transporter
           ALL FIELDS  WITH CORRESPONDING #( keys )
           RESULT DATA(gt_header) FAILED DATA(failed).
    loop at gt_header ASSIGNING FIELD-SYMBOL(<fs_head>).
    if <fs_head> is ASSIGNED.
    if <fs_head>-Trasnporterno is INITIAL.
        TRY.
            cl_numberrange_runtime=>number_get( " generating number
                                                EXPORTING nr_range_nr = '01'
                                                          object      = 'ZNR_TRANS'
                                                IMPORTING number      = nr_number ).
            IF nr_number IS NOT INITIAL.
              lv_numb = nr_number+10(10).
            ENDIF.
          CATCH cx_nr_object_not_found.
          CATCH cx_number_ranges.
        ENDTRY.
      else.
      lv_numb = <fs_head>-Trasnporterno.
      endif.
       TRY.
        CONVERT DATE cl_abap_context_info=>get_system_date( ) TIME cl_abap_context_info=>get_system_time( )
                INTO TIME STAMP FINAL(lv_timestamp) TIME ZONE cl_abap_context_info=>get_user_time_zone( ).
      CATCH cx_abap_context_info_error.
    ENDTRY.

    CONVERT TIME STAMP lv_timestamp TIME ZONE 'INDIA' INTO DATE lv_date TIME lv_time.

     <fs_head>-createdon = lv_date.

        MODIFY ENTITIES OF zi_transporter IN LOCAL MODE
                ENTITY zi_transporter
                UPDATE
                FIELDS ( Trasnporterno createdon )
                WITH VALUE #( ( %tky          = <fs_head>-%tky
                                 Trasnporterno = lv_numb
                                 createdon = <fs_head>-createdon
                                ) ).
    endif.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

CLASS zcl_gate_impl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GATE_IMPL IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    IF NOT io_request->is_data_requested(  ).
      RETURN.
    ENDIF.

    DATA(lo_filter) = io_request->get_filter(  ).
    TRY.
        DATA(lt_range) = lo_filter->get_as_ranges(  ).
      CATCH cx_rap_query_filter_no_range.
    ENDTRY.

    IF NOT line_exists( lt_range[ name = 'ID' ] ).
      "Need select parameter!
      RETURN.
    ENDIF.
    DATA rt_table TYPE TABLE OF zzvvgatehead.
    DATA: lv_gate TYPE zzvvgatehead-gatepassno.
*    "" ++ 28.07.25 BY SP
    data lvgateno type c length 10 .
    DATA: lv_gateno TYPE zzvvgatehead-gatepassno.
    DATA : lv_grnno1 TYPE i_materialdocumentitemtp-materialdocument.


    LOOP AT lt_range[ name = 'ID' ]-range ASSIGNING FIELD-SYMBOL(<ls_range>).
      DATA(lv_id) = <ls_range>-low.
      SELECT SINGLE * FROM zdt_gatehead
        WHERE id = @lv_id
         INTO @DATA(ls_gatehead).

      IF ls_gatehead-customerno IS NOT INITIAL.
        DATA(ls_cust) = ls_gatehead-customerno.
      ELSE.
        ls_cust = ls_gatehead-supplierno.
      ENDIF.

      SELECT SINGLE uom , SUM( qtyactual ) AS totalqty FROM zdt_gate_item
       WHERE id = @lv_id
       GROUP BY uom
       INTO @DATA(ls_qty).

      SELECT SINGLE * FROM zdt_gate_item
      WHERE id = @lv_id
      INTO @DATA(ls_so).

      SELECT SINGLE * FROM zi_i_salesdocumentitem
      WHERE salesdocument = @ls_so-salesorder
      INTO @DATA(ls_sodocitem).

*      "" ++ 28.07.25 sp
      SELECT SINGLE * FROM ZI_I_purchaseorderitem
      where PurchaseOrder = @ls_so-purchaseorder
      into @DATA(ls_podocitem).
*      "" ++ 28.07.25 sp

      SELECT SINGLE * FROM zdt_ccodeaddress "zi_dttmg
      WHERE bukrs = @ls_sodocitem-salesorganization or bukrs = @ls_podocitem-CompanyCode  "" ++ 28.07.25 or bukrs = @ls_podocitem-CompanyCode
      INTO @DATA(ls_companyname).

      SELECT SINGLE * FROM zdt_isogst_det "zi_gstisodetails
      WHERE plant_no = @ls_sodocitem-plant or plant_no = @ls_podocitem-Plant            "" ++ 28.07.25 or plant_no = @ls_podocitem-Plant
      INTO @DATA(ls_plantadress).

      lvgateno = ls_gatehead-gatepassno .

"select query for grn no
      SELECT single MaterialDocument from ZI_GRNNO
*      where yy1_gatepass_mmi = @ls_gatehead-gatepassno
      where gatepassno = @lvgateno
      into @lV_grnno1.



      IF ls_gatehead-movementtype = 'OUTWARD'.
        DATA : lv_inv TYPE i_billingdocument-billingdocument.
        DATA : lv_billdate TYPE   i_billingdocument-billingdocumentdate.

        lv_inv =   ls_gatehead-taxinvoice.
        lv_inv = |{ lv_inv ALPHA = IN }|.
        SELECT SINGLE billingdocumentdate FROM zv_billdoc
        WHERE billingdocument = @lv_inv
        INTO @lv_billdate.
        ls_gatehead-invoicedate = lv_billdate.
        ls_gatehead-invoiceno = lv_inv.
      ENDIF.
      lv_gate = ls_gatehead-gatepassno.
      lv_gate = |{ lv_gate ALPHA = OUT }|.

      INSERT VALUE zzvvgatehead(
       id   =   ls_gatehead-id
        gatepassno  =   lv_gate
        movementtype    =   ls_gatehead-movementtype
        materialprocess     =   ls_gatehead-materialprocess
        entrydate   =   ls_gatehead-entrydate
        entrytime   =   ls_gatehead-entrytime
        exitdate    =   ls_gatehead-exitdate
        exittime    =   ls_gatehead-exittime
        supplierno  =   ls_gatehead-supplierno
        supplierdesc    =   ls_gatehead-supplierdesc
        customerno  =   ls_cust      "ls_gatehead-customerno
      customerdesc    =   ls_gatehead-customerdesc
      vehicleno   =   ls_gatehead-vehicleno
      trasporterno    =   ls_gatehead-trasporterno
      transportername     =   ls_gatehead-transportername
      lrrrno  =   ls_gatehead-lrrrno
      lrrrdate    =   ls_gatehead-lrrrdate
      invoicedate     =   ls_gatehead-invoicedate
      waybillno   =   ls_gatehead-waybillno
      invoiceno   =   ls_gatehead-invoiceno
      tsetout     =   ls_gatehead-tsetout
      tprint  =   ls_gatehead-tprint
      tgate   =   ls_gatehead-tgate
      status  =   ls_gatehead-status
      createdon   =   ls_gatehead-createdon
      createdat   =   ls_gatehead-createdat
      remarks     =   ls_gatehead-remarks
      transportergst  =   ls_gatehead-transportergst
      taxinvoice  =   ls_gatehead-taxinvoice
      packingwt   =   ls_gatehead-packingwt
      qtyuom = ls_qty-uom
      qtyactual = ls_qty-totalqty
      uom = ls_gatehead-uom
      invoicevalue = ls_gatehead-invoicevalue
      source = ls_gatehead-source
      destination = ls_gatehead-destination
      createdby = ls_gatehead-createdby
      createdbyname = ls_gatehead-createdbyname
      drivername    = ls_gatehead-drivername
      companyname = ls_companyname-legalname
      plantadress = ls_plantadress-plant_address
      grnno       = lV_grnno1
    ) INTO TABLE rt_table.

    ENDLOOP.

    io_response->set_data( rt_table ).
    io_response->set_total_number_of_records( lines( rt_table ) ).
  ENDMETHOD.
ENDCLASS.

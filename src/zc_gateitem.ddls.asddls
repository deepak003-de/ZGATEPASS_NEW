@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
@EndUserText.label: 'Projection view for item'
define view entity ZC_GATEITEM
  as projection on ZI_GATEITEM
{
      @EndUserText.label: 'ID'
  key Id,
      @EndUserText.label: 'Item'
  key item,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Purchase Order'
      Purchaseorder,
      @EndUserText.label: 'PO/SO Item'
      gateitem,
      @EndUserText.label: 'Purchase Order Item'
      gatepassno,
      @EndUserText.label: 'Gate Item Api'
      gateitemapi,
      @EndUserText.label: 'Material'
      Material,
      @EndUserText.label: 'Material desc'
      Materialdesc,
      @EndUserText.label: 'Order UOM'
      Uom,
      @EndUserText.label: 'Weight UOM'
      wuom,
      @EndUserText.label: 'Quantity in PO/SO'
      Qty,
      @EndUserText.label: 'Maximum Quantity'
      maxqty,
      @EndUserText.label: 'Available Quantity'
      avlqty,
      @EndUserText.label: 'Gross Quantity'
      grossqty,
      @EndUserText.label: 'Tare Quantity'
      tareqty,
      @EndUserText.label: 'Sold/Received Quantity' //'Receive Quantity' //'Actual Quantity'
      Qtybought,
      @EndUserText.label: 'Weighment Quantity'
      Qtyactual,
      tconfirm,
      tgr,
      @EndUserText.label: 'Confirmation of User Department'
      fconfirm,
      @EndUserText.label: 'GR Posted'
      gr,
      @EndUserText.label: 'Sales Order'
      salesorder,
      @EndUserText.label: 'Storage Location'
      storagelocation,
      @EndUserText.label: 'Gross Weight'
      bgross,
      @EndUserText.label: 'Net Weight'
      bnet,
      @EndUserText.label: 'Weighment Entry Date'
      weighbentrydate,
      @EndUserText.label: 'Weighment Entry Time'
      weighbentrytime,
      @EndUserText.label: 'Weighment Exit Date'
      weighbexitdate,
      @EndUserText.label: 'Weighment Exit Time'
      weighbexittime,
      @EndUserText.label: 'Posting Log'
      postinglog,
      sconfirm,
      @EndUserText.label: 'Confirmation of Stores'
      ssconfirm,
      @EndUserText.label: 'Billing Reference'
      billingreference,
      @EndUserText.label: 'Pending Quantity'      
      pendqty,
      /* Associations */
      _Head : redirected to parent ZC_GATEHEAD
}

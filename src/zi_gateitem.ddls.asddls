@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_GATEITEM
  as select from zdt_gate_item
  association to parent ZI_GATEHEAD as _Head on $projection.Id = _Head.Id
{
  key id            as Id,
  key item          as item,
      purchaseorder as Purchaseorder,
      gateitem,
      salesorder,
      gatepassno,
      gateitemapi,
      material      as Material,
      materialdesc  as Materialdesc,
      uom           as Uom,
      wuom,
      @Semantics.quantity.unitOfMeasure : 'UOM'
      qty           as Qty,
      @Semantics.quantity.unitOfMeasure : 'UOM'
      maxqty,
      @Semantics.quantity.unitOfMeasure : 'UOM'
      avlqty,
//      @Semantics.quantity.unitOfMeasure : 'UOM'
      cast(qtybought as abap.dec( 13, 3 ) )     as Qtybought ,
      @Semantics.quantity.unitOfMeasure : 'WUOM'
      grossqty      as grossqty,
      @Semantics.quantity.unitOfMeasure : 'WUOM'
      tareqty       as tareqty,
      @Semantics.quantity.unitOfMeasure : 'WUOM'
      qtyactual     as Qtyactual,
      tconfirm      as tconfirm,
      tgr           as tgr,
      fconfirm,
      gr,
      bgross,
      bnet,
      storagelocation,
      weighbentrydate,
      weighbentrytime,
      weighbexitdate,
      weighbexittime,
      postinglog,
      sconfirm,
      ssconfirm,
      billingreference,
      @Semantics.quantity.unitOfMeasure : 'UOM'      
      pendqty,
      qtyboughtstatus,
      _Head

}

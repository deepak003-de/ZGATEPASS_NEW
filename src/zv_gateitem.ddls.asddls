@AbapCatalog.sqlViewName: 'ZVGATEI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gatepass Item'
@Metadata.ignorePropagatedAnnotations: true
define view ZV_GATEITEM
  as select from zdt_gate_item
{
  key id              as Id,
  key item            as Item,
      purchaseorder   as Purchaseorder,
      gateitem        as gateitem,
      gatepassno      as Gatepassno,
      material        as Material,
      materialdesc    as Materialdesc,
      uom             as Uom,
      wuom            as wuom,
      qty             as Qty,
      qtybought       as Qtybought,
      grossqty        as Grossqty,
      tareqty         as Tareqty,
      uom             as meins,
      @Semantics.quantity.unitOfMeasure : 'uom'
      qtyactual       as Qtyactual,
      storagelocation as Storagelocation,
      tconfirm        as Tconfirm,
      tgr             as Tgr,
      fconfirm        as Fconfirm,
      gr              as Gr,
      salesorder      as Salesorder
}

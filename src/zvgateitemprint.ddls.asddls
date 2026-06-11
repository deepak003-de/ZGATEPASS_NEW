@AbapCatalog.sqlViewName: 'ZVGATEITM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gate Item Print'
@Metadata.ignorePropagatedAnnotations: true
define view ZVGATEITEMPRINT
  as select from zdt_gate_item
{
  key id              as Id,
  key item            as Item,
      purchaseorder   as Purchaseorder,
      gateitem,
      gatepassno      as Gatepassno,
      material        as Material,
      materialdesc    as Materialdesc,
      uom             as Uom,
      qty             as Qty,
      qtybought       as Qtybought,
      grossqty        as Grossqty,
      tareqty         as Tareqty,
      qtyactual       as Qtyactual,
      storagelocation as Storagelocation,
      tconfirm        as Tconfirm,
      tgr             as Tgr,
      fconfirm        as Fconfirm,
      gr              as Gr,
      salesorder      as Salesorder
}

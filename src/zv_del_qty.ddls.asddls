@AbapCatalog.sqlViewName: 'ZVDELQTY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DELIVERED QTY'
@Metadata.ignorePropagatedAnnotations: true
define view ZV_DEL_QTY
  as select from I_DeliveryDocumentItem
{

  key ReferenceSDDocument,
  key ReferenceSDDocumentItem,
      DeliveryQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      sum( ActualDeliveryQuantity ) as delqty
}
group by
  ReferenceSDDocument,
  ReferenceSDDocumentItem,
  DeliveryQuantityUnit

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO Doc item'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_I_purchaseorderitem as select from I_PurchaseOrderItemAPI01 as a
{
    key a.PurchaseOrder,
    key a.PurchaseOrderItem,
    a.CompanyCode,
    a.Plant
}

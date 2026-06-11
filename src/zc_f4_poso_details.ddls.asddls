@AbapCatalog.sqlViewName: 'ZC_POSO_DTAILS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view'
@Metadata.ignorePropagatedAnnotations: true
define view ZC_F4_POSO_DETAILS
  as select distinct from ZI_F4_POSO_DETAILS
{
      @EndUserText.label: 'Billing Reference'
  key BillingDocument,
      @EndUserText.label: 'Purchase Order'
  key PurchaseOrder
}

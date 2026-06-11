@AbapCatalog.sqlViewName: 'ZVPOF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_PURCHASEF4
  as select distinct from I_PurchaseOrderAPI01 as a
    left outer join       I_Supplier           as b on a.Supplier = b.Supplier
{
  key a.PurchaseOrder,
      a.Supplier,
      b.SupplierFullName
}

@AbapCatalog.sqlViewName: 'ZSUPPLIERF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_SUPPLIERNO
  as select from I_Supplier
{
  key  Supplier     as Supplierno,
       SupplierFullName as Supplierdesc
}

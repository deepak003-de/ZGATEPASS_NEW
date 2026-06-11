@AbapCatalog.sqlViewName: 'ZZCUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZVCUST
  as select distinct from I_Customer
{
  key  Customer,
       CustomerName
}

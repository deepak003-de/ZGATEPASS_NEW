@AbapCatalog.sqlViewName: 'ZZCUSF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZVCUSTF4
  as select from I_Customer
{
  key  Customer     as customerno,
       CustomerName as customerdesc
}

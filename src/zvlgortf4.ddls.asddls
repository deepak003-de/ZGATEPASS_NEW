@AbapCatalog.sqlViewName: 'ZVSLOCF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Storage Location F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZVLGORTF4
  as select from I_StorageLocation
{
  key Plant,
  key StorageLocation,
      StorageLocationName,
      SalesOrganization,
      DistributionChannel,
      Division
}

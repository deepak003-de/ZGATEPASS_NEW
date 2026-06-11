@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection ~ Transporter'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TRANSPORTER
  provider contract transactional_query
  as projection on ZI_TRANSPORTER
{
  key Id,
  @EndUserText.label: 'Transporter No'
      Trasnporterno,
      @EndUserText.label: 'Transporter Name'
      Transportername,
      @EndUserText.label: 'Transporter Gstin'
      Transportergstin,
      @EndUserText.label: 'Created On'
      createdon
}

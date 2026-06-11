@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for material process'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_materialprocess
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDMNMATPROCESS')
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
  key language,
      @EndUserText.label: 'Value'
      value_low,
      text
}

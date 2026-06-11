@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GR Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRSTATUS
  as select distinct from I_MaterialDocumentItem_2
{
  key YY1_GATEPASS_MMI,
      max(MaterialDocument)     as MaterialDocument,
      max(MaterialDocumentYear) as MaterialDocumentYear,
      max(MaterialDocumentItem) as MaterialDocumentItem
}
where
      YY1_GATEPASS_MMI is not null
  and YY1_GATEPASS_MMI is not initial
group by
  YY1_GATEPASS_MMI

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GR status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRSTATUS1
  as select from ZR_GRSTATUS              as g
    inner join   I_MaterialDocumentItem_2 as m on  m.MaterialDocument     = g.MaterialDocument
                                               and m.MaterialDocumentYear = g.MaterialDocumentYear
                                               and m.MaterialDocumentItem = g.MaterialDocumentItem
{
  key g.YY1_GATEPASS_MMI,
      case when m.ReversedMaterialDocument is not initial
       then 'GR not Posted'
       else 'GR Posted'
      end as GRStatus,
      g.MaterialDocument as GRNNo
}

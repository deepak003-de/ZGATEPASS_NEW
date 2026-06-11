@AbapCatalog.sqlViewName: 'ZSI_GRNNO'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for fetching the GRNNO'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_GRNNO as select from I_MaterialDocumentItem_2 as A 
{
    key A.MaterialDocument ,
    key A.MaterialDocumentItem,
    key A.MaterialDocumentYear,
    A.YY1_GATEPASS_MMI as Gatepassno
    
}

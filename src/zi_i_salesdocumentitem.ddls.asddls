@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SO Doc item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_I_salesdocumentitem
  as select from I_SalesDocumentItem
{
  key SalesDocument,
  key SalesDocumentItem,
      SalesOrganization,
      Plant
}

//@AbapCatalog.sqlViewName: 'ZI_F4POSO_DTAILS'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds for  Billing reference items column'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_F4_POSO_DETAILS
  as select from    I_BillingDocumentItem    as A
    left outer join I_MaterialDocumentItem_2 as B on  B.MaterialDocument     = A.ReferenceSDDocument
                                                  and B.MaterialDocumentItem = right(
      A.ReferenceSDDocumentItem, 4
    )
{
  key A.BillingDocument, //---
  key B.MaterialDocument,
  key B.PurchaseOrder, //---
  key A.BillingDocumentItem,
  key B.MaterialDocumentItem,
      //   key B.MaterialDocumentYear,
  key B.PurchaseOrderItem, //---
      A.BillingQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
      A.BillingQuantity,
      A.Material,
      A.BillingDocumentItemText,
      A.StorageLocation


}
where
  A.BillingDocumentType = 'JSN'

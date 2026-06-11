@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for PO details'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_PO_DETAILS
  as select from zdt_po_details
  association to parent ZI_GATEHEAD as _Head on $projection.Id = _Head.Id
{
  key id            as Id,
  key item          as item,
      purchaseorder as Purchaseorder,
      supplier      as Supplier,
      supliername   as Supliername,
      salesorder    as Salesorder,
      supplyingplant as supplyplant,
      billingreference,
      eway,
      invoiceno,
      invoicedate,
      //            _Head.Materialprocess as materialprocess,
      _Head
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO/SO Details'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_PO_DETAILS
  as projection on ZI_PO_DETAILS
{
          @EndUserText.label: 'ID'
  key     Id,
          @EndUserText.label: 'Item'
  key     item,
          @EndUserText.label: 'Purchase Order'
          Purchaseorder,
          @EndUserText.label: 'Supplier/Customer'
          Supplier,
          @EndUserText.label: 'Supplier/Customer Name'
          Supliername,
          @EndUserText.label: 'Sales Order'
          Salesorder,
          @EndUserText.label: 'Supplying Plant'
          supplyplant,
          @EndUserText.label: 'Billing Reference'
          billingreference,
          @EndUserText.label: 'E-Way Bill'
          eway,
          @EndUserText.label: 'Invoice Number'
          invoiceno,
          @EndUserText.label: 'Invoice Date'
          invoicedate,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GATE_INOUT'
  virtual Showpo :abap_boolean,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GATE_INOUT'
  virtual Showso :abap_boolean,

          //          materialprocess,
          /* Associations */
          _Head : redirected to parent ZC_GATEHEAD
}

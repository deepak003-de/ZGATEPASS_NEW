@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection ~ Gatepass Header'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_GATEHEAD
  provider contract transactional_query
  as projection on ZI_GATEHEAD
{
      @EndUserText.label: 'ID'
  key Id,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Gatepass No'
      gatepassno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Movement Type'
      Movementtype,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Movement Process'
      Materialprocess,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Supplier/Supplying Plant'
      Supplierno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Supplier Description'
      Supplierdesc,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Vehicle No.'
      Vehicleno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Transporter No'
      Trasporterno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Transporter Name'
      Transportername,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'LR/RR No.'
      Lrrrno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'LR/RR Date'
      Lrrrdate,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Invoice Date'
      Invoicedate,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Way Bill No.'
      Waybillno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Invoice No'
      Invoiceno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Print'
      tprint,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Entry Date'
      Entrydate,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Entry Time'
      Entrytime,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Exit Date'
      Exitdate,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Exit Time'
      Exittime,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Status'
      Status,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Criticality'
      Criticality,
      @EndUserText.label: 'Created On'
      @Search.defaultSearchElement: true
      Createdon,
      @EndUserText.label: 'Created At'
      @Search.defaultSearchElement: true
      Createdat,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Set Out'
      tsetout,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Generate Gatepass'
      tgate,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Transporter GST'
      transportergst,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Tax Invoice'
      taxinvoice,
      @EndUserText.label: 'Delivery Document'
      deliverydocument,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Packging Wt.'
      packingwt,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Challan Qty.'
      challanwt,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Remarks'
      remarks,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Currency Key'
      uom,
      @Search.defaultSearchElement: true
      @Semantics.amount.currencyCode: 'UOM'
      @EndUserText.label: 'Invoice Value'
      invoicevalue,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Customer No'
      customerno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Customer Description'
      customerdesc,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Challan No'
      challanno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Challan Date'
      challandate,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Unit'
      challanunit,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Challan Value'
      @Semantics.amount.currencyCode: 'challanunit'
      challanvalue,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'TP Number'
      tpno,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Post GR'
      bgr,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Source'
      source,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Destination'
      destination,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Cancel'
      bcancel,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Cancel'
      cancel,
      @EndUserText.label: 'GR Status'
      grstatus,
      @EndUserText.label: 'Criticality1'
      Criticality1,
      @EndUserText.label: 'GRN No'
      grstatno,
      genitem,
      @UI.hidden: true
      delcreated,
      bdel,
      @EndUserText.label: 'PGI'
      pgi,
      @EndUserText.label: 'PGI Status'
      pgistat,
      @EndUserText.label: 'Update Text'
      updtext,
      @EndUserText.label: 'Text Updated'
      textupdated,
      @EndUserText.label: 'Create Invoice'
      crtinv,
      @EndUserText.label: 'Get Invoice'
      getinv,
      @EndUserText.label: 'Attachment'
      Attachment,
      @EndUserText.label: 'Mimetype'
      Mimetype,
      @EndUserText.label: 'Filename'
      Filename,
      @EndUserText.label: 'Created By User'
      createdby,
      @EndUserText.label: 'Created By Name'
      createdbyname,
      @EndUserText.label: 'Driver Name'
      drivername ,
      @EndUserText.label: 'Grnno'
      grnno,                                     // ++ 28.07.25
      @EndUserText.label: 'Wuom'
      wuom,
      @EndUserText.label: 'Weighbridge Entry Date'
      weighbentrydate,
      @EndUserText.label: 'Weighbridge Entry Time'
      weighbentrytime,
      @EndUserText.label: 'Weighbridge Exit Date'
      weighbexitdate,
      @EndUserText.label: 'Weighbridge Exit Time'
      weighbexittime,
      @EndUserText.label: 'Gross Quantity'
      grossqty, 
      @EndUserText.label: 'Tare Quantity'
      tareqty  , 
      @EndUserText.label: 'Quantity Actual'
      qtyactual ,
      @EndUserText.label: 'Company Code'
      Companycode,
      @EndUserText.label: 'Pending Quantity'
      pendqty,


      /* Associations */
      _Item  : redirected to composition child ZC_PO_DETAILS,
      _Item1 : redirected to composition child ZC_GATEITEM
}

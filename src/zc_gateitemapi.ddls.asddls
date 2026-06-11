@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GATE ITEM API'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_GATEITEMAPI

  as select from zdt_gate_item as a

    inner join   zdt_gatehead  as b on b.gatepassno = a.gatepassno 

{
  key    a.gatepassno                           as Gatepassno,
  key    a.gateitemapi                          as gateitemapi,
         a.purchaseorder                        as POSO,
         a.gateitem                             as posoitem,
         a.material                             as Material,
         a.materialdesc                         as Materialdesc,
         a.salesorder                           as SalesOrder,

         cast( b.entrydate as abap.char(20) )   as Entrydate,
         cast( b.entrytime as abap.char(20) )   as Entrytime,
         b.supplierno                           as Supplierno,
         b.customerno                           as Customerno,
         b.supplierdesc                         as Supplierdesc,
         b.customerdesc                         as Customerdesc,
         b.vehicleno                            as Vehicleno,
         b.trasporterno                         as Trasporterno,
         b.transportername                      as Transportername,
         b.lrrrno                               as Lrrrno,
         cast( b.lrrrdate as abap.char(20) )    as Lrrrdate,
         cast( b.invoicedate as abap.char(20) ) as Invoicedate,
         b.waybillno                            as Waybillno,
         b.invoiceno                            as Invoiceno,
         b.remarks                              as Remarks,
         b.transportergst                       as Transportergst,
         b.challanno                            as Challanno,
         cast( b.challandate as abap.char(20) ) as Challandate,
         b.challanunit                          as Challanunit,
         b.tpno                                 as Tpno,
         b.bgr                                  as Bgr,
         b.source                               as Source,
         b.destination                          as Destination,
         b.bcancel                              as Bcancel,
         b.cancel                               as Cancel,
         b.weighbentrydate,
         b.weighbentrytime,
         b.weighbexitdate,
         b.weighbexittime,

         a.uom                                  as Uom,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         a.qty                                  as Qty,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         a.maxqty                               as Maxqty,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         a.avlqty                               as Avlqty,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         a.qtybought                            as Qtybought,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         b.grossqty                             as OverallGrossqty,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         b.tareqty                              as OverallTareqty,
         @Semantics.quantity.unitOfMeasure: 'UOM'
         b.qtyactual                            as OverallQtyactual
}

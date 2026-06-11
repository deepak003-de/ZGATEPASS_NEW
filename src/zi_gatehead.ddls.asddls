@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_GATEHEAD
  as select from    zdt_gatehead as z
  left outer join ZR_GRSTATUS1  as s on  s.YY1_GATEPASS_MMI = z.gatepassno
  composition [0..*] of ZI_PO_DETAILS as _Item
  composition [0..*] of ZI_GATEITEM   as _Item1

{
  key z.id              as Id,
      z.gatepassno      as gatepassno,
      z.movementtype    as Movementtype,
      z.materialprocess as Materialprocess,
      z.companycode     as Companycode,
      z.supplierno      as Supplierno,
      z.supplierdesc    as Supplierdesc,
      z.vehicleno       as Vehicleno,
      z.trasporterno    as Trasporterno,
      z.transportername as Transportername,
      z.lrrrno          as Lrrrno,
      z.lrrrdate        as Lrrrdate,
      z.invoicedate     as Invoicedate,
      z.waybillno       as Waybillno,
      z.invoiceno       as Invoiceno,
      z.tprint          as tprint,
      z.tsetout         as tsetout,
      z.tgate           as tgate,
      z.entrydate       as Entrydate,
      z.entrytime       as Entrytime,
      z.exitdate        as Exitdate,
      z.exittime        as Exittime,
      z.status          as Status,
      case  when z.status = 'Under Process'   then 2
            when z.status = 'Gatepass Created'   then 3
            when z.status = 'Exited' or  z.status = 'Cancelled' or z.status = 'Cancelled & Exited'  then 1
            else 3 end  as Criticality,
      z.createdon       as Createdon,
      z.createdat       as Createdat,
      z.transportergst,
      z.taxinvoice,
      z.deliverydocument,
      z.packingwt,
      z.challanwt,
      //cast( challanwt as abap.dec( 20,3 ) ) as challanwt,
      z.remarks,
      z.uom,
      @Semantics.amount.currencyCode: 'UOM'
      z.invoicevalue,
      z.customerno,
      z.customerdesc,
      z.challanno,
      z.challandate,
      z.challanunit,
      @Semantics.amount.currencyCode: 'challanunit'
      z.challanvalue,
      z.tpno,
      z.bgr,
      z.source,
      z.destination,
      z.bcancel,
      z.cancel,
      //      z.grstatus,
      case when z.movementtype <> 'INWARD'
           then z.grstatus
           else s.GRStatus
      end               as grstatus,
      s.GRNNo as grstatno,
      z.genitem,
      z.delcreated,
      z.bdel,
      //      case  when z.grstatus = 'GR Under Progress'  or z.grstatus = 'GR Partially Posted'  then 2
      //            when z.grstatus = 'GR Posted'   then 3
      //             when z.grstatus  = '' then 4
      //            when z.grstatus = 'Error' then 1
      //            else 3 end                      as Criticality1,
      case  when $projection.grstatus = 'GR Under Progress'  or $projection.grstatus = 'GR Partially Posted'  then 2
            when $projection.grstatus = 'GR Posted'   then 3
            when $projection.grstatus  = '' or $projection.grstatus is null then 4
            when $projection.grstatus = 'Error' or $projection.grstatus = 'GR not Posted' then 1
            else 3
      end               as Criticality1,
      z.pgi,
      z.pgistat,
      z.updtext,
      z.textupdated,
      z.crtinv,
      z.getinv,
      @Semantics.largeObject: {mimeType: 'Mimetype', fileName: 'Filename', contentDispositionPreference: #INLINE }
      z.attachment      as Attachment,
      @Semantics.mimeType: true
      z.mimetype        as Mimetype,
      z.filename        as Filename,
      z.createdby,
      z.createdbyname,
      z.drivername,
      z.grnno, // ++ 28.07.25
      z.wuom, // 20.08.25
      z.weighbentrydate, // 20.08.25
      z.weighbentrytime, // 20.08.25
      z.weighbexitdate, // 20.08.25
      z.weighbexittime, // 20.08.25
      @Semantics.quantity.unitOfMeasure : 'wuom'
      z.grossqty,        // 20.08.25
      @Semantics.quantity.unitOfMeasure : 'wuom'
      z.tareqty,         // 20.08.25
      @Semantics.quantity.unitOfMeasure : 'wuom'
      z.qtyactual, // 20.08.25
      @Semantics.quantity.unitOfMeasure : 'wuom'      
      z.pendqty,
      _Item,
      _Item1
}
//where z.createdby = $session.user

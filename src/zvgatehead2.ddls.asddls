@AbapCatalog.sqlViewName: 'ZZVVGHEAD02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gatehead'
@Metadata.ignorePropagatedAnnotations: true
define view ZVGATEHEAD2
  as select from zdt_gatehead
{
  key id               as Id,
      gatepassno       as Gatepassno,
      movementtype     as Movementtype,
      materialprocess  as Materialprocess,
      entrydate        as Entrydate,
      entrytime        as Entrytime,
      exitdate         as Exitdate,
      exittime         as Exittime,
      supplierno       as Supplierno,
      customerno       as Customerno,
      supplierdesc     as Supplierdesc,
      customerdesc     as Customerdesc,
      vehicleno        as Vehicleno,
      trasporterno     as Trasporterno,
      transportername  as Transportername,
      lrrrno           as Lrrrno,
      lrrrdate         as Lrrrdate,
      invoicedate      as Invoicedate,
      waybillno        as Waybillno,
      invoiceno        as Invoiceno,
      tsetout          as Tsetout,
      tprint           as Tprint,
      tgate            as Tgate,
      status           as Status,
      createdon        as Createdon,
      createdat        as Createdat,
      remarks          as Remarks,
      transportergst   as Transportergst,
      taxinvoice       as Taxinvoice,
      deliverydocument as Deliverydocument,
      packingwt        as Packingwt,
      challanwt        as Challanwt,
      uom              as Uom,
      challanno        as Challanno,
      challandate      as Challandate,
      challanunit      as Challanunit,
      challanvalue     as Challanvalue,
      invoicevalue     as Invoicevalue,
      tpno             as Tpno,
      bgr              as Bgr,
      source           as Source,
      destination      as Destination,
      bcancel          as Bcancel,
      cancel           as Cancel,
      grstatus         as Grstatus,
      genitem          as Genitem,
      delcreated       as Delcreated,
      bdel             as Bdel,
      pgi              as Pgi,
      pgistat          as Pgistat,
      updtext          as Updtext,
      textupdated      as Textupdated,
      crtinv           as Crtinv,
      getinv           as Getinv,
      poraw            as Poraw,
      attachment       as Attachment,
      mimetype         as Mimetype,
      filename         as Filename,
      createdby        as Createdby,
      createdbyname    as Createdbyname,
      drivername       as Drivername
}
where
      gatepassno <> '0000000000'
  and status     <> 'Under Process'

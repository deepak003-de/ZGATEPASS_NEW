@AbapCatalog.sqlViewName: 'ZVGATEHEAD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gatehead'
@Metadata.ignorePropagatedAnnotations: true
define view ZV_GATEHEAD
  as select from zdt_gatehead
{
  key id              as Id,
      gatepassno      as Gatepassno,
      movementtype    as Movementtype,
      materialprocess as Materialprocess,
      entrydate       as Entrydate,
      entrytime       as Entrytime,
      exitdate        as Exitdate,
      exittime        as Exittime,
      supplierno      as Supplierno,
      customerno      as Customerno,
      supplierdesc    as Supplierdesc,
      customerdesc    as Customerdesc,
      vehicleno       as Vehicleno,
      trasporterno    as Trasporterno,
      transportername as Transportername,
      lrrrno          as Lrrrno,
      lrrrdate        as Lrrrdate,
      invoicedate     as Invoicedate,
      waybillno       as Waybillno,
      invoiceno       as Invoiceno,
      tsetout         as Tsetout,
      tprint          as Tprint,
      tgate           as Tgate,
      status          as Status,
      createdon       as Createdon,
      createdat       as Createdat,
      remarks         as Remarks,
      transportergst  as Transportergst,
      taxinvoice      as Taxinvoice,
      packingwt       as Packingwt,
      uom             as Uom,
      invoicevalue    as Invoicevalue,
      attachment      as Attachment,
      mimetype        as Mimetype,
      filename        as Filename
}
where
  status <> 'Cancelled'

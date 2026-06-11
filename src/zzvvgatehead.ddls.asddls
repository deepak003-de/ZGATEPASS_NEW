@ObjectModel.query.implementedBy: 'ABAP:ZCL_GATE_IMPL'
@EndUserText.label: 'Gate Header Print'
define custom entity ZZVVGATEHEAD

{
  key id              : sysuuid_x16;
      gatepassno      : abap.char(10);
      movementtype    : zdemovementype;
      materialprocess : zdematprocess;
      entrydate       : abap.dats;
      entrytime       : abap.tims;
      exitdate        : abap.dats;
      exittime        : abap.tims;
      supplierno      : abap.char(10);
      supplierdesc    : abap.char(40);
      customerno      : abap.char(10);
      customerdesc    : abap.char(40);
      vehicleno       : abap.char(30);
      trasporterno    : abap.char(50);
      transportername : abap.char(50);
      lrrrno          : abap.char(10);
      lrrrdate        : abap.dats;
      invoicedate     : abap.dats;
      waybillno       : abap.char(12);
      invoiceno       : abap.char(30);
      tsetout         : abap.char(1);
      tprint          : abap.char(1);
      tgate           : abap.char(1);
      status          : abap.char(25);
      createdon       : abap.dats;
      createdat       : abap.tims;
      remarks         : abap.char(255);
      transportergst  : abap.char(40);
      taxinvoice      : abap.char(10);
      packingwt       : abap.dec(23,2);
      qtyuom          : meins;
      @Semantics.quantity.unitOfMeasure : 'qtyuom'
      qtyactual       : menge_d;
      uom             : waers;
      @Semantics.amount.currencyCode : 'uom'
      invoicevalue    : dmbtr;
      source          : abap.char(50);
      destination     : abap.char(50);
      attachment      : zde_attachment;
      mimetype        : zde_mimetype;
      filename        : zde_filename;
      createdby       : abap.char(12);
      createdbyname   : abap.char(50);
      drivername      : abap.char(50);
      companyname     : abap.char(40);
      plantadress     : abap.char(200);
      grnno           : abap.char(10);
      _item           : association [1..*] to ZVGATEITEMPRINT on $projection.id = _item.Id;

}

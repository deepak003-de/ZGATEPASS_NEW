@AbapCatalog.sqlViewName: 'ZVCHLF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Challan F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZVCHLNF4
  as select distinct from zdt_challan      as a
    inner join            zdt_challan_item as b on a.id = b.id
{
       @EndUserText.label: 'Challan Number'
  key  a.challanno          as Challanno,
       @EndUserText.label: 'Challan Date'
       a.challandate        as Challandate,
       @EndUserText.label: 'Instructed By (User)'
       a.insby              as Insby,
       @EndUserText.label: 'Instructed By (Name)'
       a.insbyname          as Insbyname,
       //       @EndUserText.label: 'UOM'
       //       b.uom                as Uom,
       @EndUserText.label: 'Quantity'
       //       @Semantics.quantity.unitOfMeasure: 'UOM'
       sum(b.quantity)      as chalnqty,
       @EndUserText.label: 'Currency'
       b.currunit           as Currunit,
       @EndUserText.label: 'Amount'
       @Semantics.amount.currencyCode: 'Currunit'
       sum(b.materialvalue) as chlnvalue

}
where
      a.closechallan is initial
  and a.challanno    is not initial
group by
  a.challanno,
  a.challandate,
  a.insby,
  a.insbyname,
  //  b.uom,
  b.currunit

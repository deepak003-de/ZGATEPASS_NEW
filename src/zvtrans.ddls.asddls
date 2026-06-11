@AbapCatalog.sqlViewName: 'ZVTRF4'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transporter F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZVTRANS
  as select distinct from zdt_transporter
{
  key  trasnporterno    as Trasnporterno,
       transportername  as Transportername,
       transportergstin as Transportergstin,
       createdon        as Createdon
}
 
 
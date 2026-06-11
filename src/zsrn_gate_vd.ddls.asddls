@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SRN Validation Purpose for Gatepass'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSRN_GATE_VD 
as select from zdt_gatehead as GPH
left outer join zdt_po_details as POH on POH.id = GPH.id
{
key GPH.id as Id,
GPH.gatepassno as Gatepassno,
GPH.movementtype as Movementtype,
GPH.materialprocess as Materialprocess,
GPH.companycode as Companycode,
POH.purchaseorder

}
where POH.purchaseorder is not initial

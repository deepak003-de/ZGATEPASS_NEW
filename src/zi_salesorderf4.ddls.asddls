@AbapCatalog.sqlViewName: 'ZVSALESORDF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_SALESORDERF4
  as select from    I_SalesDocument as a
    left outer join I_Customer      as b on a.SoldToParty = b.Customer
{
  key a.SalesDocument,
      a.SoldToParty as customer,
      b.CustomerName
}
where
      a.OverallSDProcessStatus        <> 'C'
 // and a.TotalBlockStatus              <> 'C'  // -- 26.06.25 SP
  and a.OverallSDDocumentRejectionSts <> 'C'

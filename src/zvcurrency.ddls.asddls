@AbapCatalog.sqlViewName: 'ZVCURKEY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Key'
@Metadata.ignorePropagatedAnnotations: true
define view ZVCURRENCY
  as select from I_CurrencyText
{
  key Language,
  key Currency,
      CurrencyName,
      CurrencyShortName
}
where
  Language = 'E'

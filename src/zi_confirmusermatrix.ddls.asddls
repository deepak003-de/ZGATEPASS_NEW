@EndUserText.label: 'Confirm User Matrix'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_ConfirmUserMatrix
  as select from ZCONFIRM_MATRIX
  association to parent ZI_ConfirmUserMatrix_S as _ConfirmUserMatriAll on $projection.SingletonID = _ConfirmUserMatriAll.SingletonID
{
  key SUSER as Suser,
  key SLOC as Sloc,
  MAIL as Mail,
  @Consumption.hidden: true
  1 as SingletonID,
  _ConfirmUserMatriAll
  
}

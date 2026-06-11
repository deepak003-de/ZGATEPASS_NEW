@EndUserText.label: 'Confirm User Matrix Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'SingletonID' ]
@UI: {
  headerInfo: {
    typeName: 'ConfirmUserMatriAll'
  }
}
define root view entity ZI_ConfirmUserMatrix_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZI_CONFIRMUSERMATRIX'
  association [0..*] to I_ABAPTransportRequestText as _ABAPTransportRequestText on $projection.TransportRequestID = _ABAPTransportRequestText.TransportRequestID
  composition [0..*] of ZI_ConfirmUserMatrix as _ConfirmUserMatrix
{
  @UI.facet: [ {
    id: 'ZI_ConfirmUserMatrix', 
    purpose: #STANDARD, 
    type: #LINEITEM_REFERENCE, 
    label: 'Confirm User Matrix', 
    position: 1 , 
    targetElement: '_ConfirmUserMatrix'
  } ]
  @UI.lineItem: [ {
    position: 1 
  } ]
  key 1 as SingletonID,
  _ConfirmUserMatrix,
  @UI.hidden: true
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax,
  @ObjectModel.text.association: '_ABAPTransportRequestText'
  @UI.identification: [ {
    position: 2 , 
    type: #WITH_INTENT_BASED_NAVIGATION, 
    semanticObjectAction: 'manage'
  } ]
  @Consumption.semanticObject: 'CustomizingTransport'
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  _ABAPTransportRequestText
  
}
where I_Language.Language = $session.system_language

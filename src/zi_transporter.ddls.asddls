@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface ~ Transporter'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TRANSPORTER
  as select from zdt_transporter

{
  key id               as Id,
      trasnporterno    as Trasnporterno,
      transportername  as Transportername,
      transportergstin as Transportergstin,
      createdon as createdon
}


@EndUserText.label: 'CPT Delivery Orders'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZCPT_C_DLV
  provider contract transactional_query
  as projection on ZCPT_R_DLV
{
  key UUID,
      DeliveryNo,
      CustomerName,
      PlannedDate,
      Status
}

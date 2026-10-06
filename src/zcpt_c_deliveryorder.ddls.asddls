@EndUserText.label: 'CPT Delivery Orders'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZCPT_C_DELIVERYORDER
  provider contract transactional_query
  as projection on ZCPT_R_DELIVERYORDER
{
  key DeliveryOrderUUID,
      DeliveryOrderNumber,
      CustomerName,
      PlannedDeliveryDate,
      DeliveryStatus
}

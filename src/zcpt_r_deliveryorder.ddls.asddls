@EndUserText.label: 'CPT Delivery Orders – Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZCPT_R_DELIVERYORDER
  as select from zcpt_d_dlvord
{
  key dlvorder_uuid   as DeliveryOrderUUID,
      deliv_order_no as DeliveryOrderNumber,
      customer_name         as CustomerName,
      plan_deliv_date as PlannedDeliveryDate,
      delivery_status       as DeliveryStatus
}

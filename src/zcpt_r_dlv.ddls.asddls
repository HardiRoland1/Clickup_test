@EndUserText.label: 'CPT Delivery Orders Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZCPT_R_DLV
  as select from zcpt_d_dlv
{
  key uuid      as UUID,
      dlv_no    as DeliveryNo,
      cust_name as CustomerName,
      plan_date as PlannedDate,
      status    as Status
}

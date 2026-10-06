@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order - Root'
define root view entity ZR_SALESORDER
  as select from zso_salesorder
{
  key sales_order_uuid      as SalesOrderUUID,
      sales_order_id        as SalesOrderID,
      customer_name         as CustomerName,
      order_date            as OrderDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      net_amount            as NetAmount,
      currency_code         as CurrencyCode,
      overall_status        as OverallStatus,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}

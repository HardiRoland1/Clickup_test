@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order - Projection'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_SALESORDER
  provider contract transactional_query
  as projection on ZR_SALESORDER
{
  key SalesOrderUUID,
      @Search.defaultSearchElement: true
      SalesOrderID,
      @Search.defaultSearchElement: true
      CustomerName,
      OrderDate,
      NetAmount,
      CurrencyCode,
      OverallStatus,
      CreatedBy,
      LastChangedAt,
      LocalLastChangedAt
}

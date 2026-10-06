@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CPT Delivery Orders'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZCPT_C_DLV
  provider contract transactional_query
  as projection on ZCPT_R_DLV
{
  key UUID,
      @Search.defaultSearchElement: true
      DeliveryNo,
      @Search.defaultSearchElement: true
      CustomerName,
      PlannedDate,
      Status,
      CreatedBy,
      ChangedAt,
      LocalChgAt
}

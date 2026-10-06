@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CPT Delivery Items'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZCPT_C_ITM
  provider contract transactional_query
  as projection on ZCPT_R_ITM
{
  key UUID,
      DeliveryUUID,
      @Search.defaultSearchElement: true
      ItemNo,
      @Search.defaultSearchElement: true
      Material,
      Description,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      Quantity,
      Unit,
      CreatedBy,
      ChangedAt,
      LocalChgAt,
      _DeliveryOrder : redirected to parent ZCPT_C_DLV
}

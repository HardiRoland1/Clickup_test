@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CPT Delivery - Item'
define view entity ZCPT_R_ITM
  as select from zcpt_d_itm
  association to parent ZCPT_R_DLV as _DeliveryOrder on $projection.DeliveryUUID = _DeliveryOrder.UUID
{
  key uuid          as UUID,
      dlv_uuid      as DeliveryUUID,
      item_no       as ItemNo,
      material      as Material,
      description   as Description,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity      as Quantity,
      unit          as Unit,
      @Semantics.user.createdBy: true
      created_by    as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at    as ChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_chg_at  as LocalChgAt,
      _DeliveryOrder
}

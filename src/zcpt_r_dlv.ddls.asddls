@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CPT Delivery - Root'
@Metadata.allowExtensions: true
define root view entity ZCPT_R_DLV
  as select from zcpt_d_dlv
{
  key uuid          as UUID,
      dlv_no        as DeliveryNo,
      cust_name     as CustomerName,
      plan_date     as PlannedDate,
      status        as Status,
      @Semantics.user.createdBy: true
      created_by    as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at    as ChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_chg_at  as LocalChgAt
}

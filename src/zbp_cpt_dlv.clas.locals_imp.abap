CLASS lhc_deliveryorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR DeliveryOrder RESULT result.
    METHODS setDefaults FOR DETERMINE ON SAVE
      IMPORTING keys FOR DeliveryOrder~setDefaults.
    METHODS setReady FOR MODIFY
      IMPORTING keys FOR ACTION DeliveryOrder~setReady.
    METHODS setShipped FOR MODIFY
      IMPORTING keys FOR ACTION DeliveryOrder~setShipped.
ENDCLASS.

CLASS lhc_deliveryorder IMPLEMENTATION.
  METHOD get_global_authorizations.
    result = VALUE #( %create = if_abap_behv=>auth-allowed
                      %update = if_abap_behv=>auth-allowed
                      %delete = if_abap_behv=>auth-allowed ).
  ENDMETHOD.

  METHOD setDefaults.
    READ ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY DeliveryOrder
        FIELDS ( PlannedDate Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(orders).

    DATA(today) = cl_abap_context_info=>get_system_date( ).
    MODIFY ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY DeliveryOrder
        UPDATE FIELDS ( PlannedDate Status )
        WITH VALUE #( FOR order IN orders
          ( %tky = order-%tky
            PlannedDate = COND #( WHEN order-PlannedDate IS INITIAL THEN today ELSE order-PlannedDate )
            Status = COND #( WHEN order-Status IS INITIAL THEN 'NEW' ELSE order-Status ) ) ).
  ENDMETHOD.

  METHOD setReady.
    MODIFY ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY DeliveryOrder
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = 'READY' ) )
      FAILED failed
      REPORTED reported.
  ENDMETHOD.

  METHOD setShipped.
    MODIFY ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY DeliveryOrder
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = 'SHIPPED' ) )
      FAILED failed
      REPORTED reported.
  ENDMETHOD.
ENDCLASS.

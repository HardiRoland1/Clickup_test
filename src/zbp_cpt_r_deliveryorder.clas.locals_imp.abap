CLASS lhc_DeliveryOrder IMPLEMENTATION.
  METHOD initializeStatus.
    READ ENTITIES OF zcpt_r_deliveryorder IN LOCAL MODE
      ENTITY DeliveryOrder
        FIELDS ( DeliveryStatus )
        WITH CORRESPONDING #( keys )
      RESULT DATA(orders).

    MODIFY ENTITIES OF zcpt_r_deliveryorder IN LOCAL MODE
      ENTITY DeliveryOrder
        UPDATE FIELDS ( DeliveryStatus )
        WITH VALUE #( FOR order IN orders
          WHERE ( DeliveryStatus IS INITIAL )
          ( %tky = order-%tky DeliveryStatus = 'New' ) )
      REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD setReady.
    MODIFY ENTITIES OF zcpt_r_deliveryorder IN LOCAL MODE
      ENTITY DeliveryOrder
        UPDATE FIELDS ( DeliveryStatus )
        WITH VALUE #( FOR key IN keys
          ( %tky = key-%tky DeliveryStatus = 'Ready' ) )
      FAILED failed
      REPORTED reported.
  ENDMETHOD.

  METHOD setShipped.
    MODIFY ENTITIES OF zcpt_r_deliveryorder IN LOCAL MODE
      ENTITY DeliveryOrder
        UPDATE FIELDS ( DeliveryStatus )
        WITH VALUE #( FOR key IN keys
          ( %tky = key-%tky DeliveryStatus = 'Shipped' ) )
      FAILED failed
      REPORTED reported.
  ENDMETHOD.
ENDCLASS.

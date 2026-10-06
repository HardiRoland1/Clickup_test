CLASS lhc_Root IMPLEMENTATION.
  METHOD initStatus.
    READ ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY Root
        FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(orders).

    MODIFY ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY Root
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR order IN orders
          WHERE ( Status IS INITIAL )
          ( %tky = order-%tky Status = 'NEW' ) )
      REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD setReady.
    MODIFY ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY Root
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR key IN keys
          ( %tky = key-%tky Status = 'READY' ) )
      FAILED failed
      REPORTED reported.
  ENDMETHOD.

  METHOD setShipped.
    MODIFY ENTITIES OF zcpt_r_dlv IN LOCAL MODE
      ENTITY Root
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR key IN keys
          ( %tky = key-%tky Status = 'SHIPPED' ) )
      FAILED failed
      REPORTED reported.
  ENDMETHOD.
ENDCLASS.

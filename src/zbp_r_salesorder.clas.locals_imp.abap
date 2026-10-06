CLASS lhc_salesorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR SalesOrder RESULT result.

    METHODS setDefaults FOR DETERMINE ON SAVE
      IMPORTING keys FOR SalesOrder~setDefaults.
ENDCLASS.

CLASS lhc_salesorder IMPLEMENTATION.

  METHOD get_global_authorizations.
    " Demo: everything is allowed
    result = VALUE #( %create = if_abap_behv=>auth-allowed
                      %update = if_abap_behv=>auth-allowed
                      %delete = if_abap_behv=>auth-allowed ).
  ENDMETHOD.

  METHOD setDefaults.
    READ ENTITIES OF zr_salesorder IN LOCAL MODE
      ENTITY SalesOrder
        FIELDS ( SalesOrderID OrderDate OverallStatus )
        WITH CORRESPONDING #( keys )
      RESULT DATA(orders).

    DELETE orders WHERE SalesOrderID IS NOT INITIAL.
    IF orders IS INITIAL.
      RETURN.
    ENDIF.

    SELECT SINGLE FROM zso_salesorder
      FIELDS MAX( sales_order_id )
      INTO @DATA(max_id).

    DATA(today) = cl_abap_context_info=>get_system_date( ).

    MODIFY ENTITIES OF zr_salesorder IN LOCAL MODE
      ENTITY SalesOrder
        UPDATE FIELDS ( SalesOrderID OrderDate OverallStatus )
        WITH VALUE #( FOR order IN orders INDEX INTO i
                      ( %tky          = order-%tky
                        SalesOrderID  = max_id + i
                        OrderDate     = COND #( WHEN order-OrderDate IS INITIAL
                                                THEN today ELSE order-OrderDate )
                        OverallStatus = COND #( WHEN order-OverallStatus IS INITIAL
                                                THEN 'N' ELSE order-OverallStatus ) ) ).
  ENDMETHOD.

ENDCLASS.

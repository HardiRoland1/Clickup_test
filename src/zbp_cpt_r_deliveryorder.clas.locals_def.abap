CLASS lhc_DeliveryOrder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS initializeStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR DeliveryOrder~initializeStatus.
    METHODS setReady FOR MODIFY
      IMPORTING keys FOR ACTION DeliveryOrder~setReady.
    METHODS setShipped FOR MODIFY
      IMPORTING keys FOR ACTION DeliveryOrder~setShipped.
ENDCLASS.

CLASS lhc_Root DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS initStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Root~initStatus.
    METHODS setReady FOR MODIFY
      IMPORTING keys FOR ACTION Root~setReady.
    METHODS setShipped FOR MODIFY
      IMPORTING keys FOR ACTION Root~setShipped.
ENDCLASS.

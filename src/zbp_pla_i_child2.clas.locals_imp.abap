*CLASS lhc_Child2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
*  PRIVATE SECTION.
*
**    METHODS update FOR MODIFY
**      IMPORTING entities FOR UPDATE Child2.
**
**    METHODS delete FOR MODIFY
**      IMPORTING keys FOR DELETE Child2.
*
**    METHODS read FOR READ
**      IMPORTING keys FOR READ Child2 RESULT result.
**
**    METHODS rba_Root FOR READ
**      IMPORTING keys_rba FOR READ Child2\_Root FULL result_requested RESULT result LINK association_links.
*
*ENDCLASS.
*
*CLASS lhc_Child2 IMPLEMENTATION.
*
**  METHOD update.
**  ENDMETHOD.
**
**  METHOD delete.
**  ENDMETHOD.
**
**  METHOD read.
**  ENDMETHOD.
**
**  METHOD rba_Root.
**  ENDMETHOD.
*
*ENDCLASS.

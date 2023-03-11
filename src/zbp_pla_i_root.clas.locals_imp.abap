*CLASS lhc_buffer DEFINITION.
** 1) define the data buffer
*  PUBLIC SECTION.
*
*    TYPES: BEGIN OF ty_buffer.
*           INCLUDE TYPE zpla_aroot AS lv_data.
*    TYPES:   flag TYPE c LENGTH 1,
*           END OF ty_buffer.
*
*
*    TYPES tt_roots TYPE SORTED TABLE OF ty_buffer WITH UNIQUE KEY root_uuid.
*
*    CLASS-DATA mt_buffer TYPE tt_roots.
*ENDCLASS.

CLASS lcl_save DEFINITION INHERITING FROM cl_abap_behavior_saver ABSTRACT FINAL.
  PROTECTED SECTION.

*     METHODS check_before_save REDEFINITION.
     METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lcl_save IMPLEMENTATION.

*  METHOD check_before_save.
*
*  ENDMETHOD.

  METHOD save_modified.

  ENDMETHOD.

ENDCLASS.


CLASS lhc_Root DEFINITION INHERITING FROM cl_abap_behavior_handler.



  PRIVATE SECTION.


    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Root RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Root RESULT result.

*    METHODS create FOR MODIFY
*      IMPORTING entities FOR CREATE Root.
*
*    METHODS update FOR MODIFY
*      IMPORTING entities FOR UPDATE Root.
*
*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE Root.
*
*    METHODS read FOR READ
*      IMPORTING keys FOR READ Root RESULT result.
*
*    METHODS lock FOR LOCK
*      IMPORTING keys FOR LOCK Root.
*
*    METHODS rba_Child1 FOR READ
*      IMPORTING keys_rba FOR READ Root\_Child1 FULL result_requested RESULT result LINK association_links.
*
*    METHODS rba_Child2 FOR READ
*      IMPORTING keys_rba FOR READ Root\_Child2 FULL result_requested RESULT result LINK association_links.
*
*    METHODS rba_Child3 FOR READ
*      IMPORTING keys_rba FOR READ Root\_Child3 FULL result_requested RESULT result LINK association_links.
*
*    METHODS cba_Child1 FOR MODIFY
*      IMPORTING entities_cba FOR CREATE Root\_Child1.
*
*    METHODS cba_Child2 FOR MODIFY
*      IMPORTING entities_cba FOR CREATE Root\_Child2.
*
*    METHODS cba_Child3 FOR MODIFY
*      IMPORTING entities_cba FOR CREATE Root\_Child3.

ENDCLASS.

CLASS lhc_Root IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD create.
*    LOOP AT entities INTO DATA(ls_create).
*      GET TIME STAMP FIELD DATA(zv_tsl).
*      ls_create-%data-lastchangedat = zv_tsl.
*      INSERT VALUE #( flag = 'C' lv_data = CORRESPONDING #( ls_create-%data ) ) INTO TABLE  lhc_buffer=>mt_buffer.
*
*    IF ls_create-%cid IS NOT INITIAL.
*        INSERT VALUE #( %cid = ls_create-%cid   ) INTO TABLE mapped-root.
*      ENDIF.
*
*    ENDLOOP.
*  ENDMETHOD.
*
*  METHOD update.
*    LOOP AT entities INTO DATA(ls_update).
*      READ TABLE lhc_buffer=>mt_buffer ASSIGNING FIELD-SYMBOL(<ls_buffer>) WITH KEY root_uuid = ls_update-RootUuid .
*      IF sy-subrc <> 0.
*        " not yet in buffer, read from table
*
*        SELECT SINGLE * FROM zpla_aroot  WHERE root_uuid = @ls_update-RootUuid INTO @DATA(ls_db).
*
*        INSERT VALUE #( flag = 'U' lv_data = ls_db ) INTO TABLE lhc_buffer=>mt_buffer ASSIGNING <ls_buffer>.
*      ENDIF.
*
*      IF ls_update-%control-RootUuid IS NOT INITIAL.. <ls_buffer>-root_uuid = ls_update-RootUuid. ENDIF.
*      IF ls_update-%control-Field1 IS NOT INITIAL.. <ls_buffer>-field_1 = ls_update-Field1. ENDIF.
*      IF ls_update-%control-Field2 IS NOT INITIAL.. <ls_buffer>-field_2 = ls_update-Field2. ENDIF.
*      IF ls_update-%control-Field3 IS NOT INITIAL.. <ls_buffer>-field_3 = ls_update-Field3. ENDIF.
*      IF ls_update-%control-Field4 IS NOT INITIAL.. <ls_buffer>-field_4 = ls_update-Field4. ENDIF.
*      IF ls_update-%control-Field5 IS NOT INITIAL.. <ls_buffer>-field_5 = ls_update-Field5. ENDIF.
*
*    ENDLOOP.
*  ENDMETHOD.
*
*  METHOD delete.
*    LOOP AT keys INTO DATA(ls_delete).
*      READ TABLE lhc_buffer=>mt_buffer
*          ASSIGNING FIELD-SYMBOL(<ls_buffer>) WITH KEY root_uuid = ls_delete-RootUuid.
*
*      IF sy-subrc = 0.
*        " already in buffer, check why
*        IF <ls_buffer>-flag = 'C'.
*          "delete after create => just remove from buffer
*          DELETE TABLE lhc_buffer=>mt_buffer FROM <ls_buffer>.
*        ELSE.
*          <ls_buffer>-flag = 'D'.
*        ENDIF.
*      ELSE.
*        " not yet in buffer.
*        INSERT VALUE #( flag = 'D' root_uuid = ls_delete-RootUuid  ) INTO TABLE lhc_buffer=>mt_buffer.
*      ENDIF.
*    ENDLOOP.
*  ENDMETHOD.
*
*  METHOD read.
*
*  ENDMETHOD.
*
*  METHOD lock.
*  ENDMETHOD.
*
*  METHOD rba_Child1.
*  ENDMETHOD.
*
*  METHOD rba_Child2.
*  ENDMETHOD.
*
*  METHOD rba_Child3.
*  ENDMETHOD.
*
*  METHOD cba_Child1.
*  ENDMETHOD.
*
*  METHOD cba_Child2.
*  ENDMETHOD.
*
*  METHOD cba_Child3.
*  ENDMETHOD.

  METHOD get_instance_features.

  ENDMETHOD.

ENDCLASS.

*CLASS lsc_ZPLA_I_ROOT DEFINITION INHERITING FROM cl_abap_behavior_saver.
*  PROTECTED SECTION.
*
*    METHODS finalize REDEFINITION.
*
*    METHODS check_before_save REDEFINITION.
*
*    METHODS save REDEFINITION.
*
*    METHODS cleanup REDEFINITION.
*
*    METHODS cleanup_finalize REDEFINITION.
*
*ENDCLASS.

*CLASS lsc_ZPLA_I_ROOT IMPLEMENTATION.
*
*  METHOD finalize.
*  ENDMETHOD.
*
*  METHOD check_before_save.
*  ENDMETHOD.
*
*  METHOD save.
*    DATA lt_data TYPE STANDARD TABLE OF zpla_aroot.
*    " find all rows in buffer with flag = created
*    lt_data = VALUE #(  FOR row IN lhc_buffer=>mt_buffer WHERE  ( flag = 'C' ) (  row-lv_data ) ).
*    IF lt_data IS NOT INITIAL.
*      INSERT zpla_aroot FROM TABLE @lt_data.
*    ENDIF.
*    " find all rows in buffer with flag = updated
*    lt_data = VALUE #(  FOR row IN lhc_buffer=>mt_buffer WHERE  ( flag = 'U' ) (  row-lv_data ) ).
*    IF lt_data IS NOT INITIAL.
*      UPDATE zpla_aroot FROM TABLE @lt_data.
*    ENDIF.
*
*    " find all rows in buffer with flag = deleted
*    lt_data = VALUE #(  FOR row IN lhc_buffer=>mt_buffer WHERE  ( flag = 'D' ) (  row-lv_data ) ).
*    IF lt_data IS NOT INITIAL.
*      DELETE zpla_aroot FROM TABLE @lt_data.
*    ENDIF.
*
*    CLEAR lhc_buffer=>mt_buffer.
*  ENDMETHOD.
*
*  METHOD cleanup.
*  ENDMETHOD.
*
*  METHOD cleanup_finalize.
*  ENDMETHOD.
*
*ENDCLASS.

CLASS lhc_Root DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Root RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Root.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Root.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Root.

    METHODS read FOR READ
      IMPORTING keys FOR READ Root RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Root.

    METHODS rba_Child1 FOR READ
      IMPORTING keys_rba FOR READ Root\_Child1 FULL result_requested RESULT result LINK association_links.

    METHODS rba_Child2 FOR READ
      IMPORTING keys_rba FOR READ Root\_Child2 FULL result_requested RESULT result LINK association_links.

    METHODS rba_Child3 FOR READ
      IMPORTING keys_rba FOR READ Root\_Child3 FULL result_requested RESULT result LINK association_links.

    METHODS cba_Child1 FOR MODIFY
      IMPORTING entities_cba FOR CREATE Root\_Child1.

    METHODS cba_Child2 FOR MODIFY
      IMPORTING entities_cba FOR CREATE Root\_Child2.

    METHODS cba_Child3 FOR MODIFY
      IMPORTING entities_cba FOR CREATE Root\_Child3.

ENDCLASS.

CLASS lhc_Root IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
*    READ ENTITIES OF zpla_i_root IN LOCAL MODE
*        ENTITY Root
*            FIELDS ( Field1 Field01 Field02 )
*            WITH VALUE #( ( RootUuid = '12345678901234567890123789002' ) )
*    RESULT DATA(lt_root). "table
*
*
**     TYPES:
**    ty_t_chrg_read_result     TYPE TABLE FOR READ RESULT zpla_i_root .
**    TYPES:
**    ty_t_chrg_map             TYPE TABLE FOR MAPPED zpla_i_root .
*
*    DATA ls_ex1 TYPE zpla_aroot.
*
**    ls_ex1 = CORRESPONDING #( lt_root ).
*
*    LOOP AT lt_root ASSIGNING FIELD-SYMBOL(<ls_root>).
*        ls_ex1 = CORRESPONDING #( <ls_root>  ).
*    ENDLOOP.


  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Child1.
  ENDMETHOD.

  METHOD rba_Child2.
  ENDMETHOD.

  METHOD rba_Child3.
  ENDMETHOD.

  METHOD cba_Child1.
  ENDMETHOD.

  METHOD cba_Child2.
  ENDMETHOD.

  METHOD cba_Child3.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZPLA_I_ROOT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZPLA_I_ROOT IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

CLASS zcl_pla_fill_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.




CLASS ZCL_PLA_FILL_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: it_root TYPE TABLE OF zpla_aroot.
    DATA: it_child1 TYPE TABLE OF zpla_achild1.
    DATA: it_child2 TYPE TABLE OF zpla_achild2.
    DATA: it_child3 TYPE TABLE OF zpla_achild3.
    DATA: it_table1 TYPE TABLE OF zpla_atable1.

*    it_root = VALUE #(
*    ( Root_Uuid  = '12345678901234567890123456789002' field_1 = 'key 1' field_2 = 'New' field_3 = '1' field_4 = 'field 4' field_5 = '5' )
*    ( Root_Uuid  = '12345678901234567890123456789003' field_1 = 'key 1' field_2 = 'New' field_3 = '1' field_4 = 'field 4' field_5 = '6' )
*    ( Root_Uuid  = '12345678901234567890123456789004' field_1 = 'key 1' field_2 = 'New' field_3 = '1' field_4 = 'field 4' field_5 = '7' )
*    ).
*
*    it_child1 = VALUE #(
*    ( Child1_Uuid = '12345678901234567890123456789011' Root_Uuid  = '12345678901234567890123456789002' field_1 = 'field 1' field_2 = 'child 1' field_3 = '1' field_4 = 'field 4' field_5 = '5' )
*    ( Child1_Uuid = '12345678901234567890123456789012' Root_Uuid  = '12345678901234567890123456789003' field_1 = 'field 1' field_2 = 'child 1' field_3 = '1' field_4 = 'field 4' field_5 = '6' )
*    ( Child1_Uuid = '12345678901234567890123456789013' Root_Uuid  = '12345678901234567890123456789004' field_1 = 'field 1' field_2 = 'child 1' field_3 = '1' field_4 = 'field 4' field_5 = '7' )
*    ).
*
*    it_child2 = VALUE #(
*    ( Child2_Uuid = '12345678901234567890123456789021' Root_Uuid  = '12345678901234567890123456789002' field_1 = 'field 1' field_2 = 'child 2' field_3 = '1' field_4 = 'field 4' field_5 = '5' )
*    ( Child2_Uuid = '12345678901234567890123456789022' Root_Uuid  = '12345678901234567890123456789003' field_1 = 'field 1' field_2 = 'child 2' field_3 = '1' field_4 = 'field 4' field_5 = '6' )
*    ( Child2_Uuid = '12345678901234567890123456789023' Root_Uuid  = '12345678901234567890123456789004' field_1 = 'field 1' field_2 = 'child 2' field_3 = '1' field_4 = 'field 4' field_5 = '7' )
*    ).
*
*    it_child3 = VALUE #(
*    ( Child3_Uuid = '12345678901234567890123456789031' Root_Uuid  = '12345678901234567890123456789002' field_1 = 'field 1' field_2 = 'child 3' field_3 = '1' field_4 = 'field 4' field_5 = '5' )
*    ( Child3_Uuid = '12345678901234567890123456789032' Root_Uuid  = '12345678901234567890123456789003' field_1 = 'field 1' field_2 = 'child 3' field_3 = '1' field_4 = 'field 4' field_5 = '6' )
*    ( Child3_Uuid = '12345678901234567890123456789033' Root_Uuid  = '12345678901234567890123456789004' field_1 = 'field 1' field_2 = 'child 3' field_3 = '1' field_4 = 'field 4' field_5 = '7' )
*    ).
*
*    it_table1 = VALUE #(
*    ( field_1 = 'key 1' field_01 = 'London' field_02 = 'GB' field_03 = '2' field_04 = 'field 4' field_05 = '5' )
*    ( field_1 = 'key 2' field_01 = 'New-York' field_02 = 'US' field_03 = '3' field_04 = 'field 4' field_05 = '5' )
*    ( field_1 = 'key 3' field_01 = 'Rome' field_02 = 'IT' field_03 = '4' field_04 = 'field 4' field_05 = '5' )
*    ( field_1 = 'key 4' field_01 = 'Paris' field_02 = 'FR' field_03 = '5' field_04 = 'field 4' field_05 = '5' )
*    ( field_1 = 'key 5' field_01 = 'Madrid' field_02 = 'ES' field_03 = '6' field_04 = 'field 4' field_05 = '5' )
*    ).

    DELETE FROM zpla_aroot.
    INSERT zpla_aroot FROM TABLE @it_root.

    DELETE FROM zpla_achild1.
    INSERT zpla_achild1 FROM TABLE @it_child1.

    DELETE FROM zpla_achild2.
    INSERT zpla_achild2 FROM TABLE @it_child2.

    DELETE FROM zpla_achild3.
    INSERT zpla_achild3 FROM TABLE @it_child3.

    DELETE FROM zpla_atable1.
    INSERT zpla_atable1 FROM TABLE @it_table1.

    out->write( 'data was inserted successfully!' ).

  ENDMETHOD.
ENDCLASS.




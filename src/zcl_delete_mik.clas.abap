CLASS zcl_delete_mik DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DELETE_MIK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zrap_atrav_mik.
    DELETE FROM zrap_abook_mik.
    commit work.
  endmethod.
ENDCLASS.

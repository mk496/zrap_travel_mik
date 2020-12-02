CLASS zcl_rap_eml_mik DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_EML_MIK IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.
       "STEP 1 = READ
        READ ENTITIES OF zi_rap_2020_travel
        ENTITY travel
        FROM VALUE #( ( traveluuid = '72DE0BD08BB6924D170009027659A94B' ) )
        result data(travels).
       out->write( travels ).
*

*         "STEP 2 = READ with fiedls
*        READ ENTITIES OF zi_rap_2020_travel
*        ENTITY travel
*        FIELDS ( Agencyid CustomerId )
*        with VALUE #( ( traveluuid = '72DE0BD08BB6924D170009027659A94B' ) )
*        result data(travels).
*       out->write( travels ).


    "STEP 3 = READ with All fiedls
        READ ENTITIES OF zi_rap_2020_travel
        ENTITY travel
        ALL FIELDS WITH VALUE #( ( traveluuid = '72DE0BD08BB6924D170009027659A94B' ) )
        result data(travels1).
       out->write( travels1 ).


*        "STEP 4 = READ with All fields
*        READ ENTITIES OF zi_rap_2020_travel
*        ENTITY travel by \_booking
*        ALL FIELDS WITH VALUE #( ( traveluuid = '72DE0BD08BB6924D170009027659A94B' ) )
*        result data(travels).
*       out->write( travels ).

*        "STEP 5 = Unsuccessful READ
*            READ ENTITIES OF zi_rap_2020_travel
*            ENTITY travel
*            ALL FIELDS WITH VALUE #( ( traveluuid = '11111111111111111111111111111111' ) )
*            result data(travels)
*            failed data(failed)
*            reported data(reported).
*
*           out->write( travels ).
*           out->write( failed ).    "complex structure not supported by the console output
*           out->write( reported ).  "complex structure not supported by the console output


*"STEP 6 = MODIFY OPERATIONS
*            MODIFY ENTITIES OF zi_rap_2020_travel
*            ENTITY travel
*            UPDATE
*                SET FIELDS WITH VALUE
*                #( ( TravelUUID = '72DE0BD08BB6924D170009027659A94B'
*                      Description = ' Exercise modificacion decription' ) )
*
*           failed DATA(failed)
*           reported data(reported).
*
*           out->write( 'update done' ).
** para que los cambios sean visibles se debe ejectar commit
*           COMMIT ENTITIES
*            RESPONSE OF zi_rap_2020_travel
*            failed data(failed_commit)
*            reported data(reported_commit).
*

"STEP 7 = create new record Using MODIFY statement
*            MODIFY ENTITIES OF zi_rap_2020_travel
*            ENTITY travel
*            CREATE
*                SET FIELDS WITH VALUE
*                #( ( %CID = 'MycontentId_1'
*                     agencyid = '70012'
*                     customerid = '14'
*                     Begindate = cl_abap_context_info=>get_system_date(  )
*                     Enddate = cl_abap_context_info=>get_system_date(  ) + 10
*                     Description = ' Exercise modificacion decription' ) )
*
*           mapped data(mapped)
*           failed DATA(failed)
*           reported data(reported).
*
*           out->write( 'mapped-travel' ).
** para que los cambios sean visibles se debe ejectar commit
*           COMMIT ENTITIES
*            RESPONSE OF zi_rap_2020_travel
*            failed data(failed_commit)
*            reported data(reported_commit).
*           out->write( 'created done' ).
           endmethod.
ENDCLASS.

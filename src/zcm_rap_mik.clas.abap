CLASS zcm_rap_mik DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES if_abap_behv_message.
 CONSTANTS:
      BEGIN OF date_interval,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_MIK',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'BEGINDATE',
        attr2 TYPE scx_attrname VALUE 'ENDDATE',
        attr3 TYPE scx_attrname VALUE 'TRAVELID',
        attr4 TYPE scx_attrname VALUE '',
      END OF date_interval .
     constants:
      BEGIN OF begin_date_before_system_date,
        msgid TYPE symsgid value 'ZRAP_MSG_MIK',
        msgno TYPE symsgno value '002',
        attr1 type scx_attrname value 'BEGINDATE',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      END OF BEGIN_DATE_BEFORE_SYSTEM_DATE.

    CONSTANTS:
    BEGIN OF customer_unknown,
        msgid TYPE symsgid value 'ZRAP_MSG_MIK',
        msgno TYPE symsgno value '003',
        attr1 type scx_attrname value 'CUSTOMERID',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      END OF CUSTOMER_UNKNOWN.

      CONSTANTS:
      BEGIN OF agency_unknown,
        msgid TYPE symsgid value 'ZRAP_MSG_MIK',
        msgno TYPE symsgno value '004',
        attr1 type scx_attrname value 'AGENCYID',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      END OF AGENCY_UNKNOWN.

     CONSTANTS:
     BEGIN OF unauthorized,
        msgid TYPE symsgid value 'ZRAP_MSG_MIK',
        msgno TYPE symsgno value '005',
        attr1 type scx_attrname value '',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      END OF UNAUTHORIZED.

    METHODS constructor
        IMPORTING
        severity   TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid     LIKE if_t100_message=>t100key OPTIONAL
        previous   TYPE REF TO cx_root OPTIONAL
        begindate  TYPE /dmo/begin_date OPTIONAL
        enddate    TYPE /dmo/end_date OPTIONAL
        travelid   TYPE /dmo/travel_id OPTIONAL
        customerid TYPE /dmo/customer_id OPTIONAL
        agencyid   TYPE /dmo/agency_id  OPTIONAL
      .

    DATA begindate TYPE /dmo/begin_date READ-ONLY.
    DATA enddate TYPE /dmo/end_date READ-ONLY.
    DATA travelid TYPE string READ-ONLY.
    DATA customerid TYPE string READ-ONLY.
    DATA agencyid TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCM_RAP_MIK IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.

    me->begindate = begindate.
    me->enddate = enddate.
    me->travelid = |{ travelid ALPHA = OUT }|.
    me->customerid = |{ customerid ALPHA = OUT }|.
    me->agencyid = |{ agencyid ALPHA = OUT }|.
  ENDMETHOD.
ENDCLASS.

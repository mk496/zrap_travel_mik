@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RAP_BOOKING_MIK as select from zrap_abook_mik as Booking
  association  to parent ZI_RAP_TRAVEL_MIK as _Travel on $projection.TravelUUID = _Travel.TravelUUID

  association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection on $projection.CarrierID = _Connection.AirlineID 
                                                        and $projection.ConnectionID = _Connection.ConnectionID
  association [1..1] to /DMO/I_Flight as _Flight on $projection.CarrierID = _Flight.AirlineID
                                                and $projection.ConnectionID = _Flight.ConnectionID
                                                and $projection.FlightDate = _Flight.FlightDate
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency

{
    key  booking_uuid as BookingUUID,
         travel_uuid as TravelUUID,
    booking_id as BookingID,    
    booking_date as BookingDate,
    customer_id as CustomerID,
    carrier_id as CarrierID,
    connection_id as ConnectionID,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,    
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    /* associations */
    _Travel,
    _Customer,
    _Carrier,
    _Connection,
    _Flight,
    _Currency
    //ZRAP_ABOOK_MIK
//    key booking_uuid,
//    travel_uuid,
//    booking_id,
//    booking_date,
//    customer_id,
//    carrier_id,
//    connection_id,
//    flight_date,
//    flight_price,
//    currency_code,
//    created_by,
//    last_changed_by,
//    local_last_changed_at
}
//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #CHECK
//@EndUserText.label: 'Travel CD View'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
//define root view entity ZI_RAP_TRAVEL_MIK as select from zrap_atrav_mik as Travel
// composition [0..*] of ZI_RAP_BOOKING_MIK as _Booking //on $projection.TravelUUID = _Booking.TravelUUID
//  
//  association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID
//  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
//  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
//
//
// {
//    //ZRAP_ATRAV_MIK
//    key travel_uuid as TravelUUID,
//    travel_id as TravelID,
//    agency_id as AgencyID,
//    customer_id as CustomerID,
//    begin_date as BeginDate,
//    end_date as EndDate,
//    @Semantics.amount.currencyCode: 'CurrencyCode'
//    booking_fee as BookingFee,
//    @Semantics.amount.currencyCode: 'CurrencyCode'
//    total_price as TotalPrice,
//    currency_code as CurrencyCode,
//    description as Description,
//    overall_status as TravelStatus,
//    @Semantics.user.createdBy: true
//    created_by as CreatedBy,
//    @Semantics.systemDateTime.createdAt: true
//    created_at as CreatedAt,
//    @Semantics.user.lastChangedBy: true
//    last_changed_by as LastChangedBy,
//    @Semantics.systemDateTime.lastChangedAt: true
//    last_changed_at as LastChangedAt,
//    @Semantics.systemDateTime.localInstanceLastChangedAt: true
//    local_last_changed_at as LocalLastChangedAt,
//    /* associations */
//    _Booking,
//    _Agency,
//    _Customer,
//    _Currency
//    //ZRAP_ATRAV_MIK
////    key travel_uuid,
////    travel_id,
////    agency_id,
////    customer_id,
////    begin_date,
////    end_date,
////    booking_fee,
////    total_price,
////    currency_code,
////    description,
////    overall_status,
////    created_by,
////    created_at,
////    last_changed_by,
////    last_changed_at,
////    local_last_changed_at
//}

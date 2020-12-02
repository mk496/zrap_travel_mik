@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_TRAVEL_MIK
as projection on ZI_RAP_TRAVEL_MIK as Travel {
    //ZI_RAP_TRAVEL_MIK
       key TravelUUID,
    TravelID,
//    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Agency', element: 'AgencyID'}}]
//       @Consumption.valueHelpDefinition: [{ entity: {name: 'ZZ_TRAVEL_AGENCY_ES55173B5845B', element: 'AgencyId'}}]
          @Consumption.valueHelpDefinition: [{ entity: {name: 'zce_rap_agency_mik', element: 'AgencyId'}}]
      
//    @ObjectModel.text.element: ['AgencyName']
    @Search.defaultSearchElement: true
    AgencyID,
//    _Agency.Name as AgencyName,
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Customer', element: 'CustomerID'}}]
    @ObjectModel.text.element: ['CustomerName']
    @Search.defaultSearchElement: true
    CustomerID,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency '}}]
    CurrencyCode,
    Description,
    TravelStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    //ZI_RAP_TRAVEL_MIK
    _Agency,
    _Booking : redirected to composition child ZC_RAP_BOOKING_MIK,
    _Currency,
    _Customer
//    key TravelUUID,
//    TravelID,
//    AgencyID,
//    CustomerID,
//    BeginDate,
//    EndDate,
//    BookingFee,
//    TotalPrice,
//    CurrencyCode,
//    Description,
//    TravelStatus,
//    CreatedBy,
//    CreatedAt,
//    LastChangedBy,
//    LastChangedAt,
//    LocalLastChangedAt,
//    /* Associations */
//    //ZI_RAP_TRAVEL_MIK
//    _Agency,
//    _Booking,
//    _Currency,
//    _Customer
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

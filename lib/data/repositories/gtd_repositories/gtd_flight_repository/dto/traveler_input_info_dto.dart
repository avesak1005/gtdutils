// ignore_for_file: public_member_api_docs, sort_constructors_first
part of gtd_flight_repository_dto;

enum TravelerInputInfoType { traveler, contact, presenterHotel, travelerCombo }

class TravelerInputInfoDTO {
  var travelerKey = UniqueKey();
  String title = "Người lớn 1";
  String bookingNumber = "";
  String lastName = "";
  String firstName = "";
  String fullName = "";
  String email = "";
  String phoneNumber = "";
  TravelerInputInfoType infoType = TravelerInputInfoType.traveler;
  GtdGender? gender;
  FlightAdultType adultType = FlightAdultType.adult;
  DateTime? dob;
  String documentType = "";
  String passport = "";
  DateTime? passportExpiredDate;
  String nationality = "";
  String nationalityCode = "";
  String countryName = "";
  String countryCode = "";
  bool useContact = false;
  bool saveTraveler = false;
  bool isPresentHotel = false;
  String membershipType = "";
  String membershipCard = "";
  List<SsrOfferDTO> selectedServices;
  String supplierCode = "";
  String supplierName = "";

  // List<GtdSavedTravellerRs> savedTravellers;
  // List<GtdCountryCodeRs> countries;
  TravelerInputInfoDTO({
    this.title = "",
    this.bookingNumber = "",
    this.lastName = "",
    this.firstName = "",
    this.fullName = "",
    this.email = "",
    this.phoneNumber = "",
    this.infoType = TravelerInputInfoType.traveler,
    this.gender,
    this.adultType = FlightAdultType.adult,
    this.dob,
    this.documentType = "",
    this.passport = "",
    this.passportExpiredDate,
    this.nationality = "",
    this.nationalityCode = "",
    this.countryName = "",
    this.countryCode = "",
    this.useContact = false,
    this.saveTraveler = false,
    this.isPresentHotel = false,
    this.membershipType = "",
    this.membershipCard = "",
    this.selectedServices = const [],
    this.supplierCode = "",
    this.supplierName = "",
    // this.savedTravellers = const [],
    // this.countries = const [],
  });

  String get getFullName => "$lastName $firstName";
  String get fullnameKey => "$lastName$firstName".trim().toLowerCase();

  BookingTravelerInfoRq get toBookingTravelerInfoRq {
    // if (dob == null || firstName.isEmpty || lastName.isEmpty || gender == null) {
    //   throw GtdApiError(message: "Must have birthday");
    // }
    TravelerRq traveler = TravelerRq(
        adultType: adultType.value.toUpperCase(),
        documentType: documentType,
        documentNumber: passport,
        documentExpiredDate: passportExpiredDate?.toIso8601String(),
        documentIssuingCountry: countryCode,
        firstName: firstName,
        gender: gender!.name.toUpperCase(),
        surName: lastName,
        bookingNumber: bookingNumber,
        dob: dob,
        personRepresentation: isPresentHotel);
    List<SsrOfferDTO> serviceRequests = selectedServices;
    BookingTravelerInfoRq travelerInfo = BookingTravelerInfoRq(traveler: traveler, serviceRequests: serviceRequests);
    return travelerInfo;
  }

  BookingContactRq get toBookingContactRq {
    // List<String> splitNames = fullName.split(" ");
    // if (splitNames.length < 2) {
    //   throw GtdApiError(message: "Fullname must greater than 2 words");
    // }

    // String surName = lastName;
    // String firstName = fullName.replaceRange(0, surName.length, "").trim();
    BookingContactRq contact = BookingContactRq(
      email: email,
      firstName: firstName,
      phoneNumber1: phoneNumber,
      surName: lastName,
      bookingNumber: bookingNumber,
    );
    return contact;
  }

  List<SsrOfferDTO> getListSSRItemsByServiceType(
      {required ServiceType serviceType, required FlightDirection flightDirection}) {
    return selectedServices
        .where((element) => element.serviceType == serviceType || element.bookingDirection == flightDirection)
        .toList();
  }

  void updateSelectedSSRItems(List<SsrOfferDTO> ssrOfferDTOs, ServiceType serviceType) {
    var exceptOffers = selectedServices.where((element) => element.serviceType != serviceType).toList();
    selectedServices = [...exceptOffers, ...ssrOfferDTOs];
  }

  TravelerInputInfoDTO copyWith({
    String? title,
    String? bookingNumber,
    String? lastName,
    String? firstName,
    String? fullName,
    String? email,
    String? phoneNumber,
    TravelerInputInfoType? infoType,
    GtdGender? gender,
    FlightAdultType? adultType,
    DateTime? dob,
    String? passport,
    DateTime? passportExpiredDate,
    String? nationality,
    String? nationalityCode,
    String? countryName,
    String? countryCode,
    bool? useContact,
    bool? saveTraveler,
    bool? isPresentHotel,
    String? membershipType,
    String? membershipCard,
    List<SsrOfferDTO>? selectedServices,
    String? supplierCode,
    String? supplierName,
  }) {
    return TravelerInputInfoDTO(
      title: title ?? this.title,
      bookingNumber: bookingNumber ?? this.bookingNumber,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      infoType: infoType ?? this.infoType,
      gender: gender ?? this.gender,
      adultType: adultType ?? this.adultType,
      dob: dob ?? this.dob,
      passport: passport ?? this.passport,
      passportExpiredDate: passportExpiredDate ?? this.passportExpiredDate,
      nationality: nationality ?? this.nationality,
      nationalityCode: nationalityCode ?? this.nationalityCode,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      useContact: useContact ?? this.useContact,
      saveTraveler: saveTraveler ?? this.saveTraveler,
      isPresentHotel: isPresentHotel ?? this.isPresentHotel,
      membershipType: membershipType ?? this.membershipType,
      membershipCard: membershipCard ?? this.membershipCard,
      selectedServices: selectedServices ?? this.selectedServices,
      supplierCode: supplierCode ?? this.supplierCode,
      supplierName: supplierName ?? this.supplierName,
    );
  }

  GtdSavedTravellerRs toTraveller() {
    return GtdSavedTravellerRs(
      surName: lastName,
      firstName: firstName,
      email: email,
      phoneNumber1: phoneNumber,
      nationality: nationality,
      dob: dob,
      documentType: documentType,
      documentNumber: passport,
      expiredDate: passportExpiredDate,
      issuingCountry: countryCode,
      nationalityName: countryName,
    );
  }
}

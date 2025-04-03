// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/group_priced_itinerary.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/priced_itinerary.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/meta_resource/models/json_models/flight_segment.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/meta_resource/models/json_models/origin_destination_option.dart';
import 'package:gtd_utils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:gtd_utils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_location.dart';
import 'package:gtd_utils/helpers/extension/date_time_extension.dart';

class GtdFlightItemInfo {
  String? logo;
  String? pnr;
  String? flightNo;
  // String? flightNumber;
  List<FlightSegment>? flightSegments;
  String? airline;
  String? airlineName;
  String? airSupplier;
  String? aircraft;
  String? validatingAirlineCode;
  int? journeyDuration;
  DateTime? originDateTime;
  DateTime? destinationDateTime;
  DateTime? arrivalDateTime;
  GtdLocation? originLocation;
  GtdLocation? arrivalLocation;
  GtdLocation? destinationLocation;

  // List<GtdAirlineCabinClass>? cabinOptions;

  GtdFlightItemInfo({
    this.logo,
    this.pnr,
    this.flightNo,
    this.flightSegments,
    this.airline,
    this.airlineName,
    this.airSupplier,
    this.aircraft,
    this.validatingAirlineCode,
    this.journeyDuration,
    this.originDateTime,
    this.destinationDateTime,
    this.arrivalDateTime,
    this.originLocation,
    this.arrivalLocation,
    this.destinationLocation,
  });

  factory GtdFlightItemInfo.fromGroupPricedItinerary(
      GroupPricedItinerary groupPricedItinerary, FlightDirection flightDirection) {
    GtdFlightItemInfo flightItemInfo = GtdFlightItemInfo();
    OriginDestinationOption? originDestinationOptionDirection = groupPricedItinerary.pricedItineraries
        ?.map((e) => e.originDestinationOptionDirection(flightDirection.name))
        .firstOrNull;
    flightItemInfo.airline = groupPricedItinerary.airline;
    flightItemInfo.aircraft =
        groupPricedItinerary.aircraft ?? originDestinationOptionDirection?.flightSegments?.firstOrNull?.aircraft;
    flightItemInfo.airlineName = groupPricedItinerary.airlineName;
    flightItemInfo.flightNo = groupPricedItinerary.fightNo;
    flightItemInfo.airSupplier = groupPricedItinerary.airSupplier;
    flightItemInfo.validatingAirlineCode = groupPricedItinerary.pricedItineraries?.firstOrNull?.validatingAirlineCode;
    var originLocation = GtdLocation(
        locationCode: groupPricedItinerary.originLocationCode,
        locationName: groupPricedItinerary.originLocationName,
        countryCode: groupPricedItinerary.originCountryCode,
        countryName: groupPricedItinerary.originCountry,
        city: groupPricedItinerary.originCity);
    var destinationLocation = GtdLocation(
        locationCode: groupPricedItinerary.destinationLocationCode,
        locationName: groupPricedItinerary.destinationLocationName,
        countryCode: groupPricedItinerary.destinationCountryCode,
        countryName: groupPricedItinerary.destinationCountry,
        city: groupPricedItinerary.destinationCity);
    //Update flightItem - Swap origin FlightDirectionReturn with destination location if flightType== INTERNATIONAL && roundType == ROUNDTRIP
    if (groupPricedItinerary.flightType == "INTERNATIONAL" &&
        groupPricedItinerary.roundType == "ROUNDTRIP" &&
        flightDirection == FlightDirection.r) {
      flightItemInfo.originLocation = destinationLocation;
      flightItemInfo.destinationLocation = originLocation;
    } else {
      flightItemInfo.originLocation = originLocation;
      flightItemInfo.destinationLocation = destinationLocation;
    }
    // flightItemInfo.flightNumber = originDestinationOptionDirection?.flightSegments?.firstOrNull?.flightNumber;
    flightItemInfo.flightSegments = originDestinationOptionDirection?.flightSegments;
    flightItemInfo.journeyDuration = originDestinationOptionDirection?.journeyDuration;
    flightItemInfo.originDateTime = originDestinationOptionDirection?.originDateTime;
    flightItemInfo.destinationDateTime = originDestinationOptionDirection?.destinationDateTime;

    // flightItemInfo.cabinOptions = groupPricedItinerary.pricedItineraries
    //     ?.map((e) => GtdAirlineCabinClass.fromPricedItinerary(e, flightDirection))
    //     .toList();

    return flightItemInfo;
  }

  String get airlineLogo {
    String? airlineCode = (airline == "VFC" || airline == "0V" || airline == "BL") ? "VN" : airline;
    if (airlineCode == "BL" || airlineCode == "VN" || airlineCode == "QH" || airlineCode == "VJ") {
      return 'https://750bc7d3dc6109b.cmccloud.com.vn/Booking/AirBooking/images/AirLogos/$airlineCode.png';
    } else {
      return 'https://750bc7d3dc6109b.cmccloud.com.vn/Booking/AirBooking/images/AirLogos/$airlineCode.gif';
    }
  }

  String get flightDetailSubtitle {
    return "$airline$flightNo | $aircraft";
  }

  String get flightLocationTitle {
    return "${originLocation?.locationCode} - ${destinationLocation?.locationCode}";
  }

  String journeyDurationDate() {
    return GtdDateTime.timeStampToDateString(journeyDuration ?? 0);
  }

  String get originTime {
    return originDateTime?.utcDate("HH:mm") ?? "";
  }

  String get destinationTime {
    return destinationDateTime?.utcDate("HH:mm") ?? "";
  }

  // GtdFlightItemInfo copyWith() {
  //   var flightItemInfo = GtdFlightItemInfo();
  //   flightItemInfo.logo = logo;
  //   flightItemInfo.pnr = pnr;
  //   flightItemInfo.flightNo = flightNo;
  //   flightItemInfo.flightSegments = flightSegments;
  //   flightItemInfo.airline = airline;
  //   flightItemInfo.airlineName = airlineName;
  //   flightItemInfo.airSupplier = airSupplier;
  //   flightItemInfo.aircraft = aircraft;
  //   flightItemInfo.validatingAirlineCode = aircraft;
  //   return GtdFlightItemInfo(
  //     logo ?? this.logo,
  //     pnr ?? this.pnr,
  //     flightNo ?? this.flightNo,
  //     flightSegments ?? this.flightSegments,
  //     airline ?? this.airline,
  //     airlineName ?? this.airlineName,
  //     airSupplier ?? this.airSupplier,
  //     aircraft ?? this.aircraft,
  //     validatingAirlineCode ?? this.validatingAirlineCode,
  //     journeyDuration ?? this.journeyDuration,
  //     originDateTime ?? this.originDateTime,
  //     destinationDateTime ?? this.destinationDateTime,
  //     arrivalDateTime ?? this.arrivalDateTime,
  //     originLocation ?? this.originLocation,
  //     arrivalLocation ?? this.arrivalLocation,
  //     destinationLocation ?? this.destinationLocation,
  //   );
  // }

  GtdFlightItemInfo copyWith({
    String? logo,
    String? pnr,
    String? flightNo,
    List<FlightSegment>? flightSegments,
    String? airline,
    String? airlineName,
    String? airSupplier,
    String? aircraft,
    String? validatingAirlineCode,
    int? journeyDuration,
    DateTime? originDateTime,
    DateTime? destinationDateTime,
    DateTime? arrivalDateTime,
    GtdLocation? originLocation,
    GtdLocation? arrivalLocation,
    GtdLocation? destinationLocation,
  }) {
    return GtdFlightItemInfo(
      logo: logo ?? this.logo,
      pnr: pnr ?? this.pnr,
      flightNo: flightNo ?? this.flightNo,
      flightSegments: flightSegments ?? this.flightSegments,
      airline: airline ?? this.airline,
      airlineName: airlineName ?? this.airlineName,
      airSupplier: airSupplier ?? this.airSupplier,
      aircraft: aircraft ?? this.aircraft,
      validatingAirlineCode: validatingAirlineCode ?? this.validatingAirlineCode,
      journeyDuration: journeyDuration ?? this.journeyDuration,
      originDateTime: originDateTime ?? this.originDateTime,
      destinationDateTime: destinationDateTime ?? this.destinationDateTime,
      arrivalDateTime: arrivalDateTime ?? this.arrivalDateTime,
      originLocation: originLocation ?? this.originLocation,
      arrivalLocation: arrivalLocation ?? this.arrivalLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
    );
  }
}

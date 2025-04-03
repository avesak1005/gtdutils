import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/json_model/member_card.dart';

class UpdateTravellerRequest {
  int? id;
  String? customerCode;
  bool? isDefault;
  String? email;
  String? gender;
  String? firstName;
  String? surName;
  DateTime? dob;
  String? adultType;
  String? country;
  String? city;
  String? address1;
  String? address2;
  String? postalCode;
  String? phoneNumber1;
  String? phoneNumber2;
  String? phoneNumber3;
  String? phoneNumber4;
  String? phoneNumber5;
  String? documentType;
  String? nationality;
  String? nationalityName;
  String? companyAddress;
  String? companyName;
  String? companyTaxCode;
  String? documentNumber;
  dynamic expiredDate;
  dynamic issuedDate;
  String? issuingCountry;
  String? memberCard;
  int? profileId;
  List<MemberCardsSimplified>? memberCards;
  String? travelerCode;
  bool? updateTravellerRequestDefault;

  UpdateTravellerRequest({
    this.id,
    this.customerCode,
    this.isDefault,
    this.email,
    this.gender,
    this.firstName,
    this.surName,
    this.dob,
    this.adultType,
    this.country,
    this.city,
    this.address1,
    this.address2,
    this.postalCode,
    this.phoneNumber1,
    this.phoneNumber2,
    this.phoneNumber3,
    this.phoneNumber4,
    this.phoneNumber5,
    this.documentType,
    this.nationality,
    this.nationalityName,
    this.companyAddress,
    this.companyName,
    this.companyTaxCode,
    this.documentNumber,
    this.expiredDate,
    this.issuedDate,
    this.issuingCountry,
    this.memberCard,
    this.profileId,
    this.memberCards,
    this.travelerCode,
    this.updateTravellerRequestDefault,
  });

  factory UpdateTravellerRequest.fromJson(Map<String, dynamic> json) => UpdateTravellerRequest(
        id: json["id"],
        customerCode: json["customerCode"],
        isDefault: json["isDefault"],
        email: json["email"],
        gender: json["gender"],
        firstName: json["firstName"],
        surName: json["surName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        adultType: json["adultType"],
        country: json["country"],
        city: json["city"],
        address1: json["address1"],
        address2: json["address2"],
        postalCode: json["postalCode"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        phoneNumber3: json["phoneNumber3"],
        phoneNumber4: json["phoneNumber4"],
        phoneNumber5: json["phoneNumber5"],
        documentType: json["documentType"],
        nationality: json["nationality"],
        nationalityName: json["nationalityName"],
        companyAddress: json["companyAddress"],
        companyName: json["companyName"],
        companyTaxCode: json["companyTaxCode"],
        documentNumber: json["documentNumber"],
        expiredDate: json["expiredDate"],
        issuedDate: json["issuedDate"],
        issuingCountry: json["issuingCountry"],
        memberCard: json["memberCard"],
        profileId: json["profileId"],
        memberCards:
            json["memberCards"] == null ? [] : List<MemberCardsSimplified>.from(json["memberCards"]!.map((x) => x)),
        travelerCode: json["travelerCode"],
        updateTravellerRequestDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerCode": customerCode,
        "isDefault": isDefault,
        "email": email,
        "gender": gender,
        "firstName": firstName,
        "surName": surName,
        "dob": dob?.toIso8601String(),
        "adultType": adultType,
        "country": country,
        "city": city,
        "address1": address1,
        "address2": address2,
        "postalCode": postalCode,
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "phoneNumber3": phoneNumber3,
        "phoneNumber4": phoneNumber4,
        "phoneNumber5": phoneNumber5,
        "documentType": documentType,
        "nationality": nationality,
        "nationalityName": nationalityName,
        "companyAddress": companyAddress,
        "companyName": companyName,
        "companyTaxCode": companyTaxCode,
        "documentNumber": documentNumber,
        "expiredDate": expiredDate,
        "issuedDate": issuedDate,
        "issuingCountry": issuingCountry,
        "memberCard": memberCard,
        "profileId": profileId,
        "memberCards": memberCards == null ? [] : List<MemberCardsSimplified>.from(memberCards!.map((x) => x)),
        "travelerCode": travelerCode,
        "default": updateTravellerRequestDefault,
      };
}

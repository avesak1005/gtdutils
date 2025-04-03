import 'package:gtd_utils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

enum CooperationClass {
  ca,
  sa,
  cn
} // ca: Central Agent(Doanh nghiep), sa: Sub Agent(Dai ly), cn: Customer(Cong tac vien)

class AgencyRegisterRq {
  String? shortName;
  String? fullName;
  String? address1;
  String? representativePhone;
  String? representativeMail;
  String? subMail;
  String? phoneNumber1;
  String? agentAdminUsername;
  String? email;
  String? phoneContact1;
  String? phoneContact2;
  String? taxCode;

  String? verify;
  String? status;
  String? notify;
  String? stateCode;
  String? stateName;

  String? countryCode;
  String? cooperationClass;
  String? countryName;
  bool? activeNow;
  String? contactPerson1;
  String? contactPerson2;
  String? representativeName;

  OtpServiceReq? otpServiceReq;

  AgencyRegisterRq({
    this.shortName,
    this.fullName,
    this.address1,
    this.representativePhone,
    this.representativeMail,
    this.subMail,
    this.phoneNumber1,
    this.agentAdminUsername,
    this.email,
    this.phoneContact1,
    this.phoneContact2,
    this.verify,
    this.status,
    this.notify,
    this.stateCode,
    this.stateName,
    this.countryCode,
    this.cooperationClass,
    this.countryName,
    this.activeNow,
    this.contactPerson1,
    this.contactPerson2,
    this.representativeName,
    this.taxCode,
    this.otpServiceReq,
  });

  factory AgencyRegisterRq.initRequest(
      {required String email,
      required String phoneNumber,
      required String agencyName,
      required String address,
      required CooperationClass cooperationClass,
      required stateCode,
      required stateName,
      String? status = "DEACTIVATED",
      String? companyName,
      String? taxCode, 
      OtpServiceReq? otpServiceReq}) {
    return AgencyRegisterRq(
      shortName: companyName ?? agencyName,
      fullName: companyName ?? agencyName,
      address1: address,
      representativePhone: phoneNumber,
      representativeMail: email,
      representativeName: agencyName,
      subMail: email,
      phoneNumber1: phoneNumber,
      agentAdminUsername: email,
      email: email,
      phoneContact1: phoneNumber,
      phoneContact2: phoneNumber,
      // verify: "DISABLE",
      status: status ?? "DEACTIVATED",
      notify: "ENABLE",
      stateCode: stateCode,
      stateName: stateName,
      countryCode: "vn",
      cooperationClass: cooperationClass.name,
      countryName: "Vietnam",
      activeNow: false,
      contactPerson1: agencyName,
      contactPerson2: agencyName,
      taxCode: taxCode,
      otpServiceReq: otpServiceReq,
    );
  }

  factory AgencyRegisterRq.fromJson(Map<String, dynamic> json) {
    return AgencyRegisterRq(
      shortName: json['shortName'] as String?,
      fullName: json['fullName'] as String?,
      address1: json['address1'] as String?,
      representativePhone: json['representativePhone'] as String?,
      representativeMail: json['representativeMail'] as String?,
      subMail: json['subMail'] as String?,
      phoneNumber1: json['phoneNumber1'] as String?,
      agentAdminUsername: json['agentAdminUsername'] as String?,
      email: json['email'] as String?,
      phoneContact1: json['phoneContact1'] as String?,
      phoneContact2: json['phoneContact2'] as String?,
      status: json['status'] as String?,
      notify: json['notify'] as String?,
      stateCode: json['stateCode'] as String?,
      stateName: json['stateName'] as String?,
      countryCode: json['countryCode'] as String?,
      cooperationClass: json['cooperationClass'] as String?,
      countryName: json['countryName'] as String?,
      activeNow: json['activeNow'] as bool?,
      contactPerson1: json['contactPerson1'] as String?,
      contactPerson2: json['contactPerson2'] as String?,
      representativeName: json['representativeName'] as String?,
      otpServiceReq:
          json['otpServiceReq'] != null ? OtpServiceReq.fromJson(json['otpServiceReq'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shortName': shortName,
      'fullName': fullName,
      'address1': address1,
      'representativePhone': representativePhone,
      'representativeMail': representativeMail,
      'subMail': subMail,
      'phoneNumber1': phoneNumber1,
      'agentAdminUsername': agentAdminUsername,
      'email': email,
      'phoneContact1': phoneContact1,
      'phoneContact2': phoneContact2,
      'status': status,
      'notify': notify,
      'stateCode': stateCode,
      'stateName': stateName,
      'countryCode': countryCode,
      'cooperationClass': cooperationClass,
      'countryName': countryName,
      'activeNow': activeNow,
      'contactPerson1': contactPerson1,
      'contactPerson2': contactPerson2,
      'representativeName': representativeName,
      'otpServiceReq': otpServiceReq?.toJson(),
    };
  }

  // AgencyRegisterRq registerModel() {
  //   final String cooperationClass = isCA ? "ca" : (isAgent ? "sa" : "cn");

  //   final registerRQ = AgencyRegisterRq(
  //     shortName: agentNameController.text,
  //     fullName: agentNameController.text,
  //     address1: addressController.text,
  //     representativePhone: phoneController.text,
  //     representativeMail: emailController.text,
  //     subMail: emailController.text,
  //     phoneNumber1: phoneController.text,
  //     agentAdminUsername: emailController.text,
  //     email: emailController.text,
  //     phoneContact1: phoneController.text,
  //     phoneContact2: phoneController.text,
  //     cooperationForm: isAgent ? "sa" : "cn",
  //     stateCode: province?.lookupValue ?? "",
  //     stateName: province?.provinceDescription ?? "",
  //     countryCode: province?.lookupType ?? "",
  //     cooperationClass: cooperationClass,
  //     contactPerson1: contactPersonController.text,
  //     contactPerson2: contactPersonController.text,
  //   );

  //   return registerRQ;
  // }
}

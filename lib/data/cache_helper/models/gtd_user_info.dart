import 'dart:convert';
import 'dart:typed_data';

import 'package:gtd_utils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';
import 'package:gtd_utils/data/repositories/gtd_api_client/authentication_resource/models/response/agent_avatar_profile_response.dart';

class GtdUserInfo {
  AgencyFullProfile? agencyFullProfile;
  int? balance;
  AgencyShortProfile? agencyShortProfile;
  AgentAvatarProfileRs? agentAvatarProfileRs;

  GtdUserInfo({
    this.agencyFullProfile,
    this.balance,
    this.agencyShortProfile,
  });

  Uint8List? get agentAvatarByte {
    if ((agencyFullProfile?.avatar ?? "").isNotEmpty) {
      Uint8List imageBytes = base64Decode(agencyFullProfile!.avatar!);
      return imageBytes;
    }
    if ((agencyFullProfile?.agentProfiles?.first.avatar ?? "").isNotEmpty) {
      Uint8List imageBytes = base64Decode(agencyFullProfile!.agentProfiles!.first.avatar!);
      return imageBytes;
    }
    if ((agentAvatarProfileRs?.avatarImage ?? "").isNotEmpty) {
      Uint8List imageBytes = base64Decode(agentAvatarProfileRs!.avatarImage!);
      return imageBytes;
    }

    return null;
  }

  GtdUserInfo copyWith({
    AgencyFullProfile? agencyFullProfile,
    int? balance,
    AgencyShortProfile? agencyShortProfile,
  }) =>
      GtdUserInfo(
        agencyFullProfile: agencyFullProfile ?? this.agencyFullProfile,
        balance: balance ?? this.balance,
        agencyShortProfile: agencyShortProfile ?? this.agencyShortProfile,
      );

  factory GtdUserInfo.fromJson(Map<String, dynamic> json) => GtdUserInfo(
        agencyFullProfile:
            json["agencyFullProfile"] == null ? null : AgencyFullProfile.fromJson(json["agencyFullProfile"]),
        balance: json["balance"],
        agencyShortProfile:
            json["agencyShortProfile"] == null ? null : AgencyShortProfile.fromJson(json["agencyShortProfile"]),
      );

  Map<String, dynamic> toJson() => {
        "agencyFullProfile": agencyFullProfile?.toJson(),
        "balance": balance,
        "agencyShortProfile": agencyShortProfile?.toJson(),
      };
}

class AgencyFullProfile {
  String? email;
  String? status;
  String? fullName;
  bool? chkEditable;
  int? sentMail;
  bool? rootAgency;
  int? loginId;
  String? phoneNumber1;
  String? agentAdminUsername;
  String? address1;
  String? phoneContact2;
  String? representativePhone;
  String? contactPerson2;
  String? countryName;
  String? phoneContact1;
  String? agencyCode;
  bool? currentAgency;
  String? stateName;
  double? commission;
  String? agencyNumber;
  String? contactPerson1;
  String? representativeName;
  String? representativeFirstName;
  bool? activeNow;
  int? agentAdminId;
  String? orgCode;
  List<AgentProfile>? agentProfiles;
  String? representativeLastName;
  int? id;
  String? cooperationClass;
  String? shortName;
  String? stateCode;
  String? representativeMail;
  String? subMail;
  List<AgencyCaCode>? agencyCaCodes;
  String? countryCode;
  String? taxCode;
  String? phoneNumber2;
  String? address2;
  String? cityName;
  String? cityCode;
  String? cellPhone;
  String? faxNumber;
  String? branchNameOfParentAgency;
  String? branchIdOfParentAgency;
  String? note;
  String? passwd;
  String? confirmPasswd;
  String? avatar;
  String? avatarContentType;
  double? balance;
  double? credit;
  double? cash;
  double? purchasingPower;
  dynamic liability;
  dynamic accountId;
  double? revenue;
  double? revenueNoBalance;
  DateTime? createdDate;
  String? verify;
  String? notify;
  String? agencyClass;
  List<dynamic>? linkedAccounts;
  bool? fromRedis;
  dynamic extendInfo;
  dynamic integrationInfo;
  String? inviteCode;
  OtpServiceReq? otpServiceReq;
  OtpServiceRes? otpServiceRes;

  AgencyFullProfile({
    this.email,
    this.status,
    this.fullName,
    this.chkEditable,
    this.sentMail,
    this.rootAgency,
    this.loginId,
    this.phoneNumber1,
    this.agentAdminUsername,
    this.address1,
    this.phoneContact2,
    this.representativePhone,
    this.contactPerson2,
    this.countryName,
    this.phoneContact1,
    this.agencyCode,
    this.currentAgency,
    this.stateName,
    this.commission,
    this.agencyNumber,
    this.contactPerson1,
    this.representativeName,
    this.representativeFirstName,
    this.activeNow,
    this.agentAdminId,
    this.orgCode,
    this.agentProfiles,
    this.representativeLastName,
    this.id,
    this.cooperationClass,
    this.shortName,
    this.stateCode,
    this.representativeMail,
    this.subMail,
    this.agencyCaCodes,
    this.countryCode,
    this.taxCode,
    this.phoneNumber2,
    this.address2,
    this.cityName,
    this.cityCode,
    this.cellPhone,
    this.faxNumber,
    this.branchNameOfParentAgency,
    this.branchIdOfParentAgency,
    this.note,
    this.passwd,
    this.confirmPasswd,
    this.avatar,
    this.avatarContentType,
    this.balance,
    this.credit,
    this.cash,
    this.purchasingPower,
    this.liability,
    this.accountId,
    this.revenue,
    this.revenueNoBalance,
    this.createdDate,
    this.verify,
    this.notify,
    this.agencyClass,
    this.linkedAccounts,
    this.fromRedis,
    this.extendInfo,
    this.integrationInfo,
    this.inviteCode,
    this.otpServiceReq,
    this.otpServiceRes,
  });

  AgencyFullProfile copyWith({
    String? email,
    String? status,
    String? fullName,
    bool? chkEditable,
    int? sentMail,
    bool? rootAgency,
    int? loginId,
    String? phoneNumber1,
    String? agentAdminUsername,
    String? address1,
    String? phoneContact2,
    String? representativePhone,
    String? contactPerson2,
    String? countryName,
    String? phoneContact1,
    String? agencyCode,
    bool? currentAgency,
    String? stateName,
    double? commission,
    String? agencyNumber,
    String? contactPerson1,
    String? representativeName,
    String? representativeFirstName,
    bool? activeNow,
    int? agentAdminId,
    String? orgCode,
    List<AgentProfile>? agentProfiles,
    String? representativeLastName,
    int? id,
    String? cooperationClass,
    String? shortName,
    String? stateCode,
    String? representativeMail,
    String? subMail,
    List<AgencyCaCode>? agencyCaCodes,
    String? countryCode,
    String? taxCode,
    String? phoneNumber2,
    String? address2,
    String? cityName,
    String? cityCode,
    String? cellPhone,
    String? faxNumber,
    String? branchNameOfParentAgency,
    String? branchIdOfParentAgency,
    String? note,
    String? passwd,
    String? confirmPasswd,
    String? avatar,
    String? avatarContentType,
    double? balance,
    double? credit,
    double? cash,
    double? purchasingPower,
    dynamic liability,
    dynamic accountId,
    double? revenue,
    double? revenueNoBalance,
    DateTime? createdDate,
    String? verify,
    String? notify,
    String? agencyClass,
    List<dynamic>? linkedAccounts,
    bool? fromRedis,
    dynamic extendInfo,
    dynamic integrationInfo,
    String? inviteCode,
    OtpServiceReq? otpServiceReq,
    OtpServiceRes? otpServiceRes,
  }) =>
      AgencyFullProfile(
        email: email ?? this.email,
        status: status ?? this.status,
        fullName: fullName ?? this.fullName,
        chkEditable: chkEditable ?? this.chkEditable,
        sentMail: sentMail ?? this.sentMail,
        rootAgency: rootAgency ?? this.rootAgency,
        loginId: loginId ?? this.loginId,
        phoneNumber1: phoneNumber1 ?? this.phoneNumber1,
        agentAdminUsername: agentAdminUsername ?? this.agentAdminUsername,
        address1: address1 ?? this.address1,
        phoneContact2: phoneContact2 ?? this.phoneContact2,
        representativePhone: representativePhone ?? this.representativePhone,
        contactPerson2: contactPerson2 ?? this.contactPerson2,
        countryName: countryName ?? this.countryName,
        phoneContact1: phoneContact1 ?? this.phoneContact1,
        agencyCode: agencyCode ?? this.agencyCode,
        currentAgency: currentAgency ?? this.currentAgency,
        stateName: stateName ?? this.stateName,
        commission: commission ?? this.commission,
        agencyNumber: agencyNumber ?? this.agencyNumber,
        contactPerson1: contactPerson1 ?? this.contactPerson1,
        representativeName: representativeName ?? this.representativeName,
        representativeFirstName: representativeFirstName ?? this.representativeFirstName,
        activeNow: activeNow ?? this.activeNow,
        agentAdminId: agentAdminId ?? this.agentAdminId,
        orgCode: orgCode ?? this.orgCode,
        agentProfiles: agentProfiles ?? this.agentProfiles,
        representativeLastName: representativeLastName ?? this.representativeLastName,
        id: id ?? this.id,
        cooperationClass: cooperationClass ?? this.cooperationClass,
        shortName: shortName ?? this.shortName,
        stateCode: stateCode ?? this.stateCode,
        representativeMail: representativeMail ?? this.representativeMail,
        subMail: subMail ?? this.subMail,
        agencyCaCodes: agencyCaCodes ?? this.agencyCaCodes,
        countryCode: countryCode ?? this.countryCode,
        taxCode: taxCode ?? this.taxCode,
        phoneNumber2: phoneNumber2 ?? this.phoneNumber2,
        address2: address2 ?? this.address2,
        cityName: cityName ?? this.cityName,
        cityCode: cityCode ?? this.cityCode,
        cellPhone: cellPhone ?? this.cellPhone,
        faxNumber: faxNumber ?? this.faxNumber,
        branchNameOfParentAgency: branchNameOfParentAgency ?? this.branchNameOfParentAgency,
        branchIdOfParentAgency: branchIdOfParentAgency ?? this.branchIdOfParentAgency,
        note: note ?? this.note,
        passwd: passwd ?? this.passwd,
        confirmPasswd: confirmPasswd ?? this.confirmPasswd,
        avatar: avatar ?? this.avatar,
        avatarContentType: avatarContentType ?? this.avatarContentType,
        balance: balance ?? this.balance,
        credit: credit ?? this.credit,
        cash: cash ?? this.cash,
        purchasingPower: purchasingPower ?? this.purchasingPower,
        liability: liability ?? this.liability,
        accountId: accountId ?? this.accountId,
        revenue: revenue ?? this.revenue,
        revenueNoBalance: revenueNoBalance ?? this.revenueNoBalance,
        createdDate: createdDate ?? this.createdDate,
        verify: verify ?? this.verify,
        notify: notify ?? this.notify,
        agencyClass: agencyClass ?? this.agencyClass,
        linkedAccounts: linkedAccounts ?? this.linkedAccounts,
        fromRedis: fromRedis ?? this.fromRedis,
        extendInfo: extendInfo ?? this.extendInfo,
        integrationInfo: integrationInfo ?? this.integrationInfo,
        inviteCode: inviteCode ?? this.inviteCode,
        otpServiceReq: otpServiceReq ?? this.otpServiceReq,
        otpServiceRes: otpServiceRes ?? this.otpServiceRes,
      );

  factory AgencyFullProfile.fromJson(Map<String, dynamic> json) => AgencyFullProfile(
        email: json["email"],
        status: json["status"],
        fullName: json["fullName"],
        chkEditable: json["chkEditable"],
        sentMail: json["sentMail"],
        rootAgency: json["rootAgency"],
        loginId: json["loginId"],
        phoneNumber1: json["phoneNumber1"],
        agentAdminUsername: json["agentAdminUsername"],
        address1: json["address1"],
        phoneContact2: json["phoneContact2"],
        representativePhone: json["representativePhone"],
        contactPerson2: json["contactPerson2"],
        countryName: json["countryName"],
        phoneContact1: json["phoneContact1"],
        agencyCode: json["agencyCode"],
        currentAgency: json["currentAgency"],
        stateName: json["stateName"],
        commission: json["commission"],
        agencyNumber: json["agencyNumber"],
        contactPerson1: json["contactPerson1"],
        representativeName: json["representativeName"],
        representativeFirstName: json["representativeFirstName"],
        activeNow: json["activeNow"],
        agentAdminId: json["agentAdminId"],
        orgCode: json["orgCode"],
        agentProfiles: json["agentProfiles"] == null
            ? []
            : List<AgentProfile>.from(json["agentProfiles"]!.map((x) => AgentProfile.fromJson(x))),
        representativeLastName: json["representativeLastName"],
        id: json["id"],
        cooperationClass: json["cooperationClass"],
        shortName: json["shortName"],
        stateCode: json["stateCode"],
        representativeMail: json["representativeMail"],
        subMail: json["subMail"],
        agencyCaCodes: json["agencyCACodes"] == null
            ? []
            : List<AgencyCaCode>.from(json["agencyCACodes"]!.map((x) => AgencyCaCode.fromJson(x))),
        countryCode: json["countryCode"],
        taxCode: json["taxCode"],
        phoneNumber2: json["phoneNumber2"],
        address2: json["address2"],
        cityName: json["cityName"],
        cityCode: json["cityCode"],
        cellPhone: json["cellPhone"],
        faxNumber: json["faxNumber"],
        branchNameOfParentAgency: json["branchNameOfParentAgency"],
        branchIdOfParentAgency: json["branchIdOfParentAgency"],
        note: json["note"],
        passwd: json["passwd"],
        confirmPasswd: json["confirmPasswd"],
        avatar: json["avatar"],
        avatarContentType: json["avatarContentType"],
        balance: json["balance"],
        credit: json["credit"],
        cash: json["cash"],
        purchasingPower: json["purchasingPower"],
        liability: json["liability"],
        accountId: json["accountId"],
        revenue: json["revenue"],
        revenueNoBalance: json["revenueNoBalance"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        verify: json["verify"],
        notify: json["notify"],
        agencyClass: json["agencyClass"],
        linkedAccounts: json["linkedAccounts"] == null ? [] : List<dynamic>.from(json["linkedAccounts"]!.map((x) => x)),
        fromRedis: json["fromRedis"],
        extendInfo: json["extendInfo"],
        integrationInfo: json["integrationInfo"],
        inviteCode: json["inviteCode"],
        otpServiceReq: json["otpServiceReq"] == null ? null : OtpServiceReq.fromJson(json["otpServiceReq"]),
        otpServiceRes: json["otpServiceRes"] == null ? null : OtpServiceRes.fromJson(json["otpServiceRes"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "status": status,
        "fullName": fullName,
        "chkEditable": chkEditable,
        "sentMail": sentMail,
        "rootAgency": rootAgency,
        "loginId": loginId,
        "phoneNumber1": phoneNumber1,
        "agentAdminUsername": agentAdminUsername,
        "address1": address1,
        "phoneContact2": phoneContact2,
        "representativePhone": representativePhone,
        "contactPerson2": contactPerson2,
        "countryName": countryName,
        "phoneContact1": phoneContact1,
        "agencyCode": agencyCode,
        "currentAgency": currentAgency,
        "stateName": stateName,
        "commission": commission,
        "agencyNumber": agencyNumber,
        "contactPerson1": contactPerson1,
        "representativeName": representativeName,
        "representativeFirstName": representativeFirstName,
        "activeNow": activeNow,
        "agentAdminId": agentAdminId,
        "orgCode": orgCode,
        "agentProfiles": agentProfiles == null ? [] : List<dynamic>.from(agentProfiles!.map((x) => x.toJson())),
        "representativeLastName": representativeLastName,
        "id": id,
        "cooperationClass": cooperationClass,
        "shortName": shortName,
        "stateCode": stateCode,
        "representativeMail": representativeMail,
        "subMail": subMail,
        "agencyCACodes": agencyCaCodes == null ? [] : List<dynamic>.from(agencyCaCodes!.map((x) => x)),
        "countryCode": countryCode,
        "taxCode": taxCode,
        "phoneNumber2": phoneNumber2,
        "address2": address2,
        "cityName": cityName,
        "cityCode": cityCode,
        "cellPhone": cellPhone,
        "faxNumber": faxNumber,
        "branchNameOfParentAgency": branchNameOfParentAgency,
        "branchIdOfParentAgency": branchIdOfParentAgency,
        "note": note,
        "passwd": passwd,
        "confirmPasswd": confirmPasswd,
        "avatar": avatar,
        "avatarContentType": avatarContentType,
        "balance": balance,
        "credit": credit,
        "cash": cash,
        "purchasingPower": purchasingPower,
        "liability": liability,
        "accountId": accountId,
        "revenue": revenue,
        "revenueNoBalance": revenueNoBalance,
        "createdDate": createdDate?.toIso8601String(),
        "verify": verify,
        "notify": notify,
        "agencyClass": agencyClass,
        "linkedAccounts": linkedAccounts == null ? [] : List<dynamic>.from(linkedAccounts!.map((x) => x)),
        "fromRedis": fromRedis,
        "extendInfo": extendInfo,
        "integrationInfo": integrationInfo,
        "inviteCode": inviteCode,
        "otpServiceReq": otpServiceReq?.toJson(),
        "otpServiceRes": otpServiceRes?.toJson(),
      };
}

class AgentProfile {
  String? createdBy;
  String? agentName;
  String? loginUsername;
  dynamic createdDate;
  String? agentCode;
  String? status;
  dynamic updatedDate;
  int? loginId;
  String? agencyCode;
  String? email;
  String? mobile;
  int? id;
  bool? defaultAgent;
  int? agencyId;
  String? updatedBy;
  String? displayRoles;
  String? phoneNumber;
  String? orgCode;
  List<String>? agencyCaCodes;
  String? agencyName;
  String? branchCode;
  String? branchId;
  String? branchName;
  String? defaultAgencyCode;
  String? displayProductVisibilities;
  String? displaySupplierVisibilities;
  String? dob;
  String? extNumber;
  dynamic extendInfo;
  String? avatar;
  String? avatarContentType;
  dynamic avatarId;
  String? gender;
  String? inviteCode;
  bool? notify;
  bool? verify;

  AgentProfile({
    this.createdBy,
    this.agentName,
    this.loginUsername,
    this.createdDate,
    this.agentCode,
    this.status,
    this.updatedDate,
    this.loginId,
    this.agencyCode,
    this.email,
    this.mobile,
    this.id,
    this.defaultAgent,
    this.agencyId,
    this.updatedBy,
    this.displayRoles,
    this.phoneNumber,
    this.orgCode,
    this.agencyCaCodes,
    this.agencyName,
    this.branchCode,
    this.branchId,
    this.branchName,
    this.defaultAgencyCode,
    this.displayProductVisibilities,
    this.displaySupplierVisibilities,
    this.dob,
    this.extNumber,
    this.extendInfo,
    this.avatar,
    this.avatarContentType,
    this.avatarId,
    this.gender,
    this.inviteCode,
    this.notify,
    this.verify,
  });

  AgentProfile copyWith({
    String? createdBy,
    String? agentName,
    String? loginUsername,
    dynamic createdDate,
    String? agentCode,
    String? status,
    dynamic updatedDate,
    int? loginId,
    String? agencyCode,
    String? email,
    String? mobile,
    int? id,
    bool? defaultAgent,
    int? agencyId,
    String? updatedBy,
    String? displayRoles,
    String? phoneNumber,
    String? orgCode,
    List<String>? agencyCaCodes,
    String? agencyName,
    String? branchCode,
    String? branchId,
    String? branchName,
    String? defaultAgencyCode,
    String? displayProductVisibilities,
    String? displaySupplierVisibilities,
    String? dob,
    String? extNumber,
    dynamic extendInfo,
    String? avatar,
    String? avatarContentType,
    dynamic avatarId,
    String? gender,
    String? inviteCode,
    bool? notify,
    bool? verify,
  }) =>
      AgentProfile(
        createdBy: createdBy ?? this.createdBy,
        agentName: agentName ?? this.agentName,
        loginUsername: loginUsername ?? this.loginUsername,
        createdDate: createdDate ?? this.createdDate,
        agentCode: agentCode ?? this.agentCode,
        status: status ?? this.status,
        updatedDate: updatedDate ?? this.updatedDate,
        loginId: loginId ?? this.loginId,
        agencyCode: agencyCode ?? this.agencyCode,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        id: id ?? this.id,
        defaultAgent: defaultAgent ?? this.defaultAgent,
        agencyId: agencyId ?? this.agencyId,
        updatedBy: updatedBy ?? this.updatedBy,
        displayRoles: displayRoles ?? this.displayRoles,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        orgCode: orgCode ?? this.orgCode,
        agencyCaCodes: agencyCaCodes ?? this.agencyCaCodes,
        agencyName: agencyName ?? this.agencyName,
        branchCode: branchCode ?? this.branchCode,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        defaultAgencyCode: defaultAgencyCode ?? this.defaultAgencyCode,
        displayProductVisibilities: displayProductVisibilities ?? this.displayProductVisibilities,
        displaySupplierVisibilities: displaySupplierVisibilities ?? this.displaySupplierVisibilities,
        dob: dob ?? this.dob,
        extNumber: extNumber ?? this.extNumber,
        extendInfo: extendInfo ?? this.extendInfo,
        avatar: avatar ?? this.avatar,
        avatarContentType: avatarContentType ?? this.avatarContentType,
        avatarId: avatarId ?? this.avatarId,
        gender: gender ?? this.gender,
        inviteCode: inviteCode ?? this.inviteCode,
        notify: notify ?? this.notify,
        verify: verify ?? this.verify,
      );

  factory AgentProfile.fromJson(Map<String, dynamic> json) => AgentProfile(
        createdBy: json["createdBy"],
        agentName: json["agentName"],
        loginUsername: json["loginUsername"],
        createdDate: json["createdDate"],
        agentCode: json["agentCode"],
        status: json["status"],
        updatedDate: json["updatedDate"],
        loginId: json["loginId"],
        agencyCode: json["agencyCode"],
        email: json["email"],
        mobile: json["mobile"],
        id: json["id"],
        defaultAgent: json["defaultAgent"],
        agencyId: json["agencyId"],
        updatedBy: json["updatedBy"],
        displayRoles: json["displayRoles"],
        phoneNumber: json["phoneNumber"],
        orgCode: json["orgCode"],
        agencyCaCodes: json["agencyCACodes"] == null ? [] : List<String>.from(json["agencyCACodes"]!.map((x) => x)),
        agencyName: json["agencyName"],
        branchCode: json["branchCode"],
        branchId: json["branchId"],
        branchName: json["branchName"],
        defaultAgencyCode: json["defaultAgencyCode"],
        displayProductVisibilities: json["displayProductVisibilities"],
        displaySupplierVisibilities: json["displaySupplierVisibilities"],
        dob: json["dob"],
        extNumber: json["extNumber"],
        extendInfo: json["extendInfo"],
        avatar: json["avatar"],
        avatarContentType: json["avatarContentType"],
        avatarId: json["avatarId"],
        gender: json["gender"],
        inviteCode: json["inviteCode"],
        notify: json["notify"],
        verify: json["verify"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "agentName": agentName,
        "loginUsername": loginUsername,
        "createdDate": createdDate,
        "agentCode": agentCode,
        "status": status,
        "updatedDate": updatedDate,
        "loginId": loginId,
        "agencyCode": agencyCode,
        "email": email,
        "mobile": mobile,
        "id": id,
        "defaultAgent": defaultAgent,
        "agencyId": agencyId,
        "updatedBy": updatedBy,
        "displayRoles": displayRoles,
        "phoneNumber": phoneNumber,
        "orgCode": orgCode,
        "agencyCACodes": agencyCaCodes == null ? [] : List<dynamic>.from(agencyCaCodes!.map((x) => x)),
        "agencyName": agencyName,
        "branchCode": branchCode,
        "branchId": branchId,
        "branchName": branchName,
        "defaultAgencyCode": defaultAgencyCode,
        "displayProductVisibilities": displayProductVisibilities,
        "displaySupplierVisibilities": displaySupplierVisibilities,
        "dob": dob,
        "extNumber": extNumber,
        "extendInfo": extendInfo,
        "avatar": avatar,
        "avatarContentType": avatarContentType,
        "avatarId": avatarId,
        "gender": gender,
        "inviteCode": inviteCode,
        "notify": notify,
        "verify": verify,
      };
}

class AgencyShortProfile {
  int? id;
  int? loginId;
  dynamic avatarId;
  String? agentName;
  String? agencyName;
  String? email;
  dynamic avatar;
  dynamic avatarContentType;
  String? displayRoles;
  String? displaySupplierVisibilities;
  String? displayProductVisibilities;
  List<String>? supplierVisibilities;
  List<String>? productVisibilities;
  String? branchName;
  String? mobile;
  double? balance;
  double? credit;
  String? loginUsername;
  String? status;
  int? agencyId;
  String? fullName;
  String? address1;
  dynamic address2;
  String? countryCode;
  String? countryName;
  String? stateCode;
  String? stateName;
  dynamic cityCode;
  dynamic cityName;
  String? phoneNumber1;
  String? phoneNumber2;
  String? cellPhone;
  String? faxNumber;
  String? note;
  String? customerCareEmail;
  bool? adminAgency;
  List<AgencyCaCode>? agencyCaCodes;

  AgencyShortProfile({
    this.id,
    this.loginId,
    this.avatarId,
    this.agentName,
    this.agencyName,
    this.email,
    this.avatar,
    this.avatarContentType,
    this.displayRoles,
    this.displaySupplierVisibilities,
    this.displayProductVisibilities,
    this.supplierVisibilities,
    this.productVisibilities,
    this.branchName,
    this.mobile,
    this.balance,
    this.credit,
    this.loginUsername,
    this.status,
    this.agencyId,
    this.fullName,
    this.address1,
    this.address2,
    this.countryCode,
    this.countryName,
    this.stateCode,
    this.stateName,
    this.cityCode,
    this.cityName,
    this.phoneNumber1,
    this.phoneNumber2,
    this.cellPhone,
    this.faxNumber,
    this.note,
    this.customerCareEmail,
    this.adminAgency,
    this.agencyCaCodes,
  });

  AgencyShortProfile copyWith({
    int? id,
    int? loginId,
    dynamic avatarId,
    String? agentName,
    String? agencyName,
    String? email,
    dynamic avatar,
    dynamic avatarContentType,
    String? displayRoles,
    String? displaySupplierVisibilities,
    String? displayProductVisibilities,
    List<String>? supplierVisibilities,
    List<String>? productVisibilities,
    String? branchName,
    String? mobile,
    double? balance,
    double? credit,
    String? loginUsername,
    String? status,
    int? agencyId,
    String? fullName,
    String? address1,
    dynamic address2,
    String? countryCode,
    String? countryName,
    String? stateCode,
    String? stateName,
    dynamic cityCode,
    dynamic cityName,
    String? phoneNumber1,
    String? phoneNumber2,
    String? cellPhone,
    String? faxNumber,
    String? note,
    String? customerCareEmail,
    bool? adminAgency,
    List<AgencyCaCode>? agencyCaCodes,
  }) =>
      AgencyShortProfile(
        id: id ?? this.id,
        loginId: loginId ?? this.loginId,
        avatarId: avatarId ?? this.avatarId,
        agentName: agentName ?? this.agentName,
        agencyName: agencyName ?? this.agencyName,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        avatarContentType: avatarContentType ?? this.avatarContentType,
        displayRoles: displayRoles ?? this.displayRoles,
        displaySupplierVisibilities: displaySupplierVisibilities ?? this.displaySupplierVisibilities,
        displayProductVisibilities: displayProductVisibilities ?? this.displayProductVisibilities,
        supplierVisibilities: supplierVisibilities ?? this.supplierVisibilities,
        productVisibilities: productVisibilities ?? this.productVisibilities,
        branchName: branchName ?? this.branchName,
        mobile: mobile ?? this.mobile,
        balance: balance ?? this.balance,
        credit: credit ?? this.credit,
        loginUsername: loginUsername ?? this.loginUsername,
        status: status ?? this.status,
        agencyId: agencyId ?? this.agencyId,
        fullName: fullName ?? this.fullName,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        countryCode: countryCode ?? this.countryCode,
        countryName: countryName ?? this.countryName,
        stateCode: stateCode ?? this.stateCode,
        stateName: stateName ?? this.stateName,
        cityCode: cityCode ?? this.cityCode,
        cityName: cityName ?? this.cityName,
        phoneNumber1: phoneNumber1 ?? this.phoneNumber1,
        phoneNumber2: phoneNumber2 ?? this.phoneNumber2,
        cellPhone: cellPhone ?? this.cellPhone,
        faxNumber: faxNumber ?? this.faxNumber,
        note: note ?? this.note,
        customerCareEmail: customerCareEmail ?? this.customerCareEmail,
        adminAgency: adminAgency ?? this.adminAgency,
        agencyCaCodes: agencyCaCodes ?? this.agencyCaCodes,
      );

  factory AgencyShortProfile.fromJson(Map<String, dynamic> json) => AgencyShortProfile(
        id: json["id"],
        loginId: json["loginId"],
        avatarId: json["avatarId"],
        agentName: json["agentName"],
        agencyName: json["agencyName"],
        email: json["email"],
        avatar: json["avatar"],
        avatarContentType: json["avatarContentType"],
        displayRoles: json["displayRoles"],
        displaySupplierVisibilities: json["displaySupplierVisibilities"],
        displayProductVisibilities: json["displayProductVisibilities"],
        supplierVisibilities:
            json["supplierVisibilities"] == null ? [] : List<String>.from(json["supplierVisibilities"]!.map((x) => x)),
        productVisibilities:
            json["productVisibilities"] == null ? [] : List<String>.from(json["productVisibilities"]!.map((x) => x)),
        branchName: json["branchName"],
        mobile: json["mobile"],
        balance: json["balance"],
        credit: json["credit"],
        loginUsername: json["loginUsername"],
        status: json["status"],
        agencyId: json["agencyId"],
        fullName: json["fullName"],
        address1: json["address1"],
        address2: json["address2"],
        countryCode: json["countryCode"],
        countryName: json["countryName"],
        stateCode: json["stateCode"],
        stateName: json["stateName"],
        cityCode: json["cityCode"],
        cityName: json["cityName"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        cellPhone: json["cellPhone"],
        faxNumber: json["faxNumber"],
        note: json["note"],
        customerCareEmail: json["customerCareEmail"],
        adminAgency: json["adminAgency"],
        agencyCaCodes: json["agencyCACodes"] == null
            ? []
            : List<AgencyCaCode>.from(json["agencyCACodes"]!.map((x) => AgencyCaCode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "loginId": loginId,
        "avatarId": avatarId,
        "agentName": agentName,
        "agencyName": agencyName,
        "email": email,
        "avatar": avatar,
        "avatarContentType": avatarContentType,
        "displayRoles": displayRoles,
        "displaySupplierVisibilities": displaySupplierVisibilities,
        "displayProductVisibilities": displayProductVisibilities,
        "supplierVisibilities":
            supplierVisibilities == null ? [] : List<dynamic>.from(supplierVisibilities!.map((x) => x)),
        "productVisibilities":
            productVisibilities == null ? [] : List<dynamic>.from(productVisibilities!.map((x) => x)),
        "branchName": branchName,
        "mobile": mobile,
        "balance": balance,
        "credit": credit,
        "loginUsername": loginUsername,
        "status": status,
        "agencyId": agencyId,
        "fullName": fullName,
        "address1": address1,
        "address2": address2,
        "countryCode": countryCode,
        "countryName": countryName,
        "stateCode": stateCode,
        "stateName": stateName,
        "cityCode": cityCode,
        "cityName": cityName,
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "cellPhone": cellPhone,
        "faxNumber": faxNumber,
        "note": note,
        "customerCareEmail": customerCareEmail,
        "adminAgency": adminAgency,
        "agencyCACodes": agencyCaCodes == null ? [] : List<dynamic>.from(agencyCaCodes!.map((x) => x)),
      };
}

class AgencyCaCode {
  String? agencyCode;
  String? agencyId;
  String? agentCaCode;
  String? agentCodeDomestic;
  String? agentCodeInternational;
  String? agentCompanyName;
  int? id;
  String? supplierName;

  AgencyCaCode({
    this.agencyCode,
    this.agencyId,
    this.agentCaCode,
    this.agentCodeDomestic,
    this.agentCodeInternational,
    this.agentCompanyName,
    this.id,
    this.supplierName,
  });

  factory AgencyCaCode.fromJson(Map<String, dynamic> json) => AgencyCaCode(
        agencyCode: json["agencyCode"],
        agencyId: json["agencyId"],
        agentCaCode: json["agentCACode"],
        agentCodeDomestic: json["agentCodeDomestic"],
        agentCodeInternational: json["agentCodeInternational"],
        agentCompanyName: json["agentCompanyName"],
        id: json["id"],
        supplierName: json["supplierName"],
      );

  Map<String, dynamic> toJson() => {
        "agencyCode": agencyCode,
        "agencyId": agencyId,
        "agentCACode": agentCaCode,
        "agentCodeDomestic": agentCodeDomestic,
        "agentCodeInternational": agentCodeInternational,
        "agentCompanyName": agentCompanyName,
        "id": id,
        "supplierName": supplierName,
      };
}

import 'package:intl/intl.dart';

class GtdFinancialRs {
  String? accountCode;
  int? accountId;
  String? agencyCode;
  String? agentCode;
  double? amount;
  double? balance;
  String? bookingNumber;
  String? bookingRefNumber;
  String? branchCode;
  String? createdBy;
  DateTime? createdDate;
  int? id;
  String? itineraryNo;
  String? reason;
  String? receiptNo;
  String? transCode;
  DateTime? transDate;
  String? transToken;
  String? transType;
  String? paymentType;
  String? accountName;
  double? lastBalance;
  String? lastTransCode;
  DateTime? lastTransDate;

  GtdFinancialRs({
    this.accountCode,
    this.accountId,
    this.agencyCode,
    this.agentCode,
    this.amount,
    this.balance,
    this.bookingNumber,
    this.bookingRefNumber,
    this.branchCode,
    this.createdBy,
    this.createdDate,
    this.id,
    this.itineraryNo,
    this.reason,
    this.receiptNo,
    this.transCode,
    this.transDate,
    this.transToken,
    this.transType,
    this.paymentType,
    this.accountName,
    this.lastBalance,
    this.lastTransCode,
    this.lastTransDate,
  });

  GtdFinancialRs copyWith({
    String? accountCode,
    int? accountId,
    String? agencyCode,
    String? agentCode,
    double? amount,
    double? balance,
    String? bookingNumber,
    String? bookingRefNumber,
    String? branchCode,
    String? createdBy,
    DateTime? createdDate,
    int? id,
    String? itineraryNo,
    String? reason,
    String? receiptNo,
    String? transCode,
    DateTime? transDate,
    String? transToken,
    String? transType,
    String? paymentType,
    String? accountName,
    double? lastBalance,
    String? lastTransCode,
    DateTime? lastTransDate,
  }) =>
      GtdFinancialRs(
        accountCode: accountCode ?? this.accountCode,
        accountId: accountId ?? this.accountId,
        agencyCode: agencyCode ?? this.agencyCode,
        agentCode: agentCode ?? this.agentCode,
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        bookingNumber: bookingNumber ?? this.bookingNumber,
        bookingRefNumber: bookingRefNumber ?? this.bookingRefNumber,
        branchCode: branchCode ?? this.branchCode,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        id: id ?? this.id,
        itineraryNo: itineraryNo ?? this.itineraryNo,
        reason: reason ?? this.reason,
        receiptNo: receiptNo ?? this.receiptNo,
        transCode: transCode ?? this.transCode,
        transDate: transDate ?? this.transDate,
        transToken: transToken ?? this.transToken,
        transType: transType ?? this.transType,
        paymentType: paymentType ?? this.paymentType,
        accountName: accountName ?? this.accountName,
        lastBalance: lastBalance ?? this.lastBalance,
        lastTransCode: lastTransCode ?? this.lastTransCode,
        lastTransDate: lastTransDate ?? this.lastTransDate,
      );

  factory GtdFinancialRs.fromJson(Map<String, dynamic> json) => GtdFinancialRs(
        accountCode: json["accountCode"],
        accountId: json["accountId"],
        agencyCode: json["agencyCode"],
        agentCode: json["agentCode"],
        amount: json["amount"],
        balance: json["balance"],
        bookingNumber: json["bookingNumber"],
        bookingRefNumber: json["bookingRefNumber"],
        branchCode: json["branchCode"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        id: json["id"],
        itineraryNo: json["itineraryNo"],
        reason: json["reason"],
        receiptNo: json["receiptNo"],
        transCode: json["transCode"],
        transDate: json["transDate"] == null ? null : DateTime.parse(json["transDate"]),
        transToken: json["transToken"],
        transType: json["transType"],
        paymentType: json["paymentType"],
        accountName: json["accountName"],
        lastBalance: json["lastBalance"],
        lastTransCode: json["lastTransCode"],
        lastTransDate: json["lastTransDate"] == null ? null : DateTime.parse(json["lastTransDate"]),
      );

  Map<String, dynamic> toJson() => {
        "accountCode": accountCode,
        "accountId": accountId,
        "agencyCode": agencyCode,
        "agentCode": agentCode,
        "amount": amount,
        "balance": balance,
        "bookingNumber": bookingNumber,
        "bookingRefNumber": bookingRefNumber,
        "branchCode": branchCode,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "id": id,
        "itineraryNo": itineraryNo,
        "reason": reason,
        "receiptNo": receiptNo,
        "transCode": transCode,
        "transDate": transDate?.toIso8601String(),
        "transToken": transToken,
        "transType": transType,
        "paymentType": paymentType,
        "accountName": accountName,
        "lastBalance": lastBalance,
        "lastTransCode": lastTransCode,
        "lastTransDate": lastTransDate?.toIso8601String(),
      };

  String monthYear() {
    final format = DateFormat('MM/yyyy');
    return format.format(createdDate!);
  }
}

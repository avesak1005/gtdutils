class GtdHeaderSummaryRs {
  double? balance;
  double? credit;
  double? purchasingPower;
  int? pendingBooking;
  int? allBooking;
  double? commission;
  double? revenue;
  int? comingDob;
  int? allCustomer;

  GtdHeaderSummaryRs({
    this.balance,
    this.credit,
    this.purchasingPower,
    this.pendingBooking,
    this.allBooking,
    this.commission,
    this.revenue,
    this.comingDob,
    this.allCustomer,
  });

  factory GtdHeaderSummaryRs.fromJson(Map<String, dynamic> json) => GtdHeaderSummaryRs(
        balance: json["balance"],
        credit: json["credit"],
        purchasingPower: json["purchasingPower"],
        pendingBooking: json["pendingBooking"],
        allBooking: json["allBooking"],
        commission: json["commission"],
        revenue: json["revenue"],
        comingDob: json["comingDob"],
        allCustomer: json["allCustomer"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "credit": credit,
        "purchasingPower": purchasingPower,
        "pendingBooking": pendingBooking,
        "allBooking": allBooking,
        "commission": commission,
        "revenue": revenue,
        "comingDob": comingDob,
        "allCustomer": allCustomer,
      };
}

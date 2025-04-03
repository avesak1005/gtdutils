import 'package:intl/intl.dart';

class GtdFinancialSumaryRs {
  List<GtdAgentTransactionSum>? agentTransactionSum;
  dynamic totalSum;

  GtdFinancialSumaryRs({
    this.agentTransactionSum,
    this.totalSum,
  });

  GtdFinancialSumaryRs copyWith({
    List<GtdAgentTransactionSum>? agentTransSumResList,
    dynamic totalSum,
  }) =>
      GtdFinancialSumaryRs(
        agentTransactionSum: agentTransSumResList ?? agentTransactionSum,
        totalSum: totalSum ?? this.totalSum,
      );

  factory GtdFinancialSumaryRs.fromJson(Map<String, dynamic> json) => GtdFinancialSumaryRs(
        agentTransactionSum: json["agentTransSumResList"] == null
            ? []
            : List<GtdAgentTransactionSum>.from(
                json["agentTransSumResList"]!.map((x) => GtdAgentTransactionSum.fromJson(x))),
        totalSum: json["totalSum"],
      );

  Map<String, dynamic> toJson() => {
        "agentTransSumResList":
            agentTransactionSum == null ? [] : List<dynamic>.from(agentTransactionSum!.map((x) => x.toJson())),
        "totalSum": totalSum,
      };
}

class GtdAgentTransactionSum {
  int? transcount;
  double? outcome;
  DateTime? transmonth;
  double? income;

  GtdAgentTransactionSum({
    this.transcount,
    this.outcome,
    this.transmonth,
    this.income,
  });

  GtdAgentTransactionSum copyWith({
    int? transcount,
    double? outcome,
    DateTime? transmonth,
    double? income,
  }) =>
      GtdAgentTransactionSum(
        transcount: transcount ?? this.transcount,
        outcome: outcome ?? this.outcome,
        transmonth: transmonth ?? this.transmonth,
        income: income ?? this.income,
      );

  factory GtdAgentTransactionSum.fromJson(Map<String, dynamic> json) => GtdAgentTransactionSum(
        transcount: json["transcount"],
        outcome: json["outcome"],
        transmonth: json["transmonth"] == null ? null : DateTime.parse(json["transmonth"]),
        income: json["income"],
      );

  Map<String, dynamic> toJson() => {
        "transcount": transcount,
        "outcome": outcome,
        "transmonth": transmonth?.toIso8601String(),
        "income": income,
      };

  String monthYear() {
    final format = DateFormat('MM/yyyy');
    return format.format(transmonth!);
  }
}

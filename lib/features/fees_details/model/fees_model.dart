import 'dart:convert';

List<FeeModel> feeModelFromJson(String str) => 
    List<FeeModel>.from(json.decode(str).map((x) => FeeModel.fromJson(x)));

String feeModelToJson(List<FeeModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeeModel {
  String month;
  double totalFee;
  double extraFee;
  double lateCharges;
  double discount;
  bool isPaid;
  String paymentDate;
  bool isExpanded;

  FeeModel({
    required this.month,
    required this.totalFee,
    required this.extraFee,
    required this.lateCharges,
    required this.discount,
    required this.isPaid,
    required this.paymentDate,
    this.isExpanded = false,
  });

  double get paidFee => totalFee + extraFee + lateCharges - discount;

  factory FeeModel.fromJson(Map<String, dynamic> json) => FeeModel(
    month: json["month"],
    totalFee: json["totalFee"].toDouble(),
    extraFee: json["extraFee"].toDouble(),
    lateCharges: json["lateCharges"].toDouble(),
    discount: json["discount"].toDouble(),
    isPaid: json["isPaid"],
    paymentDate: json["paymentDate"],
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "totalFee": totalFee,
    "extraFee": extraFee,
    "lateCharges": lateCharges,
    "discount": discount,
    "isPaid": isPaid,
    "paymentDate": paymentDate,
    "isExpanded": isExpanded,
  };
} 
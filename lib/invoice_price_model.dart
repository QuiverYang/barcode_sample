import 'package:json_annotation/json_annotation.dart';
part 'invoice_price_model.g.dart';

@JsonSerializable()
class InvoicePriceModel {
  InvoicePriceModel();
  factory InvoicePriceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoicePriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoicePriceModelToJson(this);
  String v;
  String code;
  String msg;
  String invoYm;
  String superPrizeNo;
  String spcPrizeNo;
  String spcPrizeNo2;
  String spcPrizeNo3;
  String firstPrizeNo1;
  String firstPrizeNo2;
  String firstPrizeNo3;
  String firstPrizeNo4;
  String firstPrizeNo5;
  String firstPrizeNo6;
  String firstPrizeNo7;
  String firstPrizeNo8;
  String firstPrizeNo9;
  String firstPrizeNo10;
  String sixthPrizeNo1;
  String sixthPrizeNo2;
  String sixthPrizeNo3;
  String superPrizeAmt;
  String spcPrizeAmt;
  String firstPrizeAmt;
  String secondPrizeAmt;
  String thirdPrizeAmt;
  String fourthPrizeAmt;
  String fifthPrizeAmt;
  String sixthPrizeAmt;

  Future<void> loadData() {}
}

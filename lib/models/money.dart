// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_new

class Money {
  String? message;
  String? moneyDetail;
  String? moneyDate;
  double? moneyInOut;
  int? moneyType;

  Money(
      {this.message,
      this.moneyDetail,
      this.moneyDate,
      this.moneyInOut,
      this.moneyType});

  Money.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    moneyDetail = json['moneyDetail'];
    moneyDate = json['moneyDate'];
    moneyInOut = json['moneyInOut'];
    moneyType = json['moneyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['moneyDetail'] = this.moneyDetail;
    data['moneyDate'] = this.moneyDate;
    data['moneyInOut'] = this.moneyInOut;
    data['moneyType'] = this.moneyType;
    return data;
  }
}

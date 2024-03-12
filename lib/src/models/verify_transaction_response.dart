import 'dart:convert';

class VerifyTransactionResponse {
  VerifyTransactionResponse({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  final int? status;
  final bool? success;
  final String? message;
  final Data? data;
  factory VerifyTransactionResponse.fromJson(String str) => VerifyTransactionResponse.fromMap(json.decode(str));

  factory VerifyTransactionResponse.fromMap(Map<String, dynamic> json){
    return VerifyTransactionResponse(
      status: json["status"],
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.transactionAmount,
    required this.transactionRef,
    required this.email,
    required this.transactionStatus,
    required this.transactionCurrencyId,
    required this.createdAt,
    required this.transactionType,
    required this.merchantName,
    required this.merchantBusinessName,
    required this.gatewayTransactionRef,
    required this.merchantEmail,
    required this.meta,
    required this.cardType,
    required this.fee,
    required this.merchantAmount,
  });

  final int? transactionAmount;
  final String? transactionRef;
  final String? email;
  final String? transactionStatus;
  final String? transactionCurrencyId;
  final DateTime? createdAt;
  final String? transactionType;
  final String? merchantName;
  final String? merchantBusinessName;
  final String? gatewayTransactionRef;
  final String? merchantEmail;
  final Meta? meta;
  final String? cardType;
  final double? fee;
  final int? merchantAmount;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      transactionAmount: json["transaction_amount"],
      transactionRef: json["transaction_ref"],
      email: json["email"],
      transactionStatus: json["transaction_status"],
      transactionCurrencyId: json["transaction_currency_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      transactionType: json["transaction_type"],
      merchantName: json["merchant_name"],
      merchantBusinessName: json["merchant_business_name"],
      gatewayTransactionRef: json["gateway_transaction_ref"],
      merchantEmail: json["merchant_email"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      cardType: json["card_type"],
      fee:json["fee"]==null?0.0: double.parse(json["fee"].toString()),
      merchantAmount: json["merchant_amount"],
    );
  }

  Map<String, dynamic> toJson() => {
    "transaction_amount": transactionAmount,
    "transaction_ref": transactionRef,
    "email": email,
    "transaction_status": transactionStatus,
    "transaction_currency_id": transactionCurrencyId,
    "created_at": createdAt?.toIso8601String(),
    "transaction_type": transactionType,
    "merchant_name": merchantName,
    "merchant_business_name": merchantBusinessName,
    "gateway_transaction_ref": gatewayTransactionRef,
    "merchant_email": merchantEmail,
    "meta": meta?.toJson(),
    "card_type": cardType,
    "fee": fee,
    "merchant_amount": merchantAmount,
  };

}

class Meta {
  Meta({required this.json});
  final Map<String,dynamic> json;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

}

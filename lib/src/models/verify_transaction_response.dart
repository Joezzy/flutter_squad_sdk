import 'dart:convert';

class VerifyTransactionResponse {
  VerifyTransactionResponse({
     this.status,
     this.success,
     this.message,
     this.data,
  });

  final int? status;
  final bool? success;
  final String? message;
  final TransactionData? data;
  factory VerifyTransactionResponse.fromJson(String str) => VerifyTransactionResponse.fromMap(json.decode(str));

  factory VerifyTransactionResponse.fromMap(Map<String, dynamic> json){
    return VerifyTransactionResponse(
      status: json["status"],
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : TransactionData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };

}

class TransactionData {
  TransactionData({
     this.transactionAmount,
     this.transactionRef,
     this.email,
     this.transactionStatus,
     this.transactionCurrencyId,
     this.createdAt,
     this.transactionType,
     this.merchantName,
     this.merchantBusinessName,
     this.gatewayTransactionRef,
     this.merchantEmail,
     this.meta,
     this.cardType,
     this.fee,
     this.merchantAmount,
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
  final int? fee;
  final int? merchantAmount;

  factory TransactionData.fromJson(Map<String, dynamic> json){
    return TransactionData(
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
      fee: json["fee"],
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
  Meta({ required this.json});
  final Map<String,dynamic> json;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

}

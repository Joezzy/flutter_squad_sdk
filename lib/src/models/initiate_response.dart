import 'dart:convert';

class InitiateResponse {
  InitiateResponse({
     this.status,
     this.success,
     this.message,
     this.data,
  });

  final int? status;
  final bool? success;
  final String? message;
  final Data? data;

  factory InitiateResponse.fromJson(String str) => InitiateResponse.fromMap(json.decode(str));

  factory InitiateResponse.fromMap(Map<String, dynamic> json){
    return InitiateResponse(
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
     this.merchantInfo,
     this.currency,
     this.recurring,
     this.isRecurring,
     this.callbackUrl,
     this.transactionRef,
     this.transactionAmount,
     this.authorizedChannels,
     this.checkoutUrl,
     this.allowRecurring,
  });

  final MerchantInfo? merchantInfo;
  final String? currency;
  final Recurring? recurring;
  final bool? isRecurring;
  final String? callbackUrl;
  final String? transactionRef;
  final int? transactionAmount;
  final List<String>? authorizedChannels;
  final String? checkoutUrl;
  final bool? allowRecurring;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      merchantInfo: json["merchant_info"] == null ? null : MerchantInfo.fromJson(json["merchant_info"]),
      currency: json["currency"],
      recurring: json["recurring"] == null ? null : Recurring.fromJson(json["recurring"]),
      isRecurring: json["is_recurring"],
      callbackUrl: json["callback_url"],
      transactionRef: json["transaction_ref"],
      transactionAmount: json["transaction_amount"],
      authorizedChannels: json["authorized_channels"] == null ? [] : List<String>.from(json["authorized_channels"]!.map((x) => x)),
      checkoutUrl: json["checkout_url"],
      allowRecurring: json["allow_recurring"],
    );
  }

  Map<String, dynamic> toJson() => {
    "merchant_info": merchantInfo?.toJson(),
    "currency": currency,
    "recurring": recurring?.toJson(),
    "is_recurring": isRecurring,
    "callback_url": callbackUrl,
    "transaction_ref": transactionRef,
    "transaction_amount": transactionAmount,
    "authorized_channels": authorizedChannels!.map((x) => x).toList(),
    "checkout_url": checkoutUrl,
    "allow_recurring": allowRecurring,
  };

}

class MerchantInfo {
  MerchantInfo({
     this.merchantName,
     this.merchantId,
  });

  final String? merchantName;
  final String? merchantId;

  factory MerchantInfo.fromJson(Map<String, dynamic> json){
    return MerchantInfo(
      merchantName: json["merchant_name"],
      merchantId: json["merchant_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "merchant_name": merchantName,
    "merchant_id": merchantId,
  };

}

class Recurring {
  Recurring({
     this.type,
  });

  final int? type;

  factory Recurring.fromJson(Map<String, dynamic> json){
    return Recurring(
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
  };

}

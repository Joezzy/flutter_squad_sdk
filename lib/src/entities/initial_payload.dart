
class InitialPayload {
  int amount;
  String email;
  String currency;
  String initiateType;
  String transactionRef;
  String callbackUrl;
  String? customerName;
  bool passCharge;
  List<String> paymentChannels;
  // String? subMerchantId;
  // dynamic metaData;

  InitialPayload({
    required this.amount,
    required this.email,
    required this.currency,
    this.initiateType="inline",
    required this.transactionRef,
    required this.callbackUrl,
    this.customerName="paystack",
    this.passCharge=true,
    this.paymentChannels=const ['card','bank','transfer'],
    // this.subMerchantId= "",
    // this.metaData,
  });

  factory InitialPayload.fromJson(Map<String, dynamic> json) =>  InitialPayload(
    amount: json["amount"],
    email: json["email"],
    currency: json["currency"],
    initiateType: json["initiate_type"],
    transactionRef: json["transaction_ref"],
    callbackUrl: json["callback_url"],
    customerName: json["customer_name"],
    passCharge: json["pass_charge"],
    paymentChannels:  List<String>.from(json["payment_channels"].map((x) => x)),
    // subMerchantId: json["sub_merchant_id"],
    // metaData: json["meta_data"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "email": email,
    "currency": currency,
    "initiate_type": initiateType,
    "transaction_ref": transactionRef,
    "callback_url": callbackUrl,
    "customer_name": customerName,
    "pass_charge": passCharge,
    "payment_channels":  List<dynamic>.from(paymentChannels.map((x) => x)),
    // "sub_merchant_id": subMerchantId,
    // "meta_data": metaData,
  };
}






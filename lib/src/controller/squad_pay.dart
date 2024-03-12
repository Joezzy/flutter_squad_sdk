import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_squad_sdk/src/entities/initial_payload.dart';
import 'package:flutter_squad_sdk/src/models/transaction_response.dart';
import 'package:flutter_squad_sdk/src/services/api_services.dart';
import 'package:flutter_squad_sdk/src/views/payment_view.dart';

class SquadPay {
  static Future<String> initializeAndCheckout(
      BuildContext context,
      Environment environment,
      String secretKey,
      InitialPayload initialPayload) async {
    try {
      final apiService = ApiService();
      final initiateResponse = await apiService.initiatePayment(
          environment, secretKey, initialPayload);
      var response = "failed";
      if (context.mounted) {
        response = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentView(
                    checkoutUrl: initiateResponse.data?.checkoutUrl!,
                    callbackUrl: initiateResponse.data?.callbackUrl!)));
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<TransactionResponse> verifyTransaction(Environment environment,
      String secretKey, String transactionReference) async {
    try {
      final apiService = ApiService();
      final transaction = await apiService.verifyPayment(
          environment, secretKey, transactionReference);
      return transaction;
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> checkOut(
      BuildContext context, String checkoutUrl, String callbackUrl) async {
    try {
      var response = Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PaymentView(
                  checkoutUrl: checkoutUrl, callbackUrl: callbackUrl)));

      return response.toString();
    } catch (e) {
      rethrow;
    }
  }

  static String generateTransactionRef(int length) {
    const val =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => val.codeUnitAt(random.nextInt(val.length))));
  }
}

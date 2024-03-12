import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_squad_sdk/src/Models/initiate_response.dart';
import 'package:flutter_squad_sdk/src/Models/verify_transaction_response.dart';
import 'package:flutter_squad_sdk/src/entities/initial_payload.dart';

const connectionTimeout=50000;
const receiveTimeout=50000;
enum Environment{prod, test}

class ApiService{
    final sandboxInitiateUrl='https://sandbox-api-d.squadco.com/';
    final prodInitiateUrl='https://sandbox-api-d.squadco.com/';
    Dio dio=Dio();
   Future<InitiateResponse> initiatePayment(
       Environment environment,
       String secretKey,
       InitialPayload initialPayload
       )async{

     String url=environment==Environment.test? sandboxInitiateUrl:prodInitiateUrl;
    try {

       dio
      ..options.connectTimeout = const Duration(seconds: connectionTimeout)
      ..options.receiveTimeout = const Duration(seconds: connectionTimeout)
      ..options.responseType = ResponseType.json
      ..options.headers['Authorization'] ="Bearer $secretKey";
       final  response = await dio.post('${url}transaction/initiate',
        data:initialPayload.toJson()
      );
       final res = InitiateResponse.fromJson(json.encode(response.data));
      log(json.encode(response.data));
      return res;
    } catch (e) {
      rethrow;
    }
  }


    Future<VerifyTransactionResponse> verifyPayment(
        Environment environment,
        String secretKey,
        String transactionReference
        )async{

      String url=environment==Environment.test? sandboxInitiateUrl:prodInitiateUrl;
      try {

        dio
          ..options.connectTimeout = const Duration(seconds: connectionTimeout)
          ..options.receiveTimeout = const Duration(seconds: connectionTimeout)
          ..options.responseType = ResponseType.json
          ..options.headers['Authorization'] ="Bearer $secretKey";
        final  response = await dio.get('${url}transaction/verify/$transactionReference');
        final res = VerifyTransactionResponse.fromJson(json.encode(response.data));
        log(json.encode(response.data));
        return res;
      } catch (e) {
        rethrow;
      }
    }
}
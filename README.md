## Introduction
This is a Flutter package  that gives you the ability to integrate the
power of Squad Payment Gateway to your Android and iOS Applications. 
It is also suitable for developers using Firebase or Supabase for backend. 
You can initiate payment and also checkout right from your Flutter app.
iOS

<img width="445" alt="ios_1" src="https://github.com/Joezzy/flutter_squad_sdk/assets/48259356/f8c2042f-0f7d-425d-a175-24d0ba80004e">
<img width="433" alt="ios_2" src="https://github.com/Joezzy/flutter_squad_sdk/assets/48259356/d20f8e58-3cf6-4470-8793-c71035191a42">

Android
<img width="302" alt="Screenshot 2024-03-12 at 7 47 23 PM" src="https://github.com/Joezzy/flutter_squad_sdk/assets/48259356/da24933b-5ab0-405d-8e55-f55632e80ed6">
<img width="299" alt="Screenshot 2024-03-12 at 7 46 45 PM" src="https://github.com/Joezzy/flutter_squad_sdk/assets/48259356/67707f1b-976c-4c81-af50-89c5263a2631">



## Features

Initiate payment and checkout, If you do not want to generate from your back end server
Checkout only if you initiate payment from your backend server
Verify payment with transaction Reference

## Getting started

To get started make sure you have created an account on https://squadco.com/ . If you want a test account you can create an account on https://sandbox.squadco.com/login just for development

## Usage

To initiate a payment and also checkout you need to call the  initializeAndCheckout() function in SquadPay class.

```dart


//Initiate payment and checkout
    SquadPay.initializeAndCheckout(
    context, 
    Environment.test, 
    "<-Enter your Secret Key here->",     //your secret key ca be found on your squadco.com dashboard
    InitialPayload(
        amount: 55000,
        email: "nalz@gmail.com",
        currency: "NGN",
        initiateType: "inline",
        transactionRef: SquadPay.generateTransactionRef(16) , //Generate random transaction reference
        callbackUrl: "https://google.com",
        
    ));
```


To checkout after initializing payment from another source (i.e your backend server), call checkOut() function like so:

```dart
//Checkout only
    SquadPay.checkOut(
context,
    '<-Enter your checkout URL here->',
    '<-Enter your call-back URL here->'
    );    
```

To verify if a transaction is successful or not we use this code snippet below
```dart
//Verify transaction 
VerifyTransactionResponse transactionResponse = await  SquadPay.verifyTransaction(
    context, 
    Environment.test,
    "<-transaction reference here->",
    ));   
```





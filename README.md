
## Introduction
This is a Flutter package  that gives you the ability to integrate the
power of Squad Payment Gateway to your Android and iOS Applications. 
It is also suitable for developers using Firebase or Supabase for backend. 
You can initiate payment and also checkout right from your Flutter app.
iOS
![ios_1.png](..%2F..%2FDesktop%2Fios_1.png)![ios_2.png](..%2F..%2FDesktop%2Fios_2.png)
Android
![android_1.png](..%2F..%2FDesktop%2Fandroid_1.png)![android_2.png](..%2F..%2FDesktop%2Fandroid_2.png)


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





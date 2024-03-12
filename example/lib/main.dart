import 'package:flutter/material.dart';
import 'package:flutter_squad_sdk/flutter_squad_sdk.dart';
import 'package:dio/dio.dart'; //import dio

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Squad SDK Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Squad SDK Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initiatePaymentMethod() {

    SquadPay.initializeAndCheckout(
        context,
        Environment.test,
        "<-SECRET -KEY->",
        InitialPayload(
          amount: 55000,
          email: "nalz@gmail.com",
          currency: "NGN",
          initiateType: "inline",
          transactionRef: SquadPay.generateTransactionRef(16) ,
          callbackUrl: "https://google.com",
        ));
  }

  void checkOutMethod() async{
   String result = await SquadPay.checkOut(context,
        "https://checkout.paystack.com/25tw9jvmphdlbkt",
        "https://google.com"
    );

   print(result);

  }

  void verifyPayment() async{
   try{
     final transactionResponse = await SquadPay.verifyTransaction(
         Environment.test,
         "<-SECRET -KEY->",
         "yVJ2KXwvtc" // transaction Ref
     );
     print(transactionResponse.data!.transactionAmount);
     print(transactionResponse.data!.transactionRef);
   }
   on DioException catch (e) {
     print(  DioExceptions.fromDioError(e).toString());

   }



  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            FilledButton(onPressed: initiatePaymentMethod, child: const Text("Initialize payment")),
            FilledButton(onPressed: checkOutMethod, child: const Text("Checkout")),
            FilledButton(onPressed: verifyPayment, child: const Text("Verify transaction")),

          ],
        ),
      ),
    );
  }
}

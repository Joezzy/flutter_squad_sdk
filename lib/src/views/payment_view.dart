import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatefulWidget {
  final String? checkoutUrl;
  final String? callbackUrl;

  const PaymentView(
      {super.key, required this.checkoutUrl, required this.callbackUrl});

  @override
  PaymentViewState createState() => PaymentViewState();
}

class PaymentViewState extends State<PaymentView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('${widget.callbackUrl}')) {
              Navigator.pop(context, "success");
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl!));
    // ..loadRequest(Uri.parse('https://google.com'));
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: MyAppBar(title: "Fund wallet",),
        body: Stack(
      children: [
        WebViewWidget(controller: controller),
        // Positioned(
        //     top: 50,
        //     left: 15,
        //     child:
        //     GestureDetector(
        //       onTap: ()=>Navigator.pop(context),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(40)
        //         ),
        //         child: const Icon(Icons.chevron_left,size: 35,),),
        //     )),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:stripe_sample/services/stripe_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Stripe Payment Demo")),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                StripeService.instance.makePayment();
              },
              child: Text("Make payment"),
            )
          ],
        ),
      ),
    );
  }
}

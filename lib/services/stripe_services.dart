import 'package:dio/dio.dart';

import '../const.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();
  Future<void> makePayment() async {
    try {
      String? result = await _createPaymentIntent(10, "aed");
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculatedAmount(amount),
        "currecy": currency
      };
      var response = await dio.post("https://api.stripe.com/v1/payment_intents",
          data: data,
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            "Authorization": "Bearer$stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          }));
      if (response.data != null) {
        return response.data;
        print(response.data);
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  String _calculatedAmount(int amount) {
    final calulatedAmount = amount * 100;
    return calulatedAmount.toString();
  }
}

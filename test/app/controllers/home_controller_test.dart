import 'package:coin_converter/app/controllers/home_controller.dart';
import 'package:coin_converter/app/models/coin_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText, fromText);

  test('Must convert brazilian real to dollar', () {
    toText.text = '2.0';
    homeController.convert();
    fromText.text;
    expect(fromText.text, '0.42');
  });

  test('Must convert dolar to brazilian real', () {
    toText.text = '1.0';
    homeController.toCoin = CoinModel(
        name: 'Dólar', real: 4.7, dolar: 1.0, euro: 0.93, bitcoin: 0.000026);
    homeController.fromCoin = CoinModel(
        name: 'Real', real: 1.0, dolar: 0.21, euro: 0.2, bitcoin: 0.0000055);
    homeController.convert();
    expect(fromText.text, '4.70');
  });
}

import 'package:coin_converter/app/models/coin_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CoinModel> coins;
  late CoinModel toCoin;
  late CoinModel fromCoin;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController(this.toText, this.fromText) {
    coins = CoinModel.getCurrencies();
    toCoin = coins[0];
    fromCoin = coins[1];
  }

  convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', 'replace')) ?? 1.0;
    double returnValue = 0;

    if (fromCoin.name == 'Real') {
      returnValue = value * toCoin.real;
    } else if (fromCoin.name == 'Dólar') {
      returnValue = value * toCoin.dolar;
    } else if (fromCoin.name == 'Euro') {
      returnValue = value * toCoin.euro;
    } else if (fromCoin.name == 'Bitcoin') {
      returnValue = value * toCoin.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}

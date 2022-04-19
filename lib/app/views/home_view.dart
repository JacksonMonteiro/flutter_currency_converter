import 'package:coin_converter/app/components/coin_box.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 121, left: 24, right: 24),
          child: Column(children: [
            Image.asset('assets/dollar-coin.png', width: 200, height: 200),
            SizedBox(height: 16),
            CoinBox(
              selectedItem: homeController.toCoin,
              controller: homeController.toText,
              items: homeController.coins,
              onChanged: (model) {
                setState(() {
                  homeController.toCoin = model!;
                });
              },
            ),
            SizedBox(height: 16),
            CoinBox(
              selectedItem: homeController.fromCoin,
              controller: homeController.fromText,
              items: homeController.coins,
              onChanged: (model) {
                setState(() {
                  homeController.fromCoin = model!;
                });
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                homeController.convert();
              },
              child: Text(
                'Converter',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber)),
            ),
          ]),
        ),
      ),
    );
  }
}

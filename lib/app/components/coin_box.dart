import 'package:flutter/material.dart';

import '../models/coin_model.dart';

class CoinBox extends StatelessWidget {
  final List<CoinModel> items;
  final CoinModel selectedItem;
  final TextEditingController controller;
  final void Function(CoinModel? model) onChanged;

  CoinBox({
    Key? key,
    required this.selectedItem,
    required this.controller,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<CoinModel>(
                iconEnabledColor: Colors.amber,
                isExpanded: true,
                value: selectedItem,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: onChanged,
              ),
            )),
        SizedBox(width: 16),
        Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Text('Order'),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Order Id:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("12345678"),
                  Spacer(),
                  Text("Status:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Delivered"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}

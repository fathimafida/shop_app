import 'package:flutter/material.dart';
import 'package:shop_app/common/utils/helper.dart';
import 'package:shop_app/features/auth/views/auth_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              navigateTo(context, AuthScreen());
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/shop5.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          )
        ],
      ),
    ));
  }
}

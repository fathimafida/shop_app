import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Text('Profile'),
    ));
  }
}

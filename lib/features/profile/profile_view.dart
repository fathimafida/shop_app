import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/auth/cubit/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = (context.read<AuthCubit>().state as AuthSuccess).user;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 65,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Fathima fida"),
                Text("20mcs@gmail.com"),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ListTile(
            onTap: () {},
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    ));
  }
}

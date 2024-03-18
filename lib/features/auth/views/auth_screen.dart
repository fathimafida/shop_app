import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/common/utils/helper.dart';
import 'package:shop_app/features/auth/views/register_screen.dart';
import 'package:shop_app/features/main_screen/main_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController(text: "mor_2314");
    final _passwordController = TextEditingController(text: "83r5^_");
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "email",
                            labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            hintText: "password",
                            labelText: "Password"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot password?",
                                style: GoogleFonts.mooli(
                                  fontSize: 15,
                                ))),
                      ),
                      SizedBox(height: 30),
                      // BlocConsumer<AuthCubit, AuthState>(
                      //   listener: (context, state) {
                      //     if (state is AuthSuccess) {
                      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //           content: Text(
                      //         "Login success",
                      //       )));
                      //       navigateTo(context, MainScreen());
                      //     }
                      //     if (state is AuthError) {
                      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //           content: Text(
                      //         state.message,
                      //       )));
                      //     }
                      //   },
                      //   builder: (context, state) {
                      //     return
                      ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   context.read<AuthCubit>().loginUser(
                          //       email: _emailController.text,
                          //       password: _passwordController.text);
                          // }
                          if (_formKey.currentState!.validate()) {
                            navigateTo(context, MainScreen());
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.mooli(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: Size(double.infinity, 60)),
                      ),
                      //   },
                      // ),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            navigateTo(context, RegisterScreen());
                          },
                          child: Text("Don't have an accounts?Sign up",
                              style: GoogleFonts.mooli(
                                fontSize: 16,
                              ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

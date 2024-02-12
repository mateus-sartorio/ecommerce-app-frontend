import 'dart:convert';

import 'package:ecommerce_app/components/big_button_tile.dart';
import 'package:ecommerce_app/components/input_field.dart';
import 'package:ecommerce_app/pages/registration_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> register(BuildContext context) async {
    const String backendRoute = "http://10.0.2.2:8080/api/v1/auth/register";
    Uri uri = Uri.parse(backendRoute);

    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(_emailController.text)) {
      // TODO: treat invalid email here
      print("Invalid Password");
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      // TODO: treat different passwords here
      print("Passwords do not match");
    }

    Map data = {
      "username": _usernameController.text,
      "email": _emailController.text,
      "firstName": _firstnameController.text,
      "lastName": _lastnameController.text,
      "password": _passwordController.text
    };

    var body = json.encode(data);

    try {
      final Response _ = await http.post(uri,
          headers: {"Content-Type": "application/json"}, body: body);

      navigateToRegistrationConfirmationPage();
    } catch (e) {
      // TODO: treat any problema that may occur with the HTTP request
      print("deu bosta");
    }
  }

  void navigateToRegistrationConfirmationPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const RegistrationConfirmationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Register",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Text("Create your account"),
              InputField(controller: _usernameController, hintText: "Username"),
              InputField(
                  controller: _emailController, hintText: "Email address"),
              InputField(
                  controller: _firstnameController, hintText: "First name"),
              InputField(
                  controller: _lastnameController, hintText: "Last name"),
              InputField(controller: _passwordController, hintText: "Password"),
              InputField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm password"),
              const Text(
                  "By registering, you are agreeing to our Terms of use and Privacy Policy."),
              SizedBox(
                  width: double.infinity,
                  child: BigButtonTile(
                    isSolid: true,
                    text: "Register",
                    onPressed: () => register(context),
                  )),
              const Text("Already have an account? Login")
            ],
          ),
        ),
      ),
    );
  }
}

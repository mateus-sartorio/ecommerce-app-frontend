import 'dart:convert';
import 'package:ecommerce_app/components/big_button_tile.dart';
import 'package:ecommerce_app/components/input_field.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:ecommerce_app/store/global_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    const String backendRoute = "http://10.0.2.2:8080/api/v1/auth/login";
    Uri uri = Uri.parse(backendRoute);

    final RegExp _ = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    // if (!emailRegExp.hasMatch(_usernameController.text)) {
    //   // TODO: treat invalid email here
    //   print("Invalid Email");
    // }

    Map data = {
      "username": _usernameController.text,
      "password": _passwordController.text
    };

    var requestBody = json.encode(data);

    try {
      final Response response = await http.post(uri,
          headers: {"Content-Type": "application/json"}, body: requestBody);

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      String jwt = responseBody['jwt'];
      dynamic userResponse = responseBody['user'];

      User u = User(
          username: userResponse['username'],
          email: userResponse['email'],
          firstName: userResponse['firstName'],
          lastName: userResponse['lastName'],
          jwtToken: jwt);

      saveUser(u);
      navigateToHomePage();
    } catch (e) {
      // TODO: treat any problema that may occur with the HTTP request
      if (kDebugMode) {
        print("deu bosta");
      }
    }
  }

  void saveUser(User user) {
    Provider.of<GlobalState>(context, listen: false).setUser(user);
  }

  void navigateToHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
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
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Text("Login to your account"),
              InputField(controller: _usernameController, hintText: "Username"),
              InputField(controller: _passwordController, hintText: "Password"),
              SizedBox(
                  width: double.infinity,
                  child: BigButtonTile(
                    isSolid: true,
                    text: "Login",
                    onPressed: () => login(context),
                  )),
              const Text("Don't have an account yet? Register")
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/components/big_button_tile.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegistrationConfirmationPage extends StatelessWidget {
  const RegistrationConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text("You have successfully been registered."),
        SizedBox(
            width: double.infinity,
            child: BigButtonTile(
              isSolid: true,
              text: "Login",
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())),
            )),
      ]),
    );
  }
}

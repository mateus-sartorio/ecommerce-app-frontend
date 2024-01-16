import 'package:ecommerce_app/components/big_button_tile.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                "assets/images/nike-logo.png",
                height: 240,
              ),
            ),

            const SizedBox(height: 48),

            // title
            const Text(
              "Just Do It",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 24),

            // sub title
            Text(
              "Brand new sneakers and custom kicks made with premium quality",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 48),

            //start now button
            SizedBox(
                width: double.infinity,
                child: BigButtonTile(
                  isSolid: true,
                  text: "Login",
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage())),
                )),

            const SizedBox(height: 20),

            SizedBox(
                width: double.infinity,
                child: BigButtonTile(
                  isSolid: false,
                  text: "Register",
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage())),
                )),
          ]),
        ),
      ),
    );
  }
}

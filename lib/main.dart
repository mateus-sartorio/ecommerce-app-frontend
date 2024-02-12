import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:ecommerce_app/store/global_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MainState();
}

class _MainState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalState(
          user: User(
              username: "",
              email: "",
              firstName: "",
              lastName: "",
              jwtToken: ''),
          cart: Cart()),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: ThemeData.light(),
      ),
    );
  }
}

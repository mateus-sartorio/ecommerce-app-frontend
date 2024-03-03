import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:ecommerce_app/store/global_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
  void initState() {
    super.initState();
  }

  Future<void> fetchProducts() async {
    const String backendRoute = "http://10.0.2.2:8080/api/v1/product";
    Uri uri = Uri.parse(backendRoute);

    final Response response = await http.get(uri);

    if (kDebugMode) {
      print(response);
    }
  }

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
          products: List<Product>.empty()),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: ThemeData.light(),
      ),
    );
  }
}

import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  User user;
  final Cart cart;

  GlobalState({required this.user, required this.cart});

  void setUser(User user) {
    this.user = user;
  }
}

import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  User user;
  List<Product> products;

  GlobalState({required this.user, required this.products});

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void logoutUser() {
    user = User(
        username: "", email: "", firstName: "", lastName: "", jwtToken: "");
    notifyListeners();
  }

  // // add items to cart
  // void addItemToCart(Shoe shoe) {
  //   int? currentCount = cart.userCart[shoe];

  //   if (currentCount != null) {
  //     currentCount++;
  //   } else {
  //     currentCount = 1;
  //   }

  //   cart.userCart[shoe] = currentCount;

  //   notifyListeners();
  // }

  // void subtractItemAmmountFromCart(Shoe shoe) {
  //   int? currentCount = cart.userCart[shoe];

  //   if (currentCount != null) {
  //     if (currentCount > 1) {
  //       currentCount--;
  //     }
  //   } else {
  //     currentCount = 1;
  //   }

  //   cart.userCart[shoe] = currentCount;

  //   notifyListeners();
  // }

  // // remove items from cart
  // void removeItemFromCart(Shoe shoe) {
  //   cart.userCart.remove(shoe);
  //   notifyListeners();
  // }
}

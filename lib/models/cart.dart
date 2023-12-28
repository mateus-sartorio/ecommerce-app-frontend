import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "Black Shoe",
        price: "25",
        imagePath: "assets/images/black-shoe.png",
        description: "Black Shoe"),
    Shoe(
        name: "Blue Shoe",
        price: "25",
        imagePath: "assets/images/blue-shoe.png",
        description: "Blue Shoe"),
    Shoe(
        name: "Nike Shoe",
        price: "25",
        imagePath: "assets/images/nike-shoe.png",
        description: "Nike Shoe"),
    Shoe(
        name: "Red Shoe",
        price: "25",
        imagePath: "assets/images/red-shoe.png",
        description: "Red Shoe"),
    Shoe(
        name: "Running Shoe",
        price: "25",
        imagePath: "assets/images/running-shoe.png",
        description: "Running Shoe"),
    Shoe(
        name: "Social Shoe",
        price: "25",
        imagePath: "assets/images/social-shoe.png",
        description: "Social Shoe"),
    Shoe(
        name: "White Shoe",
        price: "25",
        imagePath: "assets/images/white-shoe.png",
        description: "White Shoe"),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get lists of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getShopList() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

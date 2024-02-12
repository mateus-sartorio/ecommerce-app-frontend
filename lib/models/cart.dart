import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "Black Shoe",
        price: "25",
        imagePath: "assets/images/black-shoe.png",
        description:
            "Elevate your style with our classic black shoe. Timelessly chic, comfortable, and versatile - the perfect choice for any occasion."),
    Shoe(
        name: "Blue Shoe",
        price: "25",
        imagePath: "assets/images/blue-shoe.png",
        description:
            "Add a pop of color to your step with our vibrant blue shoe. Stylish, comfortable, and perfect for any occasion."),
    Shoe(
        name: "Nike Shoe",
        price: "25",
        imagePath: "assets/images/nike-shoe.png",
        description:
            "Step into superior performance with our Nike shoe. Stylish design meets unbeatable comfort, making it your go-to choice for any activity. Just do it."),
    Shoe(
        name: "Red Shoe",
        price: "25",
        imagePath: "assets/images/red-shoe.png",
        description:
            "Make a bold statement with our red shoe. Stylish, comfortable, and ready for any occasion. Stand out with every step."),
    Shoe(
        name: "Running Shoe",
        price: "25",
        imagePath: "assets/images/running-shoe.png",
        description:
            "Gear up for your run with our dynamic running shoe. Lightweight, comfortable, and built for speed. Lace up and conquer your miles."),
    Shoe(
        name: "Social Shoe",
        price: "25",
        imagePath: "assets/images/social-shoe.png",
        description:
            "Step out with attitude in our sleek social shoe. Small in size, big in style—perfect for making a statement wherever you go."),
    Shoe(
        name: "White Shoe",
        price: "25",
        imagePath: "assets/images/white-shoe.png",
        description:
            "Step into crisp elegance with our white shoe. Clean, versatile, and effortlessly stylish, it's the perfect choice for a timeless look. From casual outings to special occasions, this white shoe complements any wardrobe with a touch of sophistication."),
  ];

  // list of items in user cart
  Map<Shoe, int> userCart = {};

  // get lists of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  Map<Shoe, int> getShopList() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    int? currentCount = userCart[shoe];

    if (currentCount != null) {
      currentCount++;
    } else {
      currentCount = 1;
    }

    userCart[shoe] = currentCount;

    notifyListeners();
  }

  void subtractItemAmmountFromCart(Shoe shoe) {
    int? currentCount = userCart[shoe];

    if (currentCount != null) {
      if (currentCount > 1) {
        currentCount--;
      }
    } else {
      currentCount = 1;
    }

    userCart[shoe] = currentCount;

    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0;

    for (Shoe key in userCart.keys) {
      double? keyPrice = double.parse(key.price);
      int? valueAmmount = userCart[key];

      if (valueAmmount != null) {
        total += keyPrice * valueAmmount;
      }
    }

    return total;
  }
}

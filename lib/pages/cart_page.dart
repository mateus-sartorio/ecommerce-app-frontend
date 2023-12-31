import 'package:ecommerce_app/components/big_button_tile.dart';
import 'package:ecommerce_app/components/cart_item_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // heading
                  const Row(children: [
                    Text(
                      "My Cart",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    SizedBox(
                      width: 1,
                    )
                  ]),

                  const SizedBox(
                    height: 10,
                  ),

                  Expanded(
                      child: ListView.builder(
                          itemCount: value.getShopList().length,
                          itemBuilder: ((context, index) {
                            // get individual shoe
                            Shoe shoe =
                                value.getShopList().keys.toList()[index];

                            int ammount =
                                value.getShopList().values.toList()[index];

                            return CartItemTile(shoe: shoe, ammount: ammount);

                            // return the cart icon
                          }))),

                  // Text("${value.getShopList().entries.reduce()}")
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          children: [
                            const TextSpan(text: "Total "),
                            TextSpan(
                                text: "\$${value.getTotalPrice()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),

                  BigButtonTile(text: "Buy now", onPressed: () {})
                ],
              ),
            ));
  }
}

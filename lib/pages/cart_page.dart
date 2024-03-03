import 'package:ecommerce_app/components/big_button_tile.dart';
import 'package:ecommerce_app/components/cart_item_tile.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/store/global_state.dart';
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
    return Consumer<GlobalState>(
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
                          itemCount: value.products.length,
                          itemBuilder: ((context, index) {
                            // get individual shoe
                            Product product = value.products[index];

                            int ammount = 10;

                            return CartItemTile(
                                product: product, ammount: ammount);

                            // return the cart icon
                          }))),

                  // Text("${value.getShopList().entries.reduce()}")
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(text: "Total "),
                            TextSpan(
                                text: "\$${0}",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),

                  BigButtonTile(
                      isSolid: true, text: "Buy now", onPressed: () {})
                ],
              ),
            ));
  }
}

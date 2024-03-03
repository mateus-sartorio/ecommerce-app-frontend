import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class CartItemTile extends StatefulWidget {
  final Product product;
  final int ammount;
  const CartItemTile({Key? key, required this.product, required this.ammount})
      : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  // void removeItemFromCart() {
  //   print("nice");
  //   Provider.of<GlobalState>(context, listen: false)
  //       .removeItemFromCart(widget.product);
  // }

  // void addItemAmmount() {
  //   print("nice+");
  //   setState(() {
  //     Provider.of<GlobalState>(context, listen: false)
  //         .addItemToCart(widget.product);
  //   });
  // }

  // void subtractItemAmmount() {
  //   print("nice-");
  //   Provider.of<GlobalState>(context, listen: false)
  //       .subtractItemAmmountFromCart(widget.product);
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.product.cover.url),
      title: Text(
        widget.product.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 30,
              height: 30,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                  ))),
          Text(
            "${widget.ammount}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: const Icon(Icons.add)))
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: IconButton(
              iconSize: 19,
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          // Text(
          //   "\$${widget.ammount * int.parse(widget.product.price)}",
          //   style: const TextStyle(fontSize: 14),
          // ),
        ],
      ),
    );
  }
}

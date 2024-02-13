import 'package:ecommerce_app/models/shoe.dart';
import 'package:ecommerce_app/store/global_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatefulWidget {
  final Shoe shoe;
  final int ammount;
  const CartItemTile({Key? key, required this.shoe, required this.ammount})
      : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  void removeItemFromCart() {
    print("nice");
    Provider.of<GlobalState>(context, listen: false)
        .removeItemFromCart(widget.shoe);
  }

  void addItemAmmount() {
    print("nice+");
    setState(() {
      Provider.of<GlobalState>(context, listen: false)
          .addItemToCart(widget.shoe);
    });
  }

  void subtractItemAmmount() {
    print("nice-");
    Provider.of<GlobalState>(context, listen: false)
        .subtractItemAmmountFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.shoe.imagePath),
      title: Text(
        widget.shoe.name,
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
                  onPressed: subtractItemAmmount,
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
                  onPressed: addItemAmmount,
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
              onPressed: () => removeItemFromCart(),
            ),
          ),
          Text(
            "\$${widget.ammount * int.parse(widget.shoe.price)}",
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

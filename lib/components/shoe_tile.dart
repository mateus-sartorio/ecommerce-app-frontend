import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const ShoeTile({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(product.cover.url),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            product.description.length > 150
                ? "${product.description.substring(0, 150)}..."
                : product.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // product name
                    Text(
                      product.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),

                    // price
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),

              // plus button
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => onTap!(),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

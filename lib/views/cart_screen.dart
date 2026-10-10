import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/empty_cart.dart';
import 'package:flutter_application_1/components/mini_card_tile.dart';
import 'package:flutter_application_1/models/products_model.dart';

class CartScreen extends StatefulWidget {
  final List<Data> allProducts;
  final Set<int> cartIds;
  const new({super.key, required this.allProducts, required this.cartIds});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.allProducts
        .where((element) => widget.cartIds.contains(element.id))
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.white),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? EmptyCart()
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final item = cartProducts[index];

                          return MiniCardTile(
                            name: item.name!,
                            tagline: item.tagline!,
                            price: item.price!,
                            imageUrl: item.image!,
                            onRemove: () {
                              setState(() {
                                widget.cartIds.remove(item.id!);
                              });
                            },
                          );
                        },
                      ),
              ),

              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey.shade600),

                    SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                child: Text("Checkout", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

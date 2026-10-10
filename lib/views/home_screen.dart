import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/products_card_tile.dart';
import 'package:flutter_application_1/models/products_model.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:flutter_application_1/views/cart_screen.dart';
import 'package:flutter_application_1/views/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiService = ApiServices();

  //Data tipinde-Models klasöründeki class'a göre
  List<Data> allProducts = [];
  bool isLoading = false;
  String errorMessage = "";

  final Set<int> cartIds = {};

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
      });

      final productData = await apiService
          .fetchProducts(); //productları çekme işlemi

      setState(() {
        allProducts =
            productData.data ??
            []; //çekilen producları model tipindeki değişkene aktardık
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load products";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            allProducts: allProducts,
                            cartIds: cartIds,
                          ),
                        ),
                      );
                    },
                    iconSize: 32,
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),

              SizedBox(height: 8),

              Text(
                "Find your perfect device",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://wantapi.com/assets/banner.png",
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: .7,
                        ),

                        itemCount: allProducts.length, //allproducts uzunluğu kadar bu liste dönecek diyoruz
                        itemBuilder: (context, index) {
                          final findProduct = allProducts[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    cartIds: cartIds,
                                    findProduct: findProduct,
                                  ),
                                ),
                              );
                            },
                            child: ProductsCardTile(findProduct: findProduct),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

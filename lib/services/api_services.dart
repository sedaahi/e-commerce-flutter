import 'dart:convert';

import 'package:flutter_application_1/models/products_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

//Zamana bağlı bir fonk liste dönecek ve dönecek veri Products tipinde olacak
  Future<ProductsModel> fetchProducts() async {

    final response = await http.get(Uri.parse("https://wantapi.com/products.php"));

    if(response.statusCode == 200) {

      //body çözümle data değişkenini
      final data = jsonDecode(response.body);

      return ProductsModel.fromJson(data); // productları productsModele verdik
    }else {
      throw Exception("Failed to load products");
    }
  }


}
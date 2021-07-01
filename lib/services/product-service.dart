import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sale_record/model/product.dart';

class ProductService {
  //String url = 'https://localhost:44315/api/Product';
  var url = Uri.http('192.168.0.14', '/RestApiDemo/api/Product');

  Future<List<Product>> getProduct() async {
    try {
      final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final List t = json.decode(response.body);
        final List<Product> products = t.map((p) => Product.fromJson(p)).toList();
        return products;
      } else {
        throw Exception('error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
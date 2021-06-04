import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sale_record/model/sale.dart';

class SaleService {
  //String url = 'https://localhost:44315/api/Sale';
  var url = Uri.https('localhost:44315', '/api/Sale');

  Future<List<Sale>> getSale() async {
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final List t = json.decode(response.body);
        final List<Sale> sales = t.map((s) => Sale.fromJson(s)).toList();
        return sales;
      } else {
        throw Exception('failed');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

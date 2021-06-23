import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sale_record/model/sale.dart';


class SaleService {
  //String url = 'https://localhost:5001/api/Sale';
  var url = Uri.http('192.168.0.14', '/RestApiDemo/api/Sale');


  Future<List<Sale>> getSale() async {
    try {
      final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        print("log");
        final List t = json.decode(response.body);
        final List<Sale> sales = t.map((s) => Sale.fromJson(s)).toList();
        return sales;
      } else {
        throw Exception("Can't get sales");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

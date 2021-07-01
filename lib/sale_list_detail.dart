import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/sale.dart';

class SaleDetail extends StatelessWidget {
  final Sale sale;


  const SaleDetail({required this.sale});

  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('yyyy-MM-dd hh:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text("Sale details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            //color: Colors.blue,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("PRODUCT CODE"),
                  subtitle: Text("${sale.productCode}"),
                ),
                ListTile(
                  title: Text("RECORD DATE"),
                  subtitle: Text(f.format(sale.recordDate as DateTime).toString()),
                ),
                ListTile(
                  title: Text("QUANTITY"),
                  subtitle: Text(sale.quantity.toString()),
                ),
                ListTile(
                  title: Text("PRICE"),
                  subtitle: Text("${sale.price.toString()} ₺"),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sale_record/list_page.dart';
import 'package:sale_record/model/sale.dart';
import 'package:sale_record/services/product-service.dart';
import 'package:sale_record/services/sale-service.dart';

import 'model/product.dart';

class AddData extends StatefulWidget {
  AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _quantity = TextEditingController();
  TextEditingController _price = TextEditingController();
  Future<Sale>? _futureSale;
  final SaleService saleService = SaleService();
  final ProductService productService = ProductService();
  List<Product> productList = [];

  Product selectedProduct = Product();

  @override
  void initState() {
    // TODO: implement initState
    getProductList();

    super.initState();
  }

  void getProductList() {
    productService.getProduct().then((pl) {
      setState(() {
        productList = pl;
        selectedProduct = productList[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: productList.length != 0 && selectedProduct.pCode != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<Product>(
                    value: selectedProduct,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (Product? newValue) {
                      setState(() {
                        selectedProduct = newValue!;
                      });
                    },
                    items: productList.map((Product value) {
                      return DropdownMenuItem<Product>(
                        value: value,
                        child: Text(value.pCode.toString()),
                      );
                    }).toList(),
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _quantity,
                        decoration: InputDecoration(labelText: "Quantity"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _price,
                        decoration: InputDecoration(labelText: "Price"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListPage()));
                          },
                          child: Text('Cancel')),
                      ElevatedButton(
                          onPressed: () async {
                            await insertSale();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListPage()));
                          },
                          child: Text('Add Sale')),
                    ],
                  ),
                ],
              )
            : Center(child: Text("Product List Empty")),
      ),
    );
  }

  Future<void> insertSale() async {
    var sale = new Sale(
        storeId: 1,
        productId: selectedProduct.id as int,
        quantity: int.parse(_quantity.text),
        price: int.parse(_price.text));
    await saleService.postSale(sale);
  }

  FutureBuilder<Sale> buildFutureBuilder() {
    return FutureBuilder<Sale>(
        future: _futureSale,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.quantity.toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        });
  }
}

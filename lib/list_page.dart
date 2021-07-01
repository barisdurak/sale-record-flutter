import 'package:flutter/material.dart';
import 'package:sale_record/model/sale.dart';
import 'package:sale_record/sale_list_detail.dart';
import 'package:sale_record/services/sale-service.dart';

import 'add_data.dart';

class ListPage extends StatelessWidget {
  final SaleService saleService = SaleService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddData()));
          },
          tooltip: 'Add Sale',
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Sales"),
          //backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: saleService.getSale(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Sale>> snapshot) {
              print(snapshot.connectionState);
              print(snapshot.hasData);
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                List<Sale> sales = snapshot.requireData;

                return ListView(
                  children: sales
                      .map((Sale sale) => Card(
                            elevation: 2,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Product Code: ${sale.productCode}"),
                                  Text("Giro: ${sale.quantity * sale.price}"),
                                ],
                              ),

                              //style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),

                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SaleDetail(
                                            sale: sale,
                                          ))),
                            ),
                          ))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                );
              } else {
                return SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                );
              }

              throw UnimplementedError();
            }));
  }
}

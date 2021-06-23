import 'package:flutter/material.dart';
import 'package:sale_record/model/sale.dart';
import 'package:sale_record/services/sale-service.dart';

class ListPage extends StatelessWidget {
  final SaleService saleService = SaleService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Sales"),
        ),
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
                      .map((Sale sale) => ListTile(
                            title: Text(sale.price.toString()),
                            subtitle: Text(sale.recordDate.toString()),
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

import 'package:flutter/material.dart';
import 'package:sale_record/services/sale-service.dart';

import 'model/sale.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();

  ListPage({Key? key}) : super(key: key);
}

class _ListPageState extends State<ListPage> {
  final List<String> entries = <String>['sale1', 'sale2', 'sale3'];
  final List<int> colorCodes = <int>[600, 500, 100];
  var saleService = SaleService();
  var saleList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: saleList.length,
          itemBuilder: (BuildContext context, int index) {
            Sale sale = saleList[index];
            return Container(
              height: 50,
              child: Center(child: Text('Entry ${sale.price}')),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          print("add");
          //await _showMyDialog(); // showMyDialog ile degistir
          await getSaleData();
        },
      ),
    );
  }

  @override
  void initState() {
    getSaleData();
    super.initState();
  }

  Future<void> getSaleData() async {
    saleService.getSale().then((value) {
      setState(() {
        saleList = value;
      });
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

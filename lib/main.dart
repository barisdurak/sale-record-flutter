import 'package:flutter/material.dart';
import 'package:sale_record/add_data.dart';
import 'package:sale_record/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Sale Tracker',
      theme: ThemeData(
          //theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF))
          //primarySwatch: Colors.blue,
          ),
      home: ListPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(widget.title),
    ));
  }
}

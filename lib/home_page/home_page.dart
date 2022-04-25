import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page'),),
      body: _body(),
    );
  }
  Widget _body()=>Container(
    alignment: AlignmentDirectional.center,
    height: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blue.shade800
    ),
    child: const Text('Home Page',style: TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold
    ),),
  );
}

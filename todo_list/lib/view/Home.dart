import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _list = ["Estudar", "Trabalho", "Exercicios"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do:"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_list[index]),
                  );
                }))
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _list = [];
  TextEditingController _controllerTask = TextEditingController();

  Future<File> _getFile() async {
    final fileDirectory = await getApplicationDocumentsDirectory();
    return File("${fileDirectory.path}/dados.json");
  }

  _saveTask() {
    String newTask = _controllerTask.text;

    Map<String, dynamic> task = Map();
    task["title"] = newTask;
    task["checked"] = false;

    setState(() {
      _list.add(task);
    });
    _saveFiles();
    _controllerTask.text = "";
  }

  _saveFiles() async {
    var file = await _getFile();

    String data = json.encode(_list);
    file.writeAsString(data);
  }

  _readFile() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _readFile().then((data) {
      setState(() {
        _list = json.decode(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("itens: " + _list.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("To do:"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTask,
                    decoration: InputDecoration(labelText: "Digite sua tarefa"),
                    onChanged: (text) {},
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        _saveTask();
                      },
                      child: Text("Salvar"),
                    )
                  ],
                );
              });
        },
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_list[index]["title"]),
                  );
                }))
      ]),
    );
  }
}

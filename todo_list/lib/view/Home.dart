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
  final TextEditingController _controllerTask = TextEditingController();

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
    //debugPrint("itens: " + _list.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do:"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTask,
                    decoration:
                        const InputDecoration(labelText: "Digite sua tarefa"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        _saveTask();
                      },
                      child: const Text("Salvar"),
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
                  return CheckboxListTile(
                    title: Text(_list[index]["title"]),
                    value: _list[index]["checked"],
                    onChanged: (value) {
                      setState(() {
                        _list[index]["checked"] = value;
                      });
                      _saveFiles();
                    },
                  );
                }))
      ]),
    );
  }
}

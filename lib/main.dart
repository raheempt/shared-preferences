import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();

  static const String KEYNAME = 'name';

  String nameValue = 'No value saved';  

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final name = nameController.text.toString();
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString(KEYNAME, name);
                  setState(() {
                    nameValue = name; 
                  });
                },
                child: Text('Save'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(nameValue),
            ],
          ),
        ),
      ),
    );
  }

  void getValue() async {
    final prefs = await SharedPreferences.getInstance();
    final getname = prefs.getString(KEYNAME);
          nameValue = getname ?? 'No value saved';
    setState(() {
      nameValue = getname ?? 'No value saved';
    });
  }
}



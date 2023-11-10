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

   String KEYNAME = 'name';

  String nameValue = 'No value saved';

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                child: Text('Saved'),
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


// import 'package:flutter/material.dart';
//  import 'package:shared_preferences/shared_preferences.dart';

//  void main(){
//   runApp(MyApp());
//  }

//  class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final namecondrollar= TextEditingController();
  
//   String KEY = 'key';

//  String value = 'no value';

//  @override
//   void initState() {
//     super.initState();
//     getvalue();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: namecondrollar,
//               decoration: InputDecoration(
//                 labelText: 'name',
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
//               ),
//             ),
//             ElevatedButton(onPressed: ()async{
//               final name = namecondrollar.text.toString();
//               final prf = await SharedPreferences.getInstance();
//               prf.setString(KEY, 'Key');
//               setState(() {
//                value = name;
//               });
//             },
//              child: Text('save')),
//              Text(value)
//           ],
//         ),
//       ),
//     );  
//   }


// void getvalue() async{
// final prf = await SharedPreferences.getInstance();
// final getname = prf.getString(KEY);
//   value = getname ?? 'No value saved';

// setState(() {
//  value = getname ?? 'No value saved';

// });

// }

// }



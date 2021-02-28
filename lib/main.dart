import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/SignUp.dart';
import 'package:demo/Start.dart';
import 'package:demo/login.dart';
import 'package:demo/Homepage.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Run());
}

class Run extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: HomePage(),

//      routes: <String,WidgetBuilder>
//      {
//
//        "LOGIN" : (BuildContext context)=>login(),
//        "SIGNUP" : (BuildContext context)=>SignUp(),
//        "START" : (BuildContext context)=>Start(),


//      }
    );
  }
}

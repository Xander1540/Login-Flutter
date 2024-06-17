import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_shared_pref_flutter/home_page.dart';
import 'package:login_shared_pref_flutter/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        height: double.infinity,
        width: double.infinity,
        child: Center(child: Icon(Icons.account_circle, color: Colors.white, size: 100,)),
      )
    );
  }

  void whereToGo() async{
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(KEYLOGIN);



    Timer(Duration(seconds: 3), (){

      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> HomePage()));
        }else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> LoginPage()));
        }
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> LoginPage()));
      }

      });
  }
}

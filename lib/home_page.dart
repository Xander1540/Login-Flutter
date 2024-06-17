import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.blue.shade300,
        child: Center(
            child: Icon(Icons.home_filled, color: Colors.white.withOpacity(0.5), size: 50)),
      ),
    );
  }
  
}
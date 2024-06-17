import 'package:flutter/material.dart';
import 'package:login_shared_pref_flutter/home_page.dart';
import 'package:login_shared_pref_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var nameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.account_circle, size: 100, color: Colors.lightBlue,)
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Email'),
                icon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),

            SizedBox(
              height: 10,
            ),

            TextField(
              controller: passController,
              decoration: InputDecoration(
                  label: Text('Password'),
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),

            SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: () async{

              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(MyHomePageState.KEYLOGIN, true);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
            }, child: Text('Login'))

          ],
        ),
      ),
    );
  }
}
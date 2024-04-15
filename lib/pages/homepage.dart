import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChattAPP",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        elevation: 20,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.4,
              ),
              Text("Yayy!! you logged in",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => LoginPage()));
          }, child: Text("SignOut")),
            ],
          ),
        ),
      ),
      
    );
  }
}
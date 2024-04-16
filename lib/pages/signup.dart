import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/firebase_auth_services.dart';
import 'package:flutter_firebase/pages/homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FireBaseAuthServices _auth = FireBaseAuthServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool signingup = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: TextField(
                controller: _usernameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  hintText: "Username",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: TextField(
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  hintText: "Email",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  hintText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            ElevatedButton(onPressed: (){
              _signUp();
            }, child:signingup? CircularProgressIndicator(color: Colors.blue,): Text("Signup",)),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      signingup = true;
    });
    String username  = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user  = await _auth.signUpWithEmailAndPassword(email, password);
setState(() {
  signingup = false;
});
    if(user!=null){
      print("User is successfully created");
      Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage()),);
    }else{
      print("Some error Ocurred");
    }

  }

}
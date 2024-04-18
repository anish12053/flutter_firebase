import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/auth/firebase_auth_services.dart';
import 'package:flutter_firebase/pages/homepage.dart';
import 'package:flutter_firebase/pages/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FireBaseAuthServices _auth = FireBaseAuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool signingin = false;

  @override
  void dispose() {
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
              _signIn();
            },
            child:signingin? CircularProgressIndicator(color: Colors.blue,): Text("Login",)),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height*0.1,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text("Sign Up", style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
setState(() {
  signingin = true;
});

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user  = await _auth.signInWithEmailAndPassword(email, password);
setState(() {
  signingin = false;
});
    if(user!=null){
      print("User is successfully SignIn");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    }else{
      print("Some error Ocurred");
    }

  }

}
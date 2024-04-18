import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/login.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();

  final _channel = WebSocketChannel.connect(
  Uri.parse('wss://echo.websocket.events'),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              tileColor: Colors.blue,
              horizontalTitleGap: 10,
              subtitle: Text("Account",style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            ),
            ListTile(
              title: Text("Sign Out"),
              tileColor: Colors.grey,
              onTap: () {        
                    FirebaseAuth.instance.signOut();
                    print("Sign out");
                    Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("ChattAPP",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        elevation: 20,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child:Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "write a message",
                ),
              ),
              StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
              ),
            ],
          ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), 
    );
  }
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text("Welcome runners !", ),
            TextField(
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Log In"),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.g_mobiledata), onPressed: () {  },),
                IconButton(icon: Icon(Icons.apple), onPressed: () {  },),
                IconButton(icon: Icon(Icons.facebook), onPressed: () {  },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

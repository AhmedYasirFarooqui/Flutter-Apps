import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    Future<void> register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      // ignore: unused_local_variable
      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db
            .collection("users")
            .doc(user.user?.uid)
            .set({'email': email, 'password': password});
        print('User has registered');
      } catch (e) {
        AlertDialog(
          content: Text(
            e.toString(),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Enter Username'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Enter Email'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Enter Password'),
              ),
              SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                onPressed: register,
                child: Text('Register'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

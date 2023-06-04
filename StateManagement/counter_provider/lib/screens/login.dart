import 'dart:developer';

import 'package:counter_provider/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login using Provider'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                provider.login(email.text, password.text);
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: provider.loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

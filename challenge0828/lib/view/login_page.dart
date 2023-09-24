import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English (US)'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/thread_logo.png',
            scale: 2,
          ),
          TextFormField(),
          TextFormField(),
          TextButton(
            onPressed: () {},
            child: const Text('Log in'),
          ),
          const Text('Forgot password?'),
        ],
      ),
    );
  }
}

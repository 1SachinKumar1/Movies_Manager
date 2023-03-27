import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager/ActualPages/List.dart';
import 'package:task_manager/Auth%20Pages/LogIn.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, field) {
            if (field.hasData) {
              return const Watched();
            } else {
              return const LogIn();
            }
          }),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Auth%20Pages/LogIn.dart';

import 'Form.dart';

class Watched extends StatelessWidget {
  const Watched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 2,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          title: const Center(child: Text("Watch 'Em All ")),
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 80, // spacing between rows
                crossAxisSpacing: 160, // spacing between columns
                crossAxisCount: 1),
            padding: const EdgeInsets.all(19),
            itemCount: 60,
            itemBuilder: (BuildContext context, int index) {
              return const Card(child: Formes());
            },
          ),
        ));
  }
}

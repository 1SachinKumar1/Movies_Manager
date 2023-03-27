import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager/Auth%20Pages/Auth.dart';
import 'package:task_manager/Auth%20Pages/LogIn.dart';
// import 'package:recipe_app/homePage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final pass = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }


  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/images/Sign.png"),
              const Text(
                "HELLO THERE!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Register below with details.",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon:  Icon(
                        Icons.email,
                        color: Colors.yellow.shade700,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.yellow.shade700, width: 2)),
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                    prefixIcon:Icon(
                      Icons.password,
                      color: Colors.yellow.shade700,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.yellow.shade700, width: 2)),
                    hintText: "Password",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.yellow.shade700),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ))),
                      onPressed: () async {
                        UserCredential? userCredential = await signUp(
                            email.text, pass.text);
                        if (userCredential != null) {
                          // User signed up successfully
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const Auth()),
                                  (route) => false);
                        } else {
                          // There was an error signing up the user
                        }
                      },
                      child:
                      const Text("Sign Up",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      )),
                ),
              ),
              const Text("Already a member?", style: TextStyle(fontSize: 18)),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogIn()));
                },
                child: const Text(
                  "LogIn Now!",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),

      )

      ,

    );
  }
}

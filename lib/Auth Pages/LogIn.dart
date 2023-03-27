import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'SignUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final email = TextEditingController();
  final pass = TextEditingController();

  Future signIn() async {
    //circular progress bar
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.deepPurple,
        ));
      },
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(),
      password: pass.text.trim(),
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Auth()),
        (route) => false);
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
              Image.asset("assets/images/Log.png"),
              const Text(
                "WELCOME BACK!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Continue your journey...",
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
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.yellow.shade700,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.yellow.shade700, width: 2)),
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
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.yellow.shade700,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.yellow.shade700, width: 2)),
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
                      onPressed: signIn,
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      )),
                ),
              ),
              const Text(
                "Or,",
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                },
                child: const Text(
                  "SignUp?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

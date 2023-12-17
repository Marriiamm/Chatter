import 'package:chatter/components/buttons.dart';
import 'package:chatter/components/textFields.dart';
import 'package:chatter/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/authenticationn.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset("assets/images/chatbar.png",height: 150,width: 150,),
                  const Spacer(
                    flex: 2,
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Exo2",
                      fontSize: 25,
                      color: kSecondryColor,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  customtextFormField(
                    onChange: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  customtextFormField(
                    obscureTtext: true,
                    onChange: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading =true;
                        setState(() {    
                        });
                        try {
                          await registerationMthod();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            registerDialog(context, "Error",
                                "The password provided is too weak.");
                          } else if (e.code == 'email-already-in-use') {
                            registerDialog(context, "Error",
                                "The account already exists for that email.");
                          }
                        } catch (e) {
                          snakbar(context, "OOPs , there was an error");
                        }
                        isLoading =false;
                        setState(() {
                          
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context){
                            return ChatPage(email: email!,);
                          }));
                      }
                    },
                    buttonLabel: 'Register',
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an acount ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Exo2",
                          fontSize: 15,
                          color: klightclr,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Exo2",
                            fontSize: 15,
                            color: Color.fromARGB(255, 143, 185, 237),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void snakbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void registerDialog(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (ctxx) {
          return AlertDialog(
            title: Text(title),
            content: Text(
              content,
              style: TextStyle(fontSize: 20, fontFamily: 'Exo2'),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctxx);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  Future<void> registerationMthod() async {
    var auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}

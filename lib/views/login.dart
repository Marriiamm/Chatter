import 'package:chatter/components/buttons.dart';
import 'package:chatter/components/textFields.dart';
import 'package:chatter/consts.dart';
import 'package:chatter/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_page.dart';

class ChatterSignIn extends StatefulWidget {
   ChatterSignIn({super.key});

  @override
  State<ChatterSignIn> createState() => _ChatterSignInState();
}

class _ChatterSignInState extends State<ChatterSignIn> {
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
              image: AssetImage("assets/images/authenticationn.png"), 
              fit: BoxFit.cover),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                children:  [
                  const Spacer(flex: 1,),
                    Image.asset("assets/images/chatbar.png",height: 150,width: 150,),
                    const Spacer(flex: 2,),
                    const Text("LogIn",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Exo2",
                        fontSize: 25,
                        color: kSecondryColor,
                      ),
                    ),
                    const Spacer(flex: 1,),
                    customtextFormField(
                      onChange: (data) {
                          email = data;
                        },
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10.0,),
                    customtextFormField(
                      obscureTtext: true,
                      onChange: (data) {
                          password = data;
                        },
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 30.0,),
                     CustomButton(
                      onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading =true;
                            setState(() {    
                            });
                            try {
                              print("hello");
                              await loginMthod();  
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                registerDialog(context, "Error",
                                    "No user found for that email.");
                              } else if (e.code == 'wrong-password') {
                                registerDialog(context, "Error",
                                    "Wrong password provided for that user.");
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
                      buttonLabel: 'LogIn',
                     ),
                    const SizedBox(height: 10.0,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an acount ?",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Exo2",
                          fontSize: 15,
                          color: klightclr,
                      ),
                    ),
                     const SizedBox(width: 10.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                              return  RegisterPage();
                          }),);
                      },
                      child: const Text("Register",
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
                    const Spacer(flex: 2,)
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

  Future<void> loginMthod() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}


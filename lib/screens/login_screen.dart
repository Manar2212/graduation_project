import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool ispassword = true;
  dynamic myemail, mypassword;

  signIn() async {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('No user found for that email.'),
            ),
          ).show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: 'Error',
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Wrong password provided for that user.'),
              )).show();
        }
      } catch (e) {
        print('error is ${e.toString()}');
      }
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ES_Tracker',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      myemail = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'must be not empty';
                      }
                      if (value.length > 100) {
                        return 'must be greater than 100';
                      }
                      if (value.length < 2) {
                        return 'must be less than 2';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text('email address'),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      mypassword = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'must be not empty';
                      }
                      if (value.length > 20) {
                        return 'must be greater than 20';
                      }
                      if (value.length < 4) {
                        return 'must be less than 4';
                      }
                      return null;
                    },
                    obscureText: ispassword,
                    decoration: InputDecoration(
                        label: Text('password'),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                        suffixIcon: IconButton(
                          icon: ispassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              ispassword = !ispassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  // button Sign In
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: MaterialButton(
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          var response = await signIn();
                          print(response);
                          print('===========');
                          await FirebaseFirestore.instance
                              .collection('users')
                              .get()
                              .then((value) {
                            value.docs.forEach((element) {
                              print(element.data());
                              print('============================');
                            });
                          }).catchError((error) {
                            print('error is ${error.toString()}');
                          });

                          if (response != null) {
                            Navigator.of(context).pushReplacementNamed("home");
                          } else {
                            print('Sign In failed');
                          }
                        }),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If you don't have account please",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: Text(
                            "Click Here",
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

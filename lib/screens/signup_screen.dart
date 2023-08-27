import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  dynamic username, mypassword, myemail,myphone;
  bool ispassword = true;

  signUp() async {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: mypassword);

        if (userCredential.user!.emailVerified == false) {
          User user = FirebaseAuth.instance.currentUser!;
          await user.sendEmailVerification();
        }

        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('The password provided is too weak.'),
            ),
          ).show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: 'Error',
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('The account already exists for that email.'),
              )).show();
        }
      } catch (e) {
        print('error is , ${e.toString()}');
      }
    } else {
      print('not valid');
    }
  }

  saveUserData(String username) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set({
        'username': username,
        'email': user.email,
        'phone_assistant': myphone,
      })
          .then((value) {
        print('Data saved successfully.');
      })
          .catchError((error) {
        print('Error saving data: ${error.toString()}');
      });
    } catch (e) {
      print('Error saving data: ${e.toString()}');
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
                    'Sign Up',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      username = value;
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
                    decoration: InputDecoration(
                        label: Text('username'),
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      myphone = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'must be not empty';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('phone assistant'),
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                  ),),
                  SizedBox(
                    height: 25,
                  ),
                  // button sign up
                  Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: MaterialButton(
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          var response = await signUp();
                          print(response);
                          print('================');
                          if (response != null) {
                            await saveUserData(username);
                            Navigator.of(context).pushReplacementNamed('home');
                          } else {
                            print('Signed Up Failed');
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
                        "If you have account please",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            "Click Here",
                            style: TextStyle(fontSize: 20),
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

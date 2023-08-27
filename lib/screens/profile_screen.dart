import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import'package:grad_project/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var user = FirebaseAuth.instance.currentUser;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/user-CKP.png',
              color: Colors.white,
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //image
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: Icon(Icons.person),
                  ),
                  Positioned(
                    left: 200,
                    top: 120,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //name
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: const Color(0xff228be6),
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc('${user!.uid}')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String name = snapshot.data?.get('username') ?? "";
                          return Text('$name',
                              style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: const Color(0xff000000),
                                ),);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
                leading: Container(
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
                trailing: Container(
                  // pencilflatbluecoloriconvector5 (11:197)
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              actions: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 10),
                                  child: Form(
                                    key: formkey,
                                    child: TextFormField(
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
                                      controller: nameController,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter name ',
                                        labelText: 'Name',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            var formdata = formkey.currentState;
                                            if (formdata!.validate()) {
                                              CollectionReference userRef =
                                              FirebaseFirestore.instance
                                                  .collection('users');
                                              userRef
                                                  .doc('${user!.uid}')
                                                  .update({
                                                'username': nameController.text,
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: Text('ok')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('cancel')),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }));
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 100),
                    ),
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ),
            //phone
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: const Color(0xff228be6),
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc('${user!.uid}')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String phone = snapshot.data?.get('phone_assistant') ?? "";
                          return Text('$phone',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: const Color(0xff000000),
                            ),);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
                leading: Container(
                  child: const Icon(
                    Icons.phone_android_outlined,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
                trailing: Container(
                  // pencilflatbluecoloriconvector5 (11:197)
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              actions: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 10),
                                  child: Form(
                                    key: formkey,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'must be not empty';
                                        }
                                        return null;
                                      },
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter phone',
                                        labelText: 'Phone',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            var formdata = formkey.currentState;
                                            if (formdata!.validate()) {
                                              CollectionReference userRef =
                                              FirebaseFirestore.instance
                                                  .collection('users');
                                              userRef
                                                  .doc('${user!.uid}')
                                                  .update({
                                                'phone_assistant': phoneController.text,
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: Text('ok')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('cancel')),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }));
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 100),
                    ),
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ),
            //email
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: const Color(0xff228be6),
                      ),
                    ),
                    Text(
                      '${user!.email}',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
                leading: Container(
                  child: const Icon(
                    Icons.email_rounded,
                    size: 40,
                    color: Colors.blue,
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
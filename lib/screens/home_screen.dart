import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/screens/disease_advice_screen.dart';
import 'package:grad_project/screens/history_screen.dart';
import 'package:grad_project/screens/notification.dart';
import 'package:grad_project/screens/profile_screen.dart';
import 'package:grad_project/screens/settings.dart';
import 'package:grad_project/screens/signal_screen.dart';
import 'package:grad_project/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'About.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(children: [
          UserAccountsDrawerHeader(
            accountName: StreamBuilder<DocumentSnapshot>(
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
                    fontWeight: FontWeight.w600,
                    height: 1.2125,
                    color: Colors.white,
                  ),);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
            // accountName: Text(
            //   '${user!.metadata}',
            //   style: SafeGoogleFont(
            //     'Inter',
            //     fontSize: 15,
            //     fontWeight: FontWeight.w600,
            //     height: 1.2125,
            //     color: Colors.white,
            //   ),
            // ),
            accountEmail: Text(
              '${user!.email}',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.2125,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xff98ccfc),
              child: Image.asset(
                'assets/images/user-125.png',
                color: Colors.white,
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Setting',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.1725,
                color: Color(0xff000000),
              ),
            ),
            leading: Image.asset(
              'assets/images/settings-WXX.png',
              width: 35.4,
              height: 26.94,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          ),
          ListTile(
            title: Text(
              'About',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.1725,
                color: Color(0xff000000),
              ),
            ),
            leading: Image.asset(
              'assets/images/about-12-GsF.png',
              width: 30.4,
              height: 30.94,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Disease advice',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.1725,
                color: Color(0xff000000),
              ),
            ),
            leading: Image.asset(
              'assets/images/tips-icon-png-hd-quality-psF.png',
              width: 30.4,
              height: 30.94,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => advice()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Calender',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.1725,
                color: Color(0xff000000),
              ),
            ),
            leading: Image.asset(
              'assets/images/px-calendaricon2svg-kJZ.png',
              width: 30.4,
              height: 30.94,
              fit: BoxFit.cover,
            ),
            onTap: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse('2100-03-06'));
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.1725,
                color: Color(0xff000000),
              ),
            ),
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
              size: 30,
            ),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'login');
            },
          ),
        ]),
      ),
      appBar: AppBar(
        title: Text(
          'ES Tracker',
          style: SafeGoogleFont(
            'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Color(0xff98ccfc),
              child: Image.asset(
                'assets/images/user-125.png',
                color: Colors.white,
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),

       body:
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HistoryScreen()),);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff2f6aa8)),
                          color: Color(0xff98ccfc),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/-e6H.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              // history5Mw (11:154)
                              'History',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff2f6aa8)),
                            color: Color(0xff98ccfc),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/-z13.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              'Contacts',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignalScreen()),);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff2f6aa8)),
                    color: Color(0xff98ccfc),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/pulse318-583917.png',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        // history5Mw (11:154)
                        'Signal',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => notification()),);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff2f6aa8)),
                          color: Color(0xff98ccfc),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/drug-2.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              'Medication',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()),);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff2f6aa8)),
                            color: Color(0xff98ccfc),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/user-x7P.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              'Profile',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Center(
      //   child: pages.elementAt(selectedIndex),
      // ),

    );
  }
}


















































































































































































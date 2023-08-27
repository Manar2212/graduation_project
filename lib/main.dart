import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/screens/home_screen.dart';
import 'package:grad_project/screens/login_screen.dart';
import 'package:grad_project/screens/signal_screen.dart';
import 'package:grad_project/screens/signup_screen.dart';
import 'package:grad_project/screens/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:grad_project/screens/sms.dart';

bool? isLogin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var user = FirebaseAuth.instance.currentUser;
  user == null ? isLogin = false : isLogin = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin == false ? Login() : HomeScreen(),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "home": (context) => HomeScreen(),
        "Notifications": (context) => notification(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

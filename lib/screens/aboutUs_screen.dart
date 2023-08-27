import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import'package:grad_project/utils.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/-q1P.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    '1-Hala Mansour',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                  subtitle: Text(
                    'https://www.facebook.com/hala.nada2001',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    '2-Manar Elhawary',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                  subtitle: Text(
                    'https://www.facebook.com/profile.php?id=100012811171703',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    '3-Norhan Nagy',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                  subtitle: Text(
                    'https://www.facebook.com/norhan.nagy.58',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    '4-Yasmin Adel',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                  subtitle: Text(
                    'https://www.facebook.com/yasmeen.adel.351756',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    '5-Yomna Khalil',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                  subtitle: Text(
                    'https://www.facebook.com/yasmeen.adel.351756',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

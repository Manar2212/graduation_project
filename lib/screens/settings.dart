import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/screens/aboutUs_screen.dart';
import 'package:grad_project/screens/privacy_policy_screen.dart';
import 'package:grad_project/utils.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/-kBw.png',
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Text(
                  'Privacy policy',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                leading: Image.asset(
                  'assets/images/privacy-policy-300x225.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Privacypolicy()),
                  );
                },
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Rate Us',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                leading: Image.asset(
                  'assets/images/star-149.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((BuildContext) {
                        return AlertDialog(
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: RatingWidget(
                                  initialRating: 3,
                                  onRatingChanged: (newRating) {
                                    print('New rating: $newRating');
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: Text('Send',style:TextStyle(color:Colors.white)),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,

                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      }));
                },
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Notes',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                leading: Image.asset(
                  'assets/images/note-fnm.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                onTap: () {},
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Delete All Data',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                leading: Image.asset(
                  'assets/images/-2UV.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                onTap: () {},
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'About Us',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                leading: Image.asset(
                  'assets/images/-5Wd.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Version 1.3.5B',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingWidget extends StatefulWidget {
  final int initialRating;
  final Function(int) onRatingChanged;

  const RatingWidget({
    Key? key,
    required this.initialRating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
            (index) => GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1;
            });
            widget.onRatingChanged(_rating);
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            size: 30.0,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
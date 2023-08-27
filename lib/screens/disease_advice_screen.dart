
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import'package:grad_project/utils.dart';
import 'package:video_player/video_player.dart';

class advice extends StatefulWidget {
  const advice({super.key});

  @override
  State<advice> createState() => _adviceState();
}

class _adviceState extends State<advice> {
  late VideoPlayerController controller1;
  late VideoPlayerController controller2;
  late VideoPlayerController controller3;

  @override
  void initState() {
    super.initState();
    controller1 = VideoPlayerController.asset('assets/Videos/Video1.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    controller2 = VideoPlayerController.asset('assets/Videos/Video2.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    controller3 = VideoPlayerController.asset('assets/Videos/Video3.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease advice'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/-UwF.png',
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: controller1.value.isInitialized
                    ? AspectRatio(
                  child: VideoPlayer(controller1),
                  aspectRatio: controller1.value.aspectRatio,
                )
                    : CircularProgressIndicator(),
              ),
              VideoProgressIndicator(controller1, allowScrubbing: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Duration? value = await controller1.position;
                        var d = value! - Duration(seconds: 10);
                        controller1.seekTo(Duration(seconds: d.inSeconds));
                      },
                      child: Text('<<')),
                  ElevatedButton(
                      onPressed: () {
                        controller1.play();
                      },
                      child: Icon(Icons.play_arrow_rounded)),
                  ElevatedButton(
                      onPressed: () {
                        controller1.pause();
                      },
                      child: Icon(Icons.pause_circle_outline_outlined)),
                  ElevatedButton(
                      onPressed: () async {
                        Duration? value = await controller1.position;
                        var d = value! + Duration(seconds: 10);
                        controller1.seekTo(Duration(seconds: d.inSeconds));
                      },
                      child: Text('>>')),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: controller2.value.isInitialized
                    ? AspectRatio(
                  child: VideoPlayer(controller2),
                  aspectRatio: controller2.value.aspectRatio,
                )
                    : CircularProgressIndicator(),
              ),
              VideoProgressIndicator(controller2, allowScrubbing: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Duration? value = await controller2.position;
                        var d = value! - Duration(seconds: 10);
                        controller2.seekTo(Duration(seconds: d.inSeconds));
                      },
                      child: Text('<<')),
                  ElevatedButton(
                      onPressed: () {
                        controller2.play();
                      },
                      child: Icon(Icons.play_arrow_rounded)),
                  ElevatedButton(
                      onPressed: () {
                        controller2.pause();
                      },
                      child: Icon(Icons.pause_circle_outline_outlined)),
                  ElevatedButton(
                      onPressed: () async {
                        Duration? value = await controller2.position;
                        var d = value! + Duration(seconds: 10);
                        controller2.seekTo(Duration(seconds: d.inSeconds));
                      },
                      child: Text('>>')),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: controller3.value.isInitialized
                    ? AspectRatio(
                  child: VideoPlayer(controller3),
                  aspectRatio: controller3.value.aspectRatio,
                )
                    : CircularProgressIndicator(),
              ),
              VideoProgressIndicator(controller3, allowScrubbing: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Duration? value = await controller3.position;
                        var d = value! - Duration(seconds: 10);
                        controller3.seekTo(Duration(seconds: d.inSeconds));
                      },
                      child: Text('<<')),
                  ElevatedButton(
                      onPressed: () {
                        controller3.play();
                      },
                      child: Icon(Icons.play_arrow_rounded)),
                  ElevatedButton(
                      onPressed: () {
                        controller3.pause();
                      },
                      child: Icon(Icons.pause_circle_outline_outlined)),
                  ElevatedButton(
                      onPressed: () async {
                        Duration? value = await controller3.position;
                        var d = value! + Duration(seconds: 10);
                        controller3.seekTo(Duration(seconds: d.inSeconds));
                      },
                      child: Text('>>')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
  }
}

























// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'dart:ui';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:grad_project/utils.dart';
//
// class advice extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 428;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Disease advice'),
//         actions: [
//           Container(
//             padding: EdgeInsets.only(right: 10),
//             child: Image.asset(
//               'assets/images/-UwF.png',
//               height: 50,
//               width: 50,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           child: Container(
//             // aboutaWR (11:751)
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color(0xffffffff),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   // epilepsyisacommonconditionthat (11:754)
//                   // margin:
//                   //     EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 86 * fem),
//                   padding:
//                   EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
//                   constraints: BoxConstraints(
//                     maxWidth: 386 * fem,
//                   ),
//                   child: Text('''Do not miss doses of your medications. (See Concern One!)\nGet plenty of sleep. #AimForZero Lost Hours of Sleep\nDrink plenty of water.\nEat a healthy balanced diet and do not skip meals.\nTry to reduce stress and control anxiety.\nAvoid alcohol and recreational drugs. #AimForZero Seizures\nCertain people with epilepsy should avoid flashing lights.\nTry to avoid catching colds and illnesses as much as possible.\nUse good basic hand hygiene: use hand sanitizer or wash your hands with soap and water often.\nTry to avoid touching your face because this is how we commonly pick up a cold.\nGetting your annual flu shot is one of the best ways to keep you healthy during flu season\nDo not swim alone.\nDo not climb to heights.\nDo not cook over an open flame without supervision.\nDo not drive if you have had a recent seizure within the past 6 months to 1 year. (Specific laws vary by state. Check our State Driving Law Database for details in your state.)\nDo not give a baby a bath without supervision.
//                     ''',
//                     style: SafeGoogleFont(
//                       'Inter',
//                       fontSize: 19 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2125 * ffem / fem,
//                       color: Color(0xff000000),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
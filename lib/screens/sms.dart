import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

// class SmsForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Send SMS',
//       home: SmsFormPage(),
//     );
//   }
// }

class SmsFormPage extends StatefulWidget {
  @override
  State<SmsFormPage> createState() => _SmsFormPageState();
}

class _SmsFormPageState extends State<SmsFormPage> {
  final String address = '+201065833111';

  final String message = 'Hello from Flutter!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sendSms();
          },
          child: Text('Send SMS'),
        ),
      ),
    );
  }

  void sendSms() async {
    List<String> recipients = [address];
    String _result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}


  // void sendSms() async {
  //   List<String> recipients = [address];
  //   String _result = await sendSMS(
  //       message: message,
  //       recipients: recipients,
  //       sender: '01090712481'
  //   ).catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }
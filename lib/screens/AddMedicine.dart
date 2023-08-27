import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  DateTime dateTime = DateTime.now();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("@mipmap/ic_launcher");

    const IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings();

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
      macOS: null,
      linux: null,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (dataYouNeedToUseWhenNotificationIsClicked) {},
    );
  }
  showNotification() {


    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      "ScheduleNotification001",
      "Notify Me",
      importance: Importance.high,
    );

    const IOSNotificationDetails iosNotificationDetails =
    IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
      macOS: null,
      linux: null,
    );

    // flutterLocalNotificationsPlugin.show(
    //     01, _nameController.text, _timeController.text, notificationDetails);

    tz.initializeTimeZones();
    final tz.TZDateTime scheduledAt = tz.TZDateTime.from(dateTime, tz.local);

    flutterLocalNotificationsPlugin.zonedSchedule(
        01, _nameController.text, _timeController.text, scheduledAt, notificationDetails,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        payload: 'Ths s the data');


    if (_formKey.currentState!.validate()) {
    FirebaseFirestore.instance.collection('medicines').add({
    'name': _nameController.text,
    'date': Timestamp.fromDate(
    DateFormat('yyyy-MM-dd – hh:mm a').parse(_dateController.text)),
    });

    Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Medicine '),
        ),
        body: Padding(
        padding: EdgeInsets.all(16.0),
          child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
          hintText: 'Medicine Name',
          labelText: ' Medicine Name',

          ),
          validator: (value) {
          if (value == null || value.isEmpty) {
          return 'Enter the name of medicine ';
          }
          return null;
          },
          ),
      SizedBox(height: 16.0),
      TextFormField(
        controller: _dateController,
        decoration: InputDecoration(
          hintText: 'Date And  Time',
          labelText: 'Date And Time',
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 10),
          );
          final TimeOfDay? slectedTime = await showTimePicker(
              context: context, initialTime: TimeOfDay.now());

          if (slectedTime == null) {
            return;
          }


          _timeController.text =
          "${slectedTime.hour}:${slectedTime.minute}:${slectedTime.period.toString()}";

          DateTime newDT = DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            slectedTime.hour,
            slectedTime.minute,
          );
          _dateController.text =
                 DateFormat('yyyy-MM-dd – hh:mm a').format(newDT);
          setState(() {
            dateTime = newDT;
          });

        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter the date and time of medicine';
          }
          return null;
        },
      ),
      SizedBox(height: 16.0),
      ElevatedButton(
        onPressed:showNotification,
        //
        child: Text('Add'),
      ),
    ],
    ),
    ),
        ),
    );
  }
}

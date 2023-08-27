import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';
import 'package:collection/collection.dart';
import 'package:complex/complex.dart';
import 'package:vector_math/vector_math.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:iirjdart/butterworth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SignalScreen extends StatefulWidget {
  const SignalScreen({Key? key});

  @override
  State<SignalScreen> createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  Future<List<double>> getEMGData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('sensors/emg/value').get();
    List<double> emgData = [];
    if (snapshot.exists) {
      double value = double.parse((snapshot.value).toString());
      emgData.add(value);
      print(emgData);
    } else {
      print('No data available.');
    }
    return emgData;

  }
  List<double> applyFilter(List<double> data_, Butterworth butterworth) {
    final filteredData = <double>[];
    for (final value in data_) {
      final filteredValue = butterworth.filter(value);
      filteredData.add(filteredValue);
    }
    return filteredData;
  }

  List<double> processEMGData(List<double> emgData) {
    final butterworth = Butterworth();
    butterworth.bandPass(4, 1000, 235, 430);

    final emgFiltered = applyFilter(emgData, butterworth);
    final emgRectified = emgFiltered.map((e) => e.abs()).toList();

    final emgThreshold = 800.0;
    final emgEvents = emgRectified.where((e) => e > emgThreshold).toList();

    if (emgRectified.last >400) {
      sendSms();
    }

    debugPrint('Number of events: ${emgEvents.length}');
    print(emgRectified);

    return emgRectified;
  }

  StreamController<List<double>> _dataStreamController =
  StreamController<List<double>>.broadcast();

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) async {
      final emgData = await getEMGData();
      final processedData = processEMGData(emgData);
      _dataStreamController.add(processedData);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _dataStreamController.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EMG Data Viewer'),
        ),
        body:Center(
          child: EMGChart(dataStream: _dataStreamController.stream),
        )
    );

  }
}


class EMGChart extends StatefulWidget {
  final Stream<List<double>> dataStream;

  const EMGChart({Key? key, required this.dataStream}) : super(key: key);

  @override
  _EMGChartState createState() => _EMGChartState();
}

class _EMGChartState extends State<EMGChart> {
  List<double> _data = [];

  @override
  void initState() {
    super.initState();

    widget.dataStream.listen((data) {
      setState(() {
        _data.addAll(data); // Accumulate new data
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: charts.LineChart(
        [
          charts.Series<double, int>(
            id: 'EMG Data',
            domainFn: (value, index) => index!,
            measureFn: (value, index) => value,
            data: _data,
          ),
        ],
        animate: true,
      ),
    );
  }
}




// -----------------------------
TwilioFlutter twilioFlutter = TwilioFlutter(
  accountSid: 'AC3b280192cb5b037180fdef9e78e1f3eb',
  authToken: '8b24af179f235bd59662813ffe80d45b',
  twilioNumber: '+14176412067',
);

var user = FirebaseAuth.instance.currentUser;


void sendSms() async {
  Location location = Location();
  LocationData currentLocation = await location.getLocation();

  List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(
    currentLocation.latitude!,
    currentLocation.longitude!,
  );
  String currentAddress = placemarks[0].name ?? '';
  String mapUrl =
      'https://www.google.com/maps/search/?api=1&query=${currentLocation.latitude},${currentLocation.longitude}';
  String messageBody =
      'Hi, your friend needs help now!\nPlease go to the location: $mapUrl';

  // await twilioFlutter.sendSMS(
  //   toNumber: '+201090712481',
  //   messageBody: messageBody,
  // );

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot documentSnapshot =
  await firestore.collection('users').doc('${user!.uid}').get();
  String phone = documentSnapshot['phone_assistant'];
  await twilioFlutter.sendSMS(
    toNumber: '+2$phone',
    messageBody: messageBody,
  );
}


void getSms() async {
  var data = await twilioFlutter.getSmsList();
  print(data);
  await twilioFlutter.getSMS('*********');
}

















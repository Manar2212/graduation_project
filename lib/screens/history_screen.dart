import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/screens/AddNote_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Stream<QuerySnapshot> _historyStream =
  FirebaseFirestore.instance.collection('history_').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream: _historyStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('error...${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.data!.docs.length == 0) {
                return Text('No Found Notes Yet');
              }

              return ListView.separated(
                separatorBuilder: (BuildContext context,int index) {
                  return Divider(
                    thickness: 2,
                  );
                },
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot note = snapshot.data!.docs[index];

                  return ListTile(
                    title: Text(note['title']),
                    subtitle: Text(note['note']),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddNote()),);
        },
      ),
    );
  }
}

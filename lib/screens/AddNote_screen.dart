import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  labelText: ' Title',

                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter title of note ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                maxLines: 5,
                controller: descContoller,
                decoration: InputDecoration(
                  hintText: 'Enter your note',
                  labelText: ' Note',

                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your note ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if (formKey.currentState!.validate()) {
                  FirebaseFirestore.instance.collection('history_').add({
                    'title': titleController.text,
                    'note': descContoller.text,
                  });

                  Navigator.of(context).pop();
                }
              }, child:
              Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

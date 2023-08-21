import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'color_schemes.g.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'dart:async';

class Times extends StatefulWidget {
  const Times({super.key});

  @override
  State<Times> createState() {
    return _TimesState();
  }
}

class _TimesState extends State<Times> {
  final _carName = TextEditingController();
  final _trackName = TextEditingController();

  final CollectionReference _lapTimes =
      FirebaseFirestore.instance.collection('tblLapTimes');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _lapTimes.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
        if (streamSnapShot.hasData) {
          return ListView.builder(
              itemCount: streamSnapShot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapShot.data!.docs[index];
                return Card(
                    margin: const EdgeInsets.all(16),
                    child: ListTile(
                      title: Text(documentSnapshot['CarName']),
                      subtitle: Text(documentSnapshot['TrackName']),
                    ));
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  Future<void> _delete(String productId) async {
    await _lapTimes.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _carName.text = documentSnapshot['CarName'];
      _trackName.text = documentSnapshot['TrackName'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _carName,
                  decoration: const InputDecoration(labelText: 'Car'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _trackName,
                  decoration: const InputDecoration(
                    labelText: 'Track',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String name = _carName.text;
                    final String price = _trackName.text;
                    await _lapTimes
                        .doc(documentSnapshot!.id)
                        .update({"CarName": name, "TrackName": price});
                    _carName.text = '';
                    _trackName.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _carName,
                  decoration: const InputDecoration(labelText: 'Car'),
                ),
                TextField(
                  controller: _trackName,
                  decoration: const InputDecoration(
                    labelText: 'Track',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String name = _carName.text;
                    final String price = _trackName.text;

                    await _lapTimes.add({"CarName": name, "TrackName": price});

                    _carName.text = '';
                    _trackName.text = '';
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: StreamBuilder(
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
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () =>
                                          _update(documentSnapshot)),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () =>
                                          _delete(documentSnapshot.id)),
                                ],
                              ),
                            ),
                          ));
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        TextButton(onPressed: _create, child: const Text("Add new time"))
      ],
    );
  }
}

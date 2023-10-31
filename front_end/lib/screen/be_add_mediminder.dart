import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchAlbum(String email, String medicine, String dosage) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/backend/add_mediminder'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      '_email' : email,
      '_medicine' : medicine,
      '_dosage' : dosage
    }),
  );

  return response.body;
}

class backend_add_mediminder extends StatefulWidget {
  final String email;
  final String medicine;
  final String dosage;
  const backend_add_mediminder({Key? key,
    required this.email, required this.medicine, required this.dosage,})
      :super(key: key);

  @override
  add_mediminder_state createState() => add_mediminder_state();

}

class add_mediminder_state extends State<backend_add_mediminder>{
  @override
  Widget build(BuildContext context) {
    Future<String> backend_request = fetchAlbum(widget.email, widget.medicine, widget.dosage);
    return MaterialApp(
      title: 'Add mediminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: (){Navigator.pop(context);},),
          title: const Text('Add mediminder'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: backend_request,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }


}
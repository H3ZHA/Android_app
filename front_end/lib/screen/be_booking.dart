import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchAlbum(String patient_email, String doctor_email) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/backend/booking'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      '_patient' : patient_email,
      '_doctor' : doctor_email
    }),
  );

  return response.body;
}

class backend_booking extends StatefulWidget {
  final String patient_email;
  final String doctor_email;
  const backend_booking({Key? key,
    required this.patient_email, required this.doctor_email,})
      :super(key: key);

  @override
  backend_booking_state createState() => backend_booking_state();

}

class backend_booking_state extends State<backend_booking>{
  @override
  Widget build(BuildContext context) {
    Future<String> backend_request = fetchAlbum(widget.patient_email, widget.doctor_email);
    return MaterialApp(
      title: 'Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: (){Navigator.pop(context);},),
          title: const Text('Booking'),
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
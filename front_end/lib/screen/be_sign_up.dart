import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchAlbum(String email, String password, String check_password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/backend/sign_up'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      '_email' : email,
      '_password' : password,
      '_checkp' : check_password
    }),
  );

  return response.body;
}

class backend_sign_up extends StatefulWidget {
  final String email;
  final String password;
  final String check_password;
  const backend_sign_up({Key? key,
    required this.email, required this.password, required this.check_password,})
      :super(key: key);

  @override
  backend_sign_up_state createState() => backend_sign_up_state();

}

class backend_sign_up_state extends State<backend_sign_up>{
  @override
  Widget build(BuildContext context) {
    Future<String> backend_request = fetchAlbum(widget.email, widget.password, widget.check_password);
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: (){Navigator.pop(context);},),
          title: const Text('Sign Up'),
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
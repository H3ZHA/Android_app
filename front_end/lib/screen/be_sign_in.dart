import 'dart:async';
import 'dart:convert';

import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String backend_return = '';

Future<String> fetchAlbum(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/backend/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      '_email' : email,
      '_password' : password
    }),
  );

  backend_return = response.body;

  return response.body;
}

class backend_sign_in extends StatefulWidget {
  final String email;
  final String password;
  const backend_sign_in({Key? key,
    required this.email, required this.password,})
      :super(key: key);

  @override
  backend_sign_in_state createState() => backend_sign_in_state();

}

class backend_sign_in_state extends State<backend_sign_in>{
  @override
  Widget build(BuildContext context) {
    Future<String> backend_request = fetchAlbum(widget.email, widget.password);
    return MaterialApp(
      title: 'Sign In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: (){Navigator.pop(context);},),
          title: const Text('Sign In'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: backend_request,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(backend_return.startsWith('login success')){
                  return Column(children: [
                    const Spacer(),
                    Text(snapshot.data!),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      // height: getProportionateScreenHeight(56),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          backgroundColor: Colors.lightBlue,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home_page(
                                email: widget.email)));
                        },
                        child: const Text(
                          'Go HOME',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],);
                }
                else{
                  return Text(snapshot.data!);
                }
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
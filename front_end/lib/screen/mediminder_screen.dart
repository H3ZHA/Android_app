import 'package:flutter/material.dart';

import 'add_mediminder_screen.dart';

class MediminderScreen extends StatefulWidget {
  final String email;
  const MediminderScreen({Key? key,
    required this.email,})
      :super(key: key);

  @override
  State<MediminderScreen> createState() => _MediminderScreenState();
}

class _MediminderScreenState extends State<MediminderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.55;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              const Center(
                  child: Text(
                'Press + to add a Mediminder',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              )),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0 * 2.5),
                height: size.height * 0.4,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 36 + 20.0,
                      ),
                      height: size.height * 0.5,
                      decoration: const BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[],
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Mediminder",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Number of Mediminder",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddMediminderScreen(
                email: widget.email)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

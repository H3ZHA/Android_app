import 'package:flutter/material.dart';
import 'home_icon.dart';
import 'appointment_screen.dart';
import 'mediminder_screen.dart';

class home_page extends StatefulWidget {
  final String email;
  const home_page({Key? key,
    required this.email})
      :super(key: key);

  @override
  home_page_state createState() => home_page_state();
}

class home_page_state extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        color: const Color(0xFF4A90E2),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/Icon7.png',
                height: 60,
                width: 60,
              ),
              Image.asset(
                'images/Icon8.png',
                height: 60,
                width: 60,
              ),
              Image.asset(
                'images/Icon9.png',
                height: 60,
                width: 60,

              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Transform.rotate(
                origin: const Offset(30, -60),
                angle: 2.4,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Color(0xffC8DDF6), Color(0xFFC8DDF6)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MedTel App',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome! MedTel offers many services!',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Image.asset('images/Icon1.png'),
                                iconSize: 100,
                                onPressed: (){

                                },
                              ),
                              IconButton(
                                icon: Image.asset('images/Icon2.png'),
                                iconSize: 100,
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => OppointmentScreen(
                                        email: widget.email,)));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Image.asset('images/Icon3.png'),
                                iconSize: 100,
                                onPressed: (){

                                },
                              ),
                              IconButton(
                                icon: Image.asset('images/Icon4.png'),
                                iconSize: 100,
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => MediminderScreen(
                                        email: widget.email,)));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

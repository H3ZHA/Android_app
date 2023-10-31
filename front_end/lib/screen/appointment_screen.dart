import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loginapp/screen/be_booking.dart';

class OppointmentScreen extends StatefulWidget {
  final String email;
  const OppointmentScreen({Key? key,
    required this.email,})
      :super(key: key);

  @override
  State<OppointmentScreen> createState() => _OppointmentScreenState();
}

class _OppointmentScreenState extends State<OppointmentScreen> {
  final user_email_controller = new TextEditingController();
  final doctor_email_controller = new TextEditingController();
  String user_email = "";
  String doctor_email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 25),
          TextFormField(
            controller: user_email_controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12)),
              hintText: 'User Email',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: doctor_email_controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12)),
              hintText: 'Doctor Email',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.flag),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12)),
              hintText: 'Specialization',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.healing),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12)),
              hintText: 'Describe Health issue',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          const SizedBox(height: 25),
          const Text('Timing'),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('From'),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      initialEntryMode: DatePickerEntryMode.input,
                      initialValue: DateTime.now(),
                      inputType: InputType.time,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Appointment Time',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      // locale: const Locale.fromSubtags(languageCode: 'fr'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('To'),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      initialEntryMode: DatePickerEntryMode.input,
                      initialValue: DateTime.now(),
                      inputType: InputType.time,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Appointment Time',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      // locale: const Locale.fromSubtags(languageCode: 'fr'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Text('Appointment Type'),
          FormBuilderRadioGroup<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12)),
              hintText: 'Appointment Type',
              fillColor: Colors.grey[200],
              filled: true,
            ),
            initialValue: null,
            name: 'best_language',
            options: [
              'Online',
              'Face to Face',
            ]
                .map((lang) => FormBuilderFieldOption(
                      value: lang,
                      child: Text(lang),
                    ))
                .toList(growable: false),
            controlAffinity: ControlAffinity.trailing,
          ),
          MaterialButton(
            onPressed: () {
              user_email = user_email_controller.text;
              doctor_email = doctor_email_controller.text;
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => backend_booking(
                    patient_email: user_email, doctor_email: doctor_email,)));
            },
            color: Colors.blue,
            child: const Text('Submit'),
          ),
        ],
      )),
    );
  }
}

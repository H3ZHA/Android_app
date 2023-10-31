import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loginapp/screen/be_add_mediminder.dart';

List<String> hoursOptions = [
  '1 hours',
  '2 hours',
  '3 hours',
  '4 hours',
  '5 hours',
  '6 hours'
];
final _formKey = GlobalKey<FormBuilderState>();

class AddMediminderScreen extends StatefulWidget {
  final String email;
  const AddMediminderScreen({Key? key,
    required this.email,})
      :super(key: key);

  @override
  State<AddMediminderScreen> createState() => _AddMediminderScreenState();
}

class _AddMediminderScreenState extends State<AddMediminderScreen> {
  final medicine_controller = new TextEditingController();
  final dosage_controller = new TextEditingController();
  String medicine = "";
  String dosage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: Colors.black,
        title: const Text('Add New Mediminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Medicine Name *'),
              FormBuilderTextField(
                controller: medicine_controller,
                name: 'medicine',
              ),
              const SizedBox(height: 15),
              const Text('Dosage in mg *'),
              FormBuilderTextField(
                controller: dosage_controller,
                name: 'dosage',
              ),
              const SizedBox(height: 15),
              const Text('Medicine Type'),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'images/bottle.png',
                        width: 55,
                      ),
                      const SizedBox(height: 5),
                      const Text('Bottle')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/pill.png',
                        width: 55,
                      ),
                      const SizedBox(height: 5),
                      const Text('Pill')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/syringe.png',
                        width: 55,
                      ),
                      const SizedBox(height: 5),
                      const Text('Syringe')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/tablet.jpg',
                        width: 55,
                      ),
                      const SizedBox(height: 5),
                      const Text('Tablet')
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text('Interval Selection'),
              const SizedBox(height: 15),
              const Text('Remind me every'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: FormBuilderDropdown<String>(
                  name: 'package',
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Select an Interval',
                    fillColor: Colors.grey[200],
                    filled: true,
                    // suffix: IconButton(
                    //   icon: const Icon(Icons.close),
                    //   onPressed: () {
                    //     _formKey.currentState!.fields['package']
                    //         ?.reset();
                    //   },
                    // ),
                    //  hintText: 'Select Package',
                  ),
                  items: hoursOptions
                      .map((package) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: package,
                            child: Text(package),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: FormBuilderDateTimePicker(
                  name: 'date',
                  initialEntryMode: DatePickerEntryMode.input,
                  // initialValue: DateTime.now(),
                  inputType: InputType.time,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Pick Time',
                    fillColor: Colors.lightBlue,
                    filled: true,
                  ),
                  // initialTime: const TimeOfDay(hour: 8, minute: 0),
                  // locale: const Locale.fromSubtags(languageCode: 'fr'),
                ),
              ),
              const SizedBox(height: 15),
              /*
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    // if (!_formKey.currentState!.validate()) {
                    //   return;
                    // }
                    // _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter the medicine\'s name'),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(

                        child: Text('Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))),
                  ),
                ),
              ),
              */
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
                    medicine = medicine_controller.text;
                    dosage = dosage_controller.text;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => backend_add_mediminder(
                          email: widget.email, medicine: medicine, dosage: dosage,)));
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

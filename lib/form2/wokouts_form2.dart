import 'package:flutter/material.dart';
import 'package:workouts_form_validation/const.dart';

class WokoutsForm2 extends StatefulWidget {
  const WokoutsForm2({super.key});

  @override
  State<WokoutsForm2> createState() => _WokoutsForm2State();
}

class _WokoutsForm2State extends State<WokoutsForm2> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Form(
          key: _signInKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 7) {
                    return "enter min 7 letter";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
              //=============submitt=====================================
              TextButton(
                onPressed: () {
                  if (_signInKey.currentState!.validate()) {
                    debugPrint('form validated');
                    // onSubmittCliked(context);
                  } else {
                    debugPrint("form not vlidated");
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15), // Adjust size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 20, // Font size
                    fontWeight: FontWeight.bold, // Font weight
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:workouts_form_validation/const.dart';

class WorkoutForm1 extends StatefulWidget {
  const WorkoutForm1({super.key});

  @override
  State<WorkoutForm1> createState() => _WorkoutForm1State();
}

class _WorkoutForm1State extends State<WorkoutForm1> {
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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: nameController,
                validator: (value) {
                  if (value != null && value.length < 7) {
                    return "enter min 7 letter";
                  } else if (!textValid.hasMatch(value!)) {
                    return 'invalid format';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  filled: true,
                  // Optional: background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12), // Adjust the radius as needed
                    ),
                    borderSide: BorderSide.none, // Removes the border line
                  ),
                ),
              ),
              //==========================================
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: emailController,
                validator: (value) {
                  if (value != null && value.length < 7) {
                    return 'please enter email id';
                  } else if (!emailValid.hasMatch(value!)) {
                    return 'invalid format';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  filled: true,
                  // Optional: background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12), // Adjust the radius as needed
                    ),
                    borderSide: BorderSide.none, // Removes the border line
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //=================================================
              TextFormField(
                keyboardType: TextInputType.text,
                controller: numberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a value';
                  } else if (!phoneValid.hasMatch(value)) {
                    return 'invalid format';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  filled: true,
                  // Optional: background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12), // Adjust the radius as needed
                    ),
                    borderSide: BorderSide.none, // Removes the border line
                  ),
                ),
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

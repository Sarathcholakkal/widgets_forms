import 'package:flutter/material.dart';
import 'package:workouts_form_validation/const.dart';

class WorkoutsForm3 extends StatefulWidget {
  const WorkoutsForm3({super.key});

  @override
  State<WorkoutsForm3> createState() => _WorkoutsForm3State();
}

class _WorkoutsForm3State extends State<WorkoutsForm3> {
  final GlobalKey<FormState> _signInKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();

  final List<bool> fieldInteracted = [false, false, false];

  @override
  void initState() {
    super.initState();

    // Add listeners to FocusNodes to track interaction
    nameFocusNode.addListener(() {
      if (!nameFocusNode.hasFocus) {
        setState(() {
          fieldInteracted[0] = true;
        });
      }
    });

    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        setState(() {
          fieldInteracted[1] = true;
        });
      }
    });

    numberFocusNode.addListener(() {
      if (!numberFocusNode.hasFocus) {
        setState(() {
          fieldInteracted[2] = true;
        });
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    numberFocusNode.dispose();
    super.dispose();
  }

  String? validateName(String? value) {
    if (value != null && value.length < 7) {
      return "Enter a minimum of 7 letters";
    } else if (!textValid.hasMatch(value!)) {
      return 'Invalid format';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value != null && value.length < 7) {
      return 'Please enter an email ID';
    } else if (!emailValid.hasMatch(value!)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!phoneValid.hasMatch(value)) {
      return 'Invalid phone format';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _signInKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                        fieldInteracted[0] ? validateName(value) : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                        fieldInteracted[1] ? validateEmail(value) : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: numberController,
                    focusNode: numberFocusNode,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                        fieldInteracted[2] ? validatePhone(value) : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter your phone number',
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (_signInKey.currentState!.validate()) {
                        debugPrint('Form validated successfully');
                        // Add your submit logic here
                      } else {
                        debugPrint("Form not validated");
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

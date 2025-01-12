import 'package:flutter/material.dart';
import 'package:workouts_form_validation/form6/text_field.dart';

class ValidationForm extends StatefulWidget {
  const ValidationForm({super.key});

  @override
  State<ValidationForm> createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Name Field
                  ValidationTextField(
                    textEditingController: nameController,
                    validator: (value) => value.isNotEmpty,
                    showConfirmation: true,
                    onChanged: (value) {
                      // Handle changes if needed
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email Field
                  ValidationTextField(
                    textEditingController: emailController,
                    validator: (value) => RegExp(
                      r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
                    ).hasMatch(value),
                    showConfirmation: true,
                    onChanged: (value) {
                      // Handle changes if needed
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  ValidationTextField(
                    textEditingController: passwordController,
                    validator: (value) => value.length >= 6,
                    showConfirmation: true,
                    onChanged: (value) {
                      // Handle changes if needed
                    },
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form is valid!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form is invalid!')),
                        );
                      }
                    },
                    child: const Text('Submit'),
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

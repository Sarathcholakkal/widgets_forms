import 'package:flutter/material.dart';
import 'package:workouts_form_validation/const.dart';

class WorkoutsForm9 extends StatefulWidget {
  const WorkoutsForm9({super.key});

  @override
  State<WorkoutsForm9> createState() => _WorkoutsForm9State();
}

class _WorkoutsForm9State extends State<WorkoutsForm9> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter name';
                } else if (!textValid.hasMatch(value)) {
                  return 'invalid format';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Enter your name",
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                print("${nameController.text}");
              },
              child: Text("submit"),
            )
          ],
        )),
      ),
    );
  }
}

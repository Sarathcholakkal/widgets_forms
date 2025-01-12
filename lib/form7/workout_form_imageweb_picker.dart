import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:workouts_form_validation/const.dart';

class WorkoutFormImagewebPicker extends StatefulWidget {
  const WorkoutFormImagewebPicker({
    super.key,
  });

  @override
  State<WorkoutFormImagewebPicker> createState() =>
      _WorkoutFormImagewebPickerState();
}

class _WorkoutFormImagewebPickerState extends State<WorkoutFormImagewebPicker> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  // Function to pick an image
  PlatformFile? _imageFile;
  FilePickerResult? result;
  Future<void> pickImage() async {
    try {
      result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;
      setState(() {
        _imageFile = result!.files.first;
      });
    } catch (e) {}
  }

  Future<void> onSubmittCliked(BuildContext ctx) async {
    print('one submitte pressed');
    final name = nameController.text.trim();
    final emil = emailController.text.trim();
    final domain = domainController.text.trim();
    final number = numberController.text.trim();
    if (result != null) {
      // final student = StudentModel(
      //     name: name,
      //     email: emil,
      //     domain: domain,
      //     number: number,
      //     image: _imagePath!);
      // await addStudent(student);

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (ctx) {
      //       return const RecordScreen();
      //     },
      //   ),
      // );
      clearField();
      // getAllStudent();
    } else {
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Please insert profile picture'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: const Text('close'))
              ],
            );
          });
    }
  }

  clearField() {
    nameController.clear();
    emailController.clear();
    domainController.clear();
    numberController.clear();
    setState(() {
      // _imagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(25),
            width: 600,
            height: 600,
            child: Form(
              key: _signInKey,
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      // padding: EdgeInsets.all(),
                      child: Text(
                        "Stundent Records App",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      )),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Add Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter name';
                              } else if (!textValid.hasMatch(value)) {
                                return 'invalid format';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your name',
                              contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                              filled: true,
                              // Optional: background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      12), // Adjust the radius as needed
                                ),
                                borderSide:
                                    BorderSide.none, // Removes the border line
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter email id';
                              } else if (!emailValid.hasMatch(value)) {
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
                                  Radius.circular(
                                      12), // Adjust the radius as needed
                                ),
                                borderSide:
                                    BorderSide.none, // Removes the border line
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: domainController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter a domain name';
                              } else if (!textValid.hasMatch(value)) {
                                return 'invalid format';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your domain',
                              contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                              filled: true,
                              // Optional: background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      12), // Adjust the radius as needed
                                ),
                                borderSide:
                                    BorderSide.none, // Removes the border line
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
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
                                  Radius.circular(
                                      12), // Adjust the radius as needed
                                ),
                                borderSide:
                                    BorderSide.none, // Removes the border line
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                pickImage();
                              },
                              child: Text("upload image"),
                            ),
                            _imageFile != null
                                ? Image.memory(
                                    Uint8List.fromList(_imageFile!.bytes!),
                                    height: 40,
                                    width: 40,
                                  )
                                : Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/profile.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (_signInKey.currentState!.validate()) {
                                  debugPrint('form validated');
                                  onSubmittCliked(context);
                                } else {
                                  debugPrint("form not vlidated");
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Button background color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 15), // Adjust size
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
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
                            ),
                            TextButton(
                              onPressed: () {
                                // Add your onPressed functionality here
                                debugPrint("Navigated"); //todo navigate
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Button background color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 15), // Adjust size
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                              ),
                              child: const Text(
                                "Go to stundent Records",
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 20, // Font size
                                  fontWeight: FontWeight.bold, // Font weight
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

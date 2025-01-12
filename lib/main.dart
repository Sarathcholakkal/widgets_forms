import 'package:flutter/material.dart';
import 'package:workouts_form_validation/form4/workouts_form4.dart';
import 'package:workouts_form_validation/form3/workouts_form3.dart';
import 'package:workouts_form_validation/form5/from_validate_package.dart';
import 'package:workouts_form_validation/form1/workout_form1.dart';
import 'package:workouts_form_validation/form6/textfield_form.dart';
import 'package:workouts_form_validation/form7/workout_form_imageweb_picker.dart';
import 'package:workouts_form_validation/form9/workouts_form9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:
            // MyHomePage(title: "new")

            WorkoutsForm9()
        // EmailPasswordWidget(),
        // ValidationForm()
        // WorkoutFormImagewebPicker(),

        //=================================================
        );
  }
}

import 'package:flutter/material.dart';

final RegExp emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&'*+-/ =? ^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneValid = RegExp(r"^(?:\+91|91)?\s?[6-9]\d{9}$");
final RegExp textValid = RegExp(r"^\s*[a-zA-Z,\s]+\s*$");

//====================================

final nameController = TextEditingController();
final emailController = TextEditingController();
final domainController = TextEditingController();
final numberController = TextEditingController();

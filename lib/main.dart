import 'package:flutter/material.dart';
import 'package:get_statemanagement/doctors.dart';

import 'home.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Doctors(),
    ),
  );
}

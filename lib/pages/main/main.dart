import 'package:flutter/material.dart';
import 'package:qms/pages/login/login_page.dart';
import 'package:qms/shared_components/style.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: MyStyles().boldBlack,
            bodyMedium: MyStyles().normalBlack,
            bodySmall: MyStyles().smallBlack,
            titleSmall: MyStyles().buttonText,
          )),
      debugShowCheckedModeBanner: false,
      home: LoginPage()));
}

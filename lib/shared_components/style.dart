import 'dart:ui';

import 'package:flutter/material.dart';
class MyStyles{
    TextStyle boldBlack = const TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontFamily:'Quicksand',fontSize: 18);
    TextStyle normalBlack = const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontFamily:'Quicksand');
    TextStyle smallBlack = const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontFamily:'Quicksand');
    TextStyle normalWhite = const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontFamily:'Quicksand');
    TextStyle normalGrey =  TextStyle(fontSize: 14, color: Colors.grey[600],fontFamily:'Quicksand');
    TextStyle buttonText = const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w600,fontFamily:'Quicksand');
    TextStyle hintText = const TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.w600,fontFamily:'Quicksand');
    TextStyle barText1 =  TextStyle(fontSize: 16, color: Colors.grey[800],fontWeight: FontWeight.w900,fontFamily:'Quicksand');
    TextStyle barText2 =  TextStyle(fontSize: 14, color: Colors.grey[600],fontWeight: FontWeight.w900,fontFamily:'Quicksand');
}
import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Avenir',
      textTheme: textTheme(),
  );
}
TextTheme textTheme(){
  return const TextTheme(
    displayLarge:TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ), 
    displayMedium:TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ), 
    displaySmall:TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ), 
      headlineMedium:TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ), 
    headlineSmall:TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ), 
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ),     
    bodyLarge:TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal
    ),  
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal
    ), 
  );
}
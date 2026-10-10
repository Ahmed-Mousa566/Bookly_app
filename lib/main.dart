import 'package:bookly_app/constant.dart' show kPrimaryColor;
import 'package:bookly_app/features/splach/splach.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BookliApp());
}
class BookliApp extends StatelessWidget {
  const BookliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:  kPrimaryColor ,
      ),
      home : const SplachScreen(),
    );
  }
}
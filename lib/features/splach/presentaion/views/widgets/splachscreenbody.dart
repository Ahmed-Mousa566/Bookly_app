import 'package:flutter/material.dart';

class SplachScreenBody extends StatelessWidget {
  const SplachScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Image.asset('assets/images/Logo.png'),
         
        ],
      ),
    );
  }
}
 import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      
      decoration: InputDecoration(
      hintText:  "Search",
     enabledBorder: boederDetails(),
     focusedBorder: boederDetails() ,
      suffixIcon: Icon(Icons.search)
      ),
      

    );

    
  }

  OutlineInputBorder boederDetails() {
    return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: Colors.white
    )
   );
  }
}
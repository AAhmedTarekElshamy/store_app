

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.hintText,required this.onChanged,  this.obscureText=false, required this.keyboardType});final String hintText;
   final TextInputType keyboardType;
   final bool obscureText ;
   Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {


    return TextFormField(
      obscureText: obscureText,
      // validator: (data){
      //   if(data!.isEmpty){
      //     return 'this field is required';
      //
      //   }
      // },
      keyboardType: keyboardType,
      onChanged:onChanged ,
      decoration: InputDecoration(
        // label: Text('email'),
        hintText: hintText,
     
        hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700]),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(

            color: Colors.grey,
          )
        ),
      ),
    );
  }
}


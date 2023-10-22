import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
 
  final String? label;
  final String? errorMessage;
  final bool obscureText;
  final Function (String)? onChanged;
  final String? Function(String?)? validator;

   const CustomTextFormField({
    super.key, 
     this.label, 
     this.errorMessage, 
     this.onChanged, 
     this.validator,  this.obscureText = false});


  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40)
    );
    

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: Colors.purple)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),

        isDense: true,
        label: label != null ? Text(label!) : null,
        errorText: errorMessage,
        focusColor: Colors.red,
      ),
    );
  }
}
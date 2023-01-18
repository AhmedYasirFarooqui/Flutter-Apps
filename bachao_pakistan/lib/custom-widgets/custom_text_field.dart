// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pk_cnic_input_field/pk_cnic_input_field.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    // this.icon,
    this.hintText,
    this.controller,
    this.isObscure = false,
    this.validator,
    this.keyBoardType,
    this.inputForamatter,
    this.borderColor,
  });
  // final IconData? icon;
  final String? hintText;
  final TextEditingController? controller;
  final bool? isObscure;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final Color? borderColor;
  final List<TextInputFormatter>? inputForamatter;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.2,
      height: height / 14,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: widget.borderColor!),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isObscure!,
          keyboardType: widget.keyBoardType,
          inputFormatters: widget.inputForamatter,
          validator: widget.validator,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              top: height / 50,
              left: width / 30,
            ),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 0.0),
            //   child: Icon(
            //     widget.icon,
            //     color: Colors.grey,
            //   ),
            // ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hinttext,
    this.controller,
    this.isObscure = false,
    this.validator,
    this.icon,
  });
  final String? hinttext;
  final TextEditingController? controller;
  final bool? isObscure;
  final String? Function(String?)? validator;
  final Widget? icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isObscure!,
          decoration: InputDecoration(
            suffixIcon: widget.icon,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 218, 209, 209),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 115, 191, 67),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            hintText: widget.hinttext,
            hintStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 155, 155, 155),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    Key? key,
    this.hinttext,
    this.controller,
    this.maxlines,
    this.readOnly,
    this.onChanged,
  }) : super(key: key);
  final String? hinttext;
  final TextEditingController? controller;
  final int? maxlines;
  final bool? readOnly;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        child: TextField(
          controller: controller,
          readOnly: readOnly!,
          keyboardType: TextInputType.multiline,
          maxLines: maxlines,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

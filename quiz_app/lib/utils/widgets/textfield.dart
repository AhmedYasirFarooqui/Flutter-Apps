import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    super.key,
    this.icon,
    required this.hintText,
    this.suffix,
    required this.controller,
    this.onTap,
    this.isObscure = false,
    this.validator,
  });
  final IconData? icon;
  final String hintText;
  final Widget? suffix;
  final TextEditingController controller;
  final bool isObscure;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        validator: widget.validator,
        style: const TextStyle(
          color: AppColors.green,
          fontSize: 16.0,
        ),
        onEditingComplete: () {
          _focusNode.unfocus();
        },
        obscureText: widget.isObscure,
        cursorColor: AppColors.green,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: AppColors.green,
            size: 20.0,
          ),
          suffixIcon:
              widget.hintText == 'password' || widget.hintText == 'Password'
                  ? InkWell(
                      onTap: widget.onTap,
                      child: widget.isObscure
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.green,
                              size: 20.0,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: AppColors.green,
                              size: 20.0,
                            ),
                    )
                  : const SizedBox(),
          hintText: widget.hintText,
          errorStyle: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            color: AppColors.red,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 16.0,
          ),
          fillColor: AppColors.white,
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

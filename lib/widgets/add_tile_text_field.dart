import 'package:flutter/material.dart';

class AddTileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final double? height;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final String? errorText;

  const AddTileTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.maxLines,
    required this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        onChanged: onChanged,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        readOnly: readOnly ?? false,
        maxLines: maxLines,
        cursorColor: Colors.grey,
        controller: controller,
        decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            errorStyle: const TextStyle(height: 0.1),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}

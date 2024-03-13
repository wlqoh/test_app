import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const DefaultTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide:   BorderSide(color: Colors.grey.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:   BorderSide(color: Colors.grey.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleSmall),
    );
  }
}

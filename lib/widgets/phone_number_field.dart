import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberWidget extends StatefulWidget {
  final TextEditingController controller;
  const PhoneNumberWidget({super.key, required this.controller});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    final maskFormatter = MaskTextInputFormatter(
        mask: '+7 (###) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return TextField(
        cursorColor: Colors.grey,
        controller: widget.controller,
        decoration: InputDecoration(
            enabledBorder:  OutlineInputBorder(
              borderSide:   BorderSide(color: Colors.grey.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:   BorderSide(color: Colors.grey.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Номер телефона',
            hintStyle: Theme.of(context).textTheme.titleSmall),
        inputFormatters: [maskFormatter]);
  }
}

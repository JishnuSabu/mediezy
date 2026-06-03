import 'package:flutter/material.dart';

Future<void> pickDate(
  BuildContext context,
  TextEditingController controller,
) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(3000),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1A4A3A),
            onPrimary: Colors.white,
            onSurface: Colors.black87,
          ),
        ),
        child: child!,
      );
    },
  );

controller.text =
    "${picked?.year}-"
    "${picked?.month.toString().padLeft(2, '0')}-"
    "${picked?.day.toString().padLeft(2, '0')}";
}
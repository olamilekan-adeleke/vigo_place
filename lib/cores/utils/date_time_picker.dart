import 'package:flutter/material.dart';

class DateTimePickerHelper {
  static Future<DateTime?> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 5),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(DateTime.now().year - 200),
      lastDate: DateTime(DateTime.now().year - 5),
    );

    return picked;
  }

  static Future<TimeOfDay?> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return picked;
  }
}

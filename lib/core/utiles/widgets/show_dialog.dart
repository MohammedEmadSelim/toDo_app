import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final Color backgroundColor;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: onConfirm,
          child: Text("Confirm"),
        ),
      ],
    );
  }
}

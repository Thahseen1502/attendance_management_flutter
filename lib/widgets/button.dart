import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.name, required this.ontap});
  final String name;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ontap(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00BFA5),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white, // Set the text color to white
        ),
      ),
    );
  }
}

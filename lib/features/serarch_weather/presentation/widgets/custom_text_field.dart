import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback Function() onSearch;

  @override
  Widget build(BuildContext context) {
    final outlinedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      controller: controller,
      style: GoogleFonts.lato(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintStyle: GoogleFonts.lato(
          color: Colors.grey,
        ),
        hintText: 'Enter city name',
        suffixIcon: IconButton(
            onPressed: onSearch,
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            )),
        border: outlinedInputBorder,
        fillColor: Colors.grey.shade900,
        filled: true,
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
      ),
    );
  }
}

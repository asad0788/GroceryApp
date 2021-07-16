import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTittle extends StatelessWidget {
  const SecondTittle({Key? key, required this.tittle}) : super(key: key);
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          tittle,
          style: GoogleFonts.varelaRound(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

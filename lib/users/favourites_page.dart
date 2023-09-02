import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class favoritespage extends StatefulWidget {
  const favoritespage({super.key});

  @override
  State<favoritespage> createState() => _favoritespageState();
}

class _favoritespageState extends State<favoritespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          size: 24.0,
        ),
        backgroundColor: Color.fromARGB(255, 159, 205, 232),
        title: Text(
          "Favorites",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}

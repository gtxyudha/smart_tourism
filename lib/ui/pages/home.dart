import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 33, right: 33),
            child: Container(
              width: 295,
              height: 40,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  fillColor: Color(0xff262A34),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none),
                  hintText: "Cari",
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xff6F7075),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28),
          Center(
            child: Image.asset(
              'assets/wisata/home_sekipan.png',
              width: 360,
              height: 258,
            ),
          ),
        ],
      ),
    );
  }
}

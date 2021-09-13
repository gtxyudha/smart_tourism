import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 29, right: 29),
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              height: 50,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    fillColor: Color(0xff262A34),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Nama',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff6F7075))),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    fillColor: Color(0xff262A34),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Username',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff6F7075))),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  fillColor: Color(0xff262A34),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xff6F7075),
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Color(0xff6F7075),
                  ),
                ),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    fillColor: Color(0xff262A34),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Alamat',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff6F7075))),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    fillColor: Color(0xff262A34),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'No Telepon',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff6F7075))),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    fillColor: Color(0xff262A34),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Level',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff6F7075))),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 286,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFCAC15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    )),
                onPressed: () {},
                child: Text(
                  'Sign UP',
                  style: GoogleFonts.poppins(
                    color: Color(0xff6B4909),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11, left: 30, right: 30),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

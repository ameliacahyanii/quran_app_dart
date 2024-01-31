import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/global.dart';
import 'package:quran_app/ui/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric (vertical: 10),
          child:  Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Quran App',
                  style: GoogleFonts.poppins(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Learn Quran and\nRecite once everyday',
                  style: GoogleFonts.poppins(
                    color: secondary,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  clipBehavior: Clip.none, // For make the button stack
                  children: [
                    Container(
                      height: 450,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primary,
                      ),
                      child:
                      SvgPicture.asset('/svg/splash.svg'),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -30,
                      right: 0,
                      child: Center(
                        child: GestureDetector( // Onclick
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                            },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: button,
                            ),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}

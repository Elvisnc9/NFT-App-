import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app/screen/Onboarding.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

void main() {
  runApp(
    TheResponsiveBuilder(builder: (context, orientation, screenType) {
      return const MyApp();
    }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NFT Arts',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const OnBoardingScreen(),
    );
  }
}



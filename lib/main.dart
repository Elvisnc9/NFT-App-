import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_app/screen/home.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
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
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const HomeScreen(),
    );
  }
}



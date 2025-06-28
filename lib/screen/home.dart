 // ignore_for_file: deprecated_member_use

 import 'package:flutter/material.dart';
import 'package:nft_app/widgets/image_list_view.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0Xff010101),
      body: Stack(
        children: [
          Positioned.fill(
            child:ShaderMask(
              blendMode: BlendMode.darken, 
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.4),
                  ],
                ).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 0.3.h,),
                    ImageListView(startIndex: 1, duration: 25),
                    SizedBox(height: 2.5.h,),
                    ImageListView(startIndex: 11, duration: 45,),
                    SizedBox(height: 2.5.h,),
                    ImageListView(startIndex: 21, duration: 65,),
                    SizedBox(height: 2.5.h,),
                     ImageListView(startIndex: 31, duration: 30,)
                  ],
                ),
                
              ),
            )
          ),
          Positioned(
            left: 2.h,
            bottom: 4.h,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Arts With NFTs',
                  style: TextStyle(
                    fontSize: 3.h,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 1.2.h,),
                Text(
                  'Check out this raffle of Nft arts for you Guys Only!! \n New coin minited every 10 seconds',
                  style: TextStyle(
                    fontSize: 1.6.h,
                    fontWeight: FontWeight.bold,
                    color: Colors.white38
                  ),
                ),
                SizedBox(height: 6.h,),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0Xff3000ff),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.1.h),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70
                    ),
                  ),
                )
              ],
            ),
          )  
        ],
      ),
    );
  }
}
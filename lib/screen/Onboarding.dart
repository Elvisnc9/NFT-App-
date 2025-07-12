 // ignore_for_file: deprecated_member_use

 import 'package:flutter/material.dart';
import 'package:nft_app/screen/homescreen.dart';
import 'package:nft_app/widgets/edge-to-edge.dart';
import 'package:nft_app/widgets/image_list_view.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  EdgeToEdgeWrapperWidget(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
           height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/images/Bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child:ShaderMask(
                  blendMode: BlendMode.darken, 
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.9),
                      ],
                    ).createShader(rect);
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 2.h,),
                        ImageListView(startIndex: 1, duration: 13),
                        SizedBox(height: 2.h,),
                        ImageListView(startIndex: 11, duration: 25,),
                        SizedBox(height: 2.h,),
                        ImageListView(startIndex: 21, duration: 12,),
                        SizedBox(height: 2.h,),
                         ImageListView(startIndex: 31, duration: 30,),
                          
                      ],
                    ),
                    
                  ),
                )
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 4.h,
          
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
      
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
                      'Check out this raffle of Nft arts for you Guys Only!!\n New coin minited every 10 seconds',
                       textAlign: TextAlign.center,
                      style: TextStyle(
                       
                        fontSize: 1.6.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.white38
                      ),
                    ),
                    SizedBox(height: 6.h,),
          
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomeScreen() ) );
                      },
                      child: Container(
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
                            color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )  
            ],
          ),
        ),
      ),
    );
  }
}
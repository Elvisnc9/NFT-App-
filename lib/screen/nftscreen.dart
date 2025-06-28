import 'package:flutter/material.dart';
import 'package:nft_app/animation/fade_animation.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class NftDetailScreen extends StatelessWidget {
  final String image;
  const NftDetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(tag: Image,
              child: Image.asset(image)),
              
              Positioned(
               left: 1.4.h,
               bottom: 1.3.h, 
                child: FadeAnimation(
                  intervalEnd: 0.2,
                  child: Container(
                    width: 50.w,
                    height: 5.2.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.2 ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Digital NFT Arts',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ), ),
                    )
                                ),
                ))
            ], 
          ),
          
          SizedBox(height: 1.5.h,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalEnd: 0.4,
              child: Text(
                'Monkey #271',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: FadeAnimation(
              intervalEnd: 0.6,
               child: Text(
                'Owned by Gennedy',
                style: TextStyle(
                  fontSize: 13 ,
                  color: Colors.white70,
                ),
                         ),
             ),
           ),

          SizedBox(height: 12.h,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FadeAnimation(
              intervalEnd: 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infolist(title: '3d 5h 20m', subtitle: 'Remaining Time'),
                  _infolist(title: '1.5 ETH', subtitle: 'Highest Bid'),
                ],
              ),
            ),
          ),

          const Spacer(),

          FadeAnimation(
            intervalEnd: 0.88,
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              margin:  EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: Color(0Xff3000ff),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: FadeAnimation(
                  intervalEnd: 1.0,
                  child: Text(
                    'Place a Bid',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            
            ),
          )

        ],
      ),
      
    );
  }
  Widget _infolist({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5,),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        )
      ],
    );
  }
}

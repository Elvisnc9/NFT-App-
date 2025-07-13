import 'dart:async';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app/screen/nftscreen.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:nft_app/widgets/bottomNavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CustomBottomNav().animate().fadeInUp(
        duration: 0.4.seconds,
        curve: Curves.easeOut,
      ),

      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/images/Bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: CustomScrollView(
            slivers: [ SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.w, ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 800.ms, curve: Curves.easeOut)
                          .slideX(
                            begin: -0.3,
                            duration: 800.ms,
                            curve: Curves.easeOut,
                          ),
                    ),
                
                    SizedBox(height: 2.h),
                
                    Tab()
                        .animate()
                        .fadeIn(
                          duration: 700.ms,
                          delay: 200.ms,
                          curve: Curves.easeOut,
                        )
                        .slideX(
                          begin: 0.2,
                          duration: 0.8.seconds,
                          curve: Curves.easeInQuad,
                        ),
                
                    SizedBox(height: 4.h),
                
                    SectionHeaders(title: 'Live Auction')
                        .animate()
                        .fadeIn(duration: 400.ms, delay: 40.ms, curve: Curves.easeOut)
                        .slideX(
                          begin: -0.15,
                          duration: 0.8.seconds,
                          curve: Curves.easeOut,
                        ),
                
                    SizedBox(height: 2.h),
                
                    NFTcards()
                        .animate()
                        .fadeIn(
                          duration: 0.6.seconds,
                          delay: 100.ms,
                          curve: Curves.easeOut,
                        )
                        .slideX(
                          begin: 0.4,
                          duration: 0.9.seconds,
                          delay: 0.1.seconds,
                          curve: Curves.easeOut,
                        ),
                
                    SizedBox(height: 3.h),
                
                    SectionHeaders(title: 'Top Collections')
                        .animate()
                        .fadeIn(
                          duration: 0.9.seconds,
                          delay: 40.ms,
                          curve: Curves.easeOut,
                        )
                        .slideX(
                          begin: -0.15,
                          duration: 800.ms,
                          curve: Curves.easeOut,
                        ),
                
                    Trending()
                        .animate()
                        .fadeIn(
                          duration: 0.3.seconds,
                          delay: 90.ms,
                          curve: Curves.easeOut,
                        )
                        .slideY(
                          begin: 0.25,
                          duration: 0.8.seconds,
                          delay: 0.6.seconds,
                          curve: Curves.easeOut,
                        ),
                
                    SizedBox(height: 2.h),
                
                    SectionTitles(title: 'Top Artists'),
                
                    Artist(),
                    SizedBox(height: 3.h),
                
                    SectionTitles(title: 'Top Collectors Buy Today'),
                
                    TodayChoice(),
                
                    SizedBox(height: 3.h),
                
                    SectionHeaders(title: 'Trending in Gaming'),
                
                    Gaming(),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),]
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            backgroundColor: Color(0xFF18322D),
            child: Icon(Icons.add, size: 30, color: Colors.white),
          )
          .animate()
          .fadeIn(duration: 0.8.seconds, curve: Curves.easeOut)
          .slideY(begin: -0.6, duration: 1.seconds, curve: Curves.easeOut),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SectionTitles extends StatelessWidget {
  const SectionTitles({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 2.8.h,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SectionHeaders extends StatelessWidget {
  const SectionHeaders({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 2.5.h,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Row(
          children: [
            Text(
              'Show More ',
              style: TextStyle(
                fontSize: 1.5.h,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.green, size: 15),
          ],
        ),
      ],
    );
  }
}

// class NFTcards extends StatelessWidget {
//   NFTcards({super.key});
//   final List<String> nftimage = [
//     'assets/images/BoredApe1.jpg',
//     'assets/images/bored-ape-.jpg',
//     'assets/nfts/30.png',
//     'assets/images/gaming (2).jpg',
//     'assets/nfts/15.png',
//     'assets/nfts/20.png'

//  ];

//   final List<String> name = [
//     'Redactor Remilo Babies ',
//     'Wild Monkey',
//     'waxlen Predator',
//      'Elves NFT',
//      'Bored Ape #1289',
//      'Messy Pikachu'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 45.h,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         physics: BouncingScrollPhysics(),
//         itemCount: nftimage.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 40.h,
//               width: 70.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 image: DecorationImage(
//                   image: AssetImage(nftimage[index]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   // 👇 Glassmorphism footer
//                   Positioned(
//                     top: 300 * 0.85,
//                     left: 0,
//                     right: 0,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(8),
//                       ), // optional rounded top
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           height: 100,
//                           width: double.infinity,
//                           color: Colors.white.withOpacity(
//                             0.1,
//                           ), // translucent overlay

//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,

//                             children: [
//                               SizedBox(height: 10),
//                               Text(
//                                 name[index],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),

//                               SizedBox(height: 8),

//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text(
//                                         '24h : 35 : 01s',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),

//                                       Text(
//                                         '    0.132ETH',
//                                         style: GoogleFonts.sora(
//                                           color: Colors.green,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   GestureDetector(
//                                     onTap: () {
//                                       // Handle bid action here
//                                     Navigator.push(context,  MaterialPageRoute(
//                                       builder: (context) => NftDetailScreen(image: nftimage[index], )
//                                     ));
//                                     },
//                                     child: Container(
//                                       height: 34,
//                                       decoration: BoxDecoration(
//                                         color: Colors.green,
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 15,
//                                           vertical: 8,
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             'Bid Now ',
//                                             style: GoogleFonts.sora(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class Tab extends StatelessWidget {
  Tab({super.key});

  final List<String> icons = [
    'assets/Icons/chart-simple-horizontal (1).svg',
    'assets/Icons/palette.svg',
    'assets/Icons/gamepad.svg',
    'assets/Icons/camera-retro.svg',
  ];

  final List<String> titles = ['All', 'Art', 'Gaming', 'Photography'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: titles.length, // Number of items in the list
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.5.w),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ), // Width of each page
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    icons[index],
                    color: Colors.green,
                    height: 15,
                  ),

                  SizedBox(width: 8),

                  Text(
                    titles[index],
                    style: TextStyle(
                      fontSize: 1.6.h,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Trending extends StatelessWidget {
  Trending({super.key});
  final List<String> Nftimage = [
    'assets/nfts/21.png',
    'assets/images/bored-ape.jpg',
    'assets/nfts/22.png',
    'assets/nfts/47.png',
    'assets/nfts/40.png',
  ];

  final List<String> name = [
    'MORALES APE #1289 ',
    'KILLER APE #2838',
    'CITY APE #9888',
    'SPACE APE #1923',
    'WILD APE #1234',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: Nftimage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 25.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage(Nftimage[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // 👇 Glassmorphism footer
                    Positioned(
                      top: 300 * 0.50,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ), // optional rounded top
                        child: Container(
                          color: Colors.black.withOpacity(0.9),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 100,
                          width: double.infinity,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: 10),
                              Text(
                                name[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Text(
                                    'Floor',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    '   0.012ETH',
                                    style: GoogleFonts.sora(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NFTcards extends StatefulWidget {
  NFTcards({super.key});
  final List<String> nftimage = [
    'assets/images/BoredApe1.jpg',
    'assets/images/bored-ape-.jpg',
    'assets/nfts/30.png',
    'assets/images/gaming (2).jpg',
    'assets/nfts/15.png',
    'assets/nfts/20.png',
  ];

  final List<String> name = [
    'Redactor Remilo Babies ',
    'Wild Monkey',
    'waxlen Predator',
    'Elves NFT',
    'Bored Ape #1289',
    'Messy Pikachu',
  ];

  @override
  State<NFTcards> createState() => _NFTcardsState();
}

class _NFTcardsState extends State<NFTcards> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  double _page = 0.0;

 List<Duration> countdowns = [];
  late Timer _timer;

  
 @override
void initState() {
  super.initState();
  countdowns = List.generate(widget.nftimage.length, (_) => Duration(hours: 24));
  _controller.addListener(() {
    setState(() {
      _page = _controller.page ?? 0;
    });
  });

  // Start timer to count down every second
  _timer = Timer.periodic(Duration(seconds: 1), (_) {
    setState(() {
      for (int i = 0; i < countdowns.length; i++) {
        if (countdowns[i].inSeconds > 0) {
          countdowns[i] -= Duration(seconds: 1);
        }
      }
    });
  });
}

 
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inHours)}h : ${twoDigits(duration.inMinutes % 60)}m : ${twoDigits(duration.inSeconds % 60)}s";
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.nftimage.length,
        itemBuilder: (context, index) {
          final parallax = (_page - index) * 50;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            NftDetailScreen(image: widget.nftimage[index], ),
                  ),
                );
              },
              child: Container(
                height: 40.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Stack(
                  children: [
                    // Background image with parallax effect
                    Transform.translate(
                      offset: Offset(parallax, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          widget.nftimage[index],
                          fit: BoxFit.cover,
                          height: 40.h,
                          width: 70.w,
                        ),
                      ),
                    ),
                    // Glassmorphism footer
                    Positioned(
                      top: 300 * 0.85,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 100,
                            width: double.infinity,
                            color: Colors.white.withOpacity(0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  widget.name[index],
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          formatDuration(countdowns[index]),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '0.132ETH',
                                          style: GoogleFonts.sora(
                                            color: const Color.fromARGB(255, 32, 245, 39),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => NftDetailScreen(
                                                  image: widget.nftimage[index], 
                                                ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 34,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 29, 232, 36),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 8,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Bid Now ',
                                              style: GoogleFonts.sora(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Artist extends StatelessWidget {
  Artist({super.key});

  final List<String> artistname = [
    'DesireBtc',
    'Leonardo',
    'Morpheus',
    'Davison',
  ];

  final List<String> artistprice = [
    '\$45,688',
    '\$12,345',
    '\$7,901',
    '\$2,345',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: artistname.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 25.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/Hacker.jpg'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    artistname[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    artistprice[index],
                    style: GoogleFonts.sora(color: Colors.green, fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TodayChoice extends StatelessWidget {
  TodayChoice({super.key});
  final List<String> Nftimage = [
    'assets/nfts/21.png',
    'assets/nfts/31.png',
    'assets/nfts/26.png',
  ];

  final List<String> name = [
    'Redactor Remilo Babies ',
    'Wild Monkey',
    'waxlen Predator',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: Nftimage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 25.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage(Nftimage[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // 👇 Glassmorphism footer
                    Positioned(
                      top: 300 * 0.50,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ), // optional rounded top
                        child: Container(
                          color: Colors.black.withOpacity(0.9),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 100,
                          width: double.infinity,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: 10),
                              Text(
                                name[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Floor',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        '   0.012ETH',
                                        style: GoogleFonts.sora(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text(
                                        'Volume',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        '   78.012ETH',
                                        style: GoogleFonts.sora(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Gaming extends StatelessWidget {
  Gaming({super.key});

  final List<String> nftImages = [
    'assets/images/bored-ape.jpg',
    'assets/images/gaming (2).jpg',
    'assets/images/gaming (3).jpg',
    'assets/images/gaming (4).jpg', // Add more images to make it 4 items
  ];

  final List<String> names = [
    'MORALES APE #1289',
    'KILLER APE #2838',
    'CITY APE #9888',
    'SPACE APE #1923',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 60.h, // Adjust height as grid will be taller than ListView
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 18,
            mainAxisSpacing: 24,
            childAspectRatio: 0.8, // Adjust this to control item shape
          ),
          itemCount: nftImages.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(nftImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Glassmorphism footer at the bottom
                  Positioned(
                    bottom: 0, // Align footer to the bottom
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              names[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Floor',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '   0.012ETH',
                                  style: GoogleFonts.sora(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app/widgets/tab.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class NftDetailScreen extends StatefulWidget {
  final String image;
  
  const NftDetailScreen({super.key, required this.image});

  @override
  State<NftDetailScreen> createState() => _NftDetailScreenState();
}

class _NftDetailScreenState extends State<NftDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                        height: 55.h,
                        width: double.infinity,
                        child: Hero(
                          tag: Image,
                          child: Image.asset(widget.image, fit: BoxFit.cover),
                        ),
                      )
                      .animate()
                      .fadeIn(
                        duration: 0.4.seconds,
                        delay: 90.ms,
                        curve: Curves.easeOut,
                      )
                      .slideY(
                        begin: -0.25,
                        duration: 0.6.seconds,
                        curve: Curves.easeOut,
                      ),

                  SizedBox(height: 1.5.h),
                ],
              ),
            ),
            Positioned(
                  left: 0,
                  right: 0,
                  top: 40.h,
                  child: ContentWidget(tabController: _tabController),
                )
                .animate()
                .fadeIn(
                  duration: 1.seconds,
                  delay: 250.ms,
                  curve: Curves.easeIn,
                )
                .slideY(
                  begin: 0.5,
                  duration: 0.9.seconds,
                  curve: Curves.easeOut,
                ),

            Positioned(top: 82.h, left: 0, right: 0, child: PlaceBidWidget())
                .animate()
                .fadeIn(
                  duration: 1.2.seconds,
                  delay: 300.ms,
                  curve: Curves.easeOut,
                )
                .slideY(begin: 0.7, duration: 1.seconds, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }
}



class PlaceBidWidget extends StatelessWidget {
  const PlaceBidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      height: 30.h,
      width: double.infinity,
      decoration: BoxDecoration(
         image: DecorationImage(
              opacity: 0.4,
              image: AssetImage('assets/images/Bg.jpg'),
              fit: BoxFit.cover,
            ),
        color: Color.fromARGB(255, 53, 93, 86),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sales Ends',
                    style: GoogleFonts.sora(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),

                  Text(
                    'July 20, 2025 at 3.05 PM',
                    style: GoogleFonts.sora(
                      fontSize: 14.sp,
                      color:  Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).animate().fadeIn(
                duration: 0.5.seconds,
                delay: 400.ms,
                curve: Curves.easeIn,
              ).slideX(
                begin: -0.2,
                duration: 1.4.seconds,
                delay: 300.ms,
                curve: Curves.easeOut,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highest Bid',
                    style: GoogleFonts.sora(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),

                  Text(
                    '2.21 ETH',
                    style: GoogleFonts.sora(
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 23, 233, 30),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).animate().fadeIn(
                duration: 0.5.seconds,
                delay: 400.ms,
                curve: Curves.easeIn,
              ).slideX(
                begin: 0.2,
                duration: 1.4.seconds,
                delay: 300.ms,
                curve: Curves.easeOut,
              ),
            ],
          ),

          SizedBox(height: 2.5.h),

          GestureDetector(
            onTap: () {
              showWalletSelection(context);
            },
            child: Container(
              height: 6.5.h,
              width: 65.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'Place a Bid',
                  style: GoogleFonts.sora(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(
                duration: 0.8.seconds,
                delay: 500.ms,
                curve: Curves.easeIn,
              ).slideX(
                begin: -0.4,
                duration: 2.seconds,
                delay: 500.ms,
                curve: Curves.easeOut,
              ),
        ],
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
       
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 41, 70, 65),
        borderRadius: BorderRadius.circular(30),
         image: DecorationImage(
              opacity: 0.3,
              image: AssetImage('assets/images/Bg.jpg'),
              fit: BoxFit.cover,
            ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Text(
            'Globin.debugApe toons',
            style: GoogleFonts.sora(
              fontSize: 25.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.2.h),
          SizedBox(
            height: 6.h,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Creator',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      'Globin.debug',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 5.w),

                VerticalDivider(
                  color: Colors.white.withOpacity(0.2),
                  thickness: 3,
                  width: 1.w,
                ),

                SizedBox(width: 5.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Floor Price',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          '0.001 ETH',
                          style: GoogleFonts.sora(
                            fontSize: 20.sp,
                            color: const Color.fromARGB(255, 82, 237, 87),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '\$1.97',
                          style: GoogleFonts.sora(
                            fontSize: 12.sp,
                            color: const Color.fromARGB(255, 82, 237, 87),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 2.h),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Tab1(tabController: _tabController),
          ),

          BidingList(),
        ],
      ),
    );
  }
}

class BidingList extends StatefulWidget {
  BidingList({super.key});

  @override
  State<BidingList> createState() => _BidingListState();
}

class _BidingListState extends State<BidingList> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      'Price': '0.0351 WETH',
      '\$ Price': '\$5.67',
      'Time': '3s ago',
      'From': '55643 cha0',
    },
    {
      'Price': '0.0279 WETH',
      '\$ Price': '\$4.11',
      'Time': '1m ago',
      'From': 'JohnDoe',
    },
    {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '2m ago',
      'From': 'CryptoKid',
    },
    {
      'Price': '0.0351 WETH',
      '\$ Price': '\$5.67',
      'Time': '2m ago',
      'From': '55643 cha0',
    },
    {
      'Price': '0.0279 WETH',
      '\$ Price': '\$4.11',
      'Time': '2m ago',
      'From': 'JohnDoe',
    },
    {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '3m ago',
      'From': 'CryptoKid',
    },
    {
      'Price': '0.0351 WETH',
      '\$ Price': '\$5.67',
      'Time': '5m ago',
      'From': '55643 cha0',
    },
    {
      'Price': '0.0279 WETH',
      '\$ Price': '\$4.11',
      'Time': '7m ago',
      'From': 'JohnDoe',
    },
    {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '9m ago',
      'From': 'CryptoKid',
    },
     {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '9m ago',
      'From': 'CryptoKid',
    },
    {
      'Price': '0.0351 WETH',
      '\$ Price': '\$5.67',
      'Time': '9m ago',
      'From': '55643 cha0',
    },
    {
      'Price': '0.0279 WETH',
      '\$ Price': '\$4.11',
      'Time': '10m ago',
      'From': 'JohnDoe',
    },
    {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '11m ago',
      'From': 'CryptoKid',
    },
    {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '14m ago',
      'From': 'CryptoKid',
    },
     {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '15m ago',
      'From': 'CryptoKid',
    },
    {
      'Price': '0.0351 WETH',
      '\$ Price': '\$5.67',
      'Time': '1h ago',
      'From': '55643 cha0',
    },
    {
      'Price': '0.0279 WETH',
      '\$ Price': '\$4.11',
      'Time': '1h ago',
      'From': 'JohnDoe',
    },
    {
      'Price': '0.0153 WETH',
      '\$ Price': '\$2.91',
      'Time': '1h ago',
      'From': 'CryptoKid',
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll()async{
    const scrollSpeed = 10;
  while(mounted){
    await Future.delayed(const Duration(milliseconds: 10));
    if (_scrollController.hasClients) {
      final max = _scrollController.position.maxScrollExtent;
      final offset = _scrollController.offset + (scrollSpeed /60);
      if(offset >= max){
        _scrollController.jumpTo(0);
      }else{
        _scrollController.jumpTo(offset);
      }
  }}

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
     // Ensure to call
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Header Row
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 10.0,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // For spacing where avatar was
              Text('Price', style: headerStyle),
              SizedBox(width: 25.w), // Spacer for
              Text('\$ Price', style: headerStyle),
              SizedBox(width: 5.w),
              Text('Time', style: headerStyle),
              SizedBox(width: 15.w),
              Text('From', style: headerStyle),
              // Spacer for future action buttons
            ],
          ),
        ),

        const Divider(color: Colors.white24, height: 0.1),

        // 🔹 Data rows
        SizedBox(
          height: 30.h,
          child: ListView.builder(
            itemCount: data.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              final item = data[index];
              return Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? 0 : 5.0,
                  bottom: 8.0,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Avatar
                      Text(item["Price"] ?? '', style: priceStyle),
                      SizedBox(width: 15.w),
                      Text(item["\$ Price"] ?? '', style: rowStyle),
                      SizedBox(width: 5.w),
                      Text(item["Time"] ?? '', style: rowStyle),
                      SizedBox(width: 12.w),
                      Text(item["From"] ?? '', style: rowStyle),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

TextStyle headerStyle = GoogleFonts.sora(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
TextStyle rowStyle = GoogleFonts.sora(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
TextStyle priceStyle = GoogleFonts.sora(
  color: Colors.green,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

void showWalletSelection(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => WalletSelectionSheet().animate().fadeIn(
                duration: 0.5.seconds,
                delay: 300.ms,
                curve: Curves.easeIn,
              ).slideY(
                begin: 0.4,
                duration: 1.2.seconds,
                delay: 200.ms,
                curve: Curves.easeOut,
              ),
  );
}

class WalletSelectionSheet extends StatelessWidget {
  const WalletSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 16, right: 16),
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration( image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/images/Bg.jpg'),
              fit: BoxFit.cover,
            ),
        color: Color.fromARGB(255, 41, 70, 65),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Connect Your Wallet',
              style: GoogleFonts.sora(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
        
            SizedBox(height: 10),
        
            Text(
              'If you currently dont have a wallet, you have the\n '
              'option to choose a provider and create one\n at this time. ',
              textAlign: TextAlign.center,
              style: GoogleFonts.sora(color: Colors.white, fontSize: 12),
            ),
        
            Text(
              'Learn More',
              style: GoogleFonts.sora(
                color: const Color.fromARGB(255, 7, 222, 14),
                fontSize: 12,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            walletTile(context, 'MetaMask', 'assets/wallet/metamask.png'),
            walletTile(context, 'Trust Wallet', 'assets/wallet/trustWallet.png'),
            walletTile(context, 'Binance Wallet', 'assets/wallet/binance.png'),
            walletTile(context, 'Phantom', 'assets/wallet/phantom-.png'),
            walletTile(context, 'Bitget Wallet', 'assets/wallet/Bitget.png'),
            walletTile(context, 'CoinBase Wallet', 'assets/wallet/coinbase.png'),
          ],
        ),
      ),
    );
  }

  Widget walletTile(BuildContext context, String name, String logo) => Padding(
    padding: const EdgeInsets.all(7.0),
    child: Container(
      height: 6.h,
      width: 70.w,
      decoration: BoxDecoration(
        color:Color.fromARGB(255, 69, 110, 103),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Image.asset(
          logo, // Assuming you have logo images in assets
          height: 4.h,
          width: 4.h,
        ),
        title: Text(name, style: GoogleFonts.poppins(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 15.sp)),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}

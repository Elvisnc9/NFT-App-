import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF26332F), // Example background color from your image
      shape: CircularNotchedRectangle(), // Makes space for the floating button
      notchMargin: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem('assets/Icons/house-chimney (1).svg', 'Home', Colors.green),
            SizedBox(width: 5),
            _buildNavItem('assets/Icons/chart-simple (2).svg', 'Stats', Colors.white),
            SizedBox(width: 40), // space for the floating button
            _buildNavItem('assets/Icons/search (1).svg', 'Search', Colors.white),
            SizedBox(width: 5),
            _buildNavItem('assets/Icons/user (2).svg', 'Profile', Colors.white),
          ],
        ),
      ),
    );
      
  
  }

  Widget _buildNavItem(String icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon, height: 20, color: color,),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ],
    );
  }
}

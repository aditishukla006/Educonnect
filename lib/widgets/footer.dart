// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 800;

    return Container(
      color: Colors.indigo.shade900, // Dark purple background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child:
              isSmallScreen
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildFooterContent(isSmallScreen),
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildFooterContent(isSmallScreen),
                  ),
        ),
      ),
    );
  }

  List<Widget> _buildFooterContent(bool isSmallScreen) {
    return [
      // Logo + Social Icons
      Expanded(
        flex: isSmallScreen ? 0 : 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
                children: [
                  TextSpan(text: 'Navkar\n'),
                  TextSpan(
                    text: 'Education',
                    style: TextStyle(
                      color: Color(0xFFFFC107),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/LOGO.jpg',
                      fit: BoxFit.cover, // Makes it fill the box proportionally
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Contact Info
      Expanded(
        flex: isSmallScreen ? 0 : 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 20 : 0,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Get in touch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Raghukul Society, B/3/36, near Shahibaug Flyover, opp. Railway Crossing,\n Jain Colony, Shahibag, Ahmedabad, Gujarat 380004',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.white70, size: 18),
                  SizedBox(width: 8),
                  Text(
                    '+91 88661 14453',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.white70, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'dbmehta.30@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.white70, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Book a Visit',
                    style: TextStyle(
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Locations
      // Office Hours
      Expanded(
        flex: isSmallScreen ? 0 : 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Office Hours',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Mon - Fri: 5:30 pM - 9:00 PM',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 6),
            Text(
              'Saturday: 6:30 pM - 9:00 PM',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 6),
            Text('Sunday: Closed', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    ];
  }
}

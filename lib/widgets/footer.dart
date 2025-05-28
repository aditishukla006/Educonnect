import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+918866114453');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'dbmehta.30@gmail.com');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchMap() async {
    const url =
        'https://www.google.com/maps/search/?api=1&query=Navkar+Education+Shahibaug+Ahmedabad';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 800;

    return Container(
      color: Colors.indigo.shade900,
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
      // Logo
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
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/LOGO.jpg', fit: BoxFit.cover),
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
            children: [
              const Text(
                'Get in touch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Raghukul Society, B/3/36, near Shahibaug Flyover, opp. Railway Crossing,\nJain Colony, Shahibag, Ahmedabad, Gujarat 380004',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _launchPhone,
                child: const Row(
                  children: [
                    Icon(Icons.phone, color: Colors.white70, size: 18),
                    SizedBox(width: 8),
                    Text(
                      '+91 88661 14453',
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _launchEmail,
                child: const Row(
                  children: [
                    Icon(Icons.email, color: Colors.white70, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'dbmehta.30@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _launchMap,
                child: const Row(
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
              ),
            ],
          ),
        ),
      ),

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
              'Mon - Fri: 5:30 PM - 9:00 PM',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 6),
            Text(
              'Saturday: 6:30 PM - 9:00 PM',
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

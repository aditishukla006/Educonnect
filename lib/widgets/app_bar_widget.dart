import 'package:eduwebsite/scrrens/about_us.dart';
import 'package:eduwebsite/scrrens/contact_screen.dart';
import 'package:eduwebsite/scrrens/gallary_screen.dart';
import 'package:eduwebsite/scrrens/home_page.dart';
import 'package:eduwebsite/scrrens/inquiry_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback onBookVisitTap;
  const AppBarWidget({required this.onBookVisitTap, super.key});
  Size get preferredSize => const Size.fromHeight(90);

  void _callNumber(String number) async {
    final Uri callUri = Uri.parse('tel:$number');
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    }
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigo.shade900,
      toolbarHeight: 90,
      titleSpacing: 0,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              height: 70,
              width: 160,
              child: Image.asset('assets/LOGO.jpg', fit: BoxFit.contain),
            ),
          ),

          const SizedBox(width: 20),

          // Responsive menu: horizontal scroll on narrow widths
          Expanded(
            child:
                screenWidth < 900
                    ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [_buildMenuButtons(context)],
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [_buildMenuButtons(context)],
                    ),
          ),

          IconButton(
            tooltip: 'Call Us',
            onPressed: () => _callNumber('+918866114453'),
            icon: const Icon(Icons.call, color: Colors.white, size: 25),
          ),
          IconButton(
            tooltip: 'Facebook',
            onPressed:
                () => _launchUrl('https://www.facebook.com/share/1C7CTrYWmM/'),
            icon: const Icon(Icons.facebook, color: Colors.white, size: 25),
          ),
          IconButton(
            tooltip: 'Instagram',
            onPressed:
                () => _launchUrl(
                  'https://www.instagram.com/navkar_educational_institute?igsh=dnlzNW5hd2lvNHJk',
                ),
            icon: const FaIcon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
              size: 25,
            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => InquiryForm()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.orange.shade700,
              ),
              child: const Text(
                'Book a Visit',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }

  // Extract menu buttons to reuse in both scroll and non-scroll Rows
  Widget _buildMenuButtons(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          },
          child: const Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutUsPage()),
            );
          },
          child: const Text(
            'About',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Course',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GalleryPage()),
            );
          },
          child: const Text(
            'Gallery',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Team',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => InquiryForm()),
            );
          },
          child: const Text(
            'Inquiry',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ContactUsPage()),
            );
          },
          child: const Text(
            'Contact',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

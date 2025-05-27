import 'package:flutter/material.dart';
import 'package:eduwebsite/scrrens/about_us.dart';
import 'package:eduwebsite/scrrens/contact_screen.dart';
import 'package:eduwebsite/scrrens/gallary_screen.dart';
import 'package:eduwebsite/scrrens/home_page.dart';
import 'package:eduwebsite/scrrens/inquiry_screen.dart';
import 'package:eduwebsite/scrrens/team_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarWidget extends StatefulWidget {
  final VoidCallback onBookVisitTap;
  const AppBarWidget({required this.onBookVisitTap, super.key});
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _dropdownOverlay;
  bool _isHoveringCourses = false;

  void _showDropdown(BuildContext context) {
    _dropdownOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 320, // Adjusted width for better readability
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 45), // position under the Courses button
            child: MouseRegion(
              onExit: (_) => _removeDropdown(),
              child: Material(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 200, // Max height for dropdown, enables scrolling
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var course in [
                          'Playgroup, Nursery, Jr.KG, Sr.KG',
                          'Standard 1 to 10 & 11-12 (Com./Sci.) ABACUS (Whole Brain Development Program)',
                          'Degree / Diploma Engineering',
                          'Engineering Projects',
                          'Spoken English (With Certification)',
                          'IELTS Coaching',
                          'Computer Training (With Certification)',
                          'AutoCAD, PCB Designing Courses (With Certification)',
                        ])
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Selected: $course')),
                              );
                              _removeDropdown();
                            },
                            hoverColor: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              child: Text(
                                course,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_dropdownOverlay!);
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    setState(() {
      _isHoveringCourses = false;
    });
  }

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

          _navButton(context, 'Home', const HomePage()),
          _navButton(context, 'About', const AboutUsPage()),

          CompositedTransformTarget(
            link: _layerLink,
            child: MouseRegion(
              onEnter: (_) {
                if (_dropdownOverlay == null) {
                  setState(() => _isHoveringCourses = true);
                  _showDropdown(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Courses',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration:
                        _isHoveringCourses ? TextDecoration.underline : null,
                  ),
                ),
              ),
            ),
          ),

          _navButton(context, 'Gallery', GalleryPage()),
          _navButton(context, 'Team', TeamPage()),
          _navButton(context, 'Inquiry', InquiryForm()),
          _navButton(context, 'Contact', ContactUsPage()),
          const Spacer(),
          Row(
            children: [
              IconButton(
                tooltip: 'Call Us',
                onPressed: () => _callNumber('+918866114453'),
                icon: const Icon(Icons.call, color: Colors.white, size: 25),
              ),
            ],
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

          const SizedBox(width: 10),
          TextButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => InquiryForm()),
                ),
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

  Widget _navButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed:
          () =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

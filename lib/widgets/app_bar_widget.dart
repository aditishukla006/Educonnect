import 'package:eduwebsite/scrrens/faq.dart';
import 'package:eduwebsite/scrrens/history.dart';
import 'package:eduwebsite/scrrens/teamdetailabacus.dart';
import 'package:eduwebsite/scrrens/whatisabacus.dart';
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
  final GlobalKey _dropdownKey = GlobalKey();
  OverlayEntry? _dropdownOverlay;
  OverlayEntry? _abacusOverlay;
  bool _isHoveringCourses = false;
  bool _isHoveringAbacus = false;
  bool _isInAbacusSubmenu = false;

  void _showDropdown(BuildContext context) {
    _dropdownOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 350,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 45),
            child: MouseRegion(
              onExit: (_) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (!_isHoveringAbacus && !_isInAbacusSubmenu) {
                    _removeDropdown();
                  }
                });
              },

              child: Material(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _dropdownItem(
                          context,
                          'Playgroup, Nursery, Jr.KG, Sr.KG',
                        ),
                        _dropdownItem(
                          context,
                          'Standard 1 to 10 & 11-12 (Com./Sci.)',
                        ),
                        _abacusDropdownItem(),
                        _dropdownItem(context, 'Degree / Diploma Engineering'),
                        _dropdownItem(context, 'Engineering Projects'),
                        _dropdownItem(
                          context,
                          'Spoken English (With Certification)',
                        ),
                        _dropdownItem(context, 'IELTS Coaching'),
                        _dropdownItem(
                          context,
                          'Computer Training (With Certification)',
                        ),
                        _dropdownItem(
                          context,
                          'AutoCAD, PCB Designing Courses (With Certification)',
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

  Widget _dropdownItem(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Selected: $title')));
        _removeDropdown();
      },
      hoverColor: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget _abacusDropdownItem() {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHoveringAbacus = true);
        _showAbacusDropdown();
      },
      onExit: (_) {
        setState(() => _isHoveringAbacus = false);
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!_isHoveringAbacus && !_isInAbacusSubmenu)
            _removeAbacusDropdown();
        });
      },
      child: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                'ABACUS (Whole Brain Development Program)',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Icon(Icons.arrow_right, color: Colors.black),
          ],
        ),
      ),
    );
  }

  void _showAbacusDropdown() {
    final RenderBox renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _abacusOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: position.dx + 330,
          top: position.dy + 95,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isInAbacusSubmenu = true),
            onExit: (_) {
              setState(() => _isInAbacusSubmenu = false);
              Future.delayed(const Duration(milliseconds: 300), () {
                if (!_isHoveringAbacus && !_isInAbacusSubmenu)
                  _removeAbacusDropdown();
              });
            },
            child: Material(
              elevation: 4,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _submenuItem('What is ABACUS'),
                  _submenuItem('History of ABACUS'),
                  _submenuItem('Team Details'),
                  _submenuItem('FAQ'),
                ],
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_abacusOverlay!);
  }

  Widget _submenuItem(String label) {
    return InkWell(
      onTap: () {
        _removeDropdown(); // ✅ Close everything before navigating

        // ✅ Navigate to the right page
        switch (label) {
          case 'What is ABACUS':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => WhatIsAbacusPage()),
            );
            break;
          case 'History of ABACUS':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryOfAbacusPage()),
            );
            break;
          case 'Team Details':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Teamdetail()),
            );
            break;
          case 'FAQ':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FAQPage()),
            );
            break;
          default:
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Selected: $label')));
        }
      },
      hoverColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    _removeAbacusDropdown();
    setState(() => _isHoveringCourses = false);
  }

  void _removeAbacusDropdown() {
    _abacusOverlay?.remove();
    _abacusOverlay = null;
    setState(() => _isHoveringAbacus = false);
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
              onExit: (_) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (!_isHoveringAbacus && !_isInAbacusSubmenu)
                    _removeDropdown();
                });
              },
              child: Container(
                key: _dropdownKey, // <<== Correctly place it here
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

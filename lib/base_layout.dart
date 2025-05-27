import 'package:eduwebsite/widgets/booking_button.dart';
import 'package:flutter/material.dart';
import 'package:eduwebsite/widgets/app_bar_widget.dart';
import 'package:eduwebsite/widgets/footer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;

  const BaseLayout({super.key, required this.child});

  void _openWhatsAppChat() async {
    final whatsappUrl = Uri.parse('https://wa.me/8866114453');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $whatsappUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarWidget(onBookVisitTap: () {}),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            child,
            const ContactCard(), // <-- Reusable component added here
            const SizedBox(height: 40),
            const Footer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF25D366),
        onPressed: _openWhatsAppChat,
        icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
        label: const Text(
          'How can I help you?',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

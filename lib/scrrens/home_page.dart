import 'package:eduwebsite/widgets/academic_cards.dart';
import 'package:eduwebsite/widgets/aim_vision.dart';
import 'package:eduwebsite/widgets/app_bar_widget.dart';
import 'package:eduwebsite/widgets/features_section.dart';
import 'package:eduwebsite/widgets/footer.dart';
import 'package:eduwebsite/widgets/gallery_section.dart';
import 'package:eduwebsite/widgets/quotes_widget.dart';
import 'package:eduwebsite/widgets/review_section.dart';
import 'package:eduwebsite/widgets/teaching_method.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBookVisitForm = false;

  void toggleBookVisitForm() {
    setState(() {
      showBookVisitForm = !showBookVisitForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarWidget(onBookVisitTap: toggleBookVisitForm),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 10 : 30,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                QuotesWidget(),
                SizedBox(height: 30),
                AimVision(),
                SizedBox(height: 30),
                AcademicCards(),
                SizedBox(height: 30),
                FeaturesSection(),
                SizedBox(height: 30),
                GallerySection(),
                SizedBox(height: 30),
                TeachingMethod(),
                SizedBox(height: 30),
                ReviewsSection(),
                SizedBox(height: 50),
                Footer(),
              ],
            ),
          ),

          // Overlay Book Visit Form
          if (showBookVisitForm)
            Positioned.fill(
              child: GestureDetector(
                onTap: toggleBookVisitForm,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: BookVisitForm(onClose: toggleBookVisitForm),
                ),
              ),
            ),
        ],
      ),

      // WhatsApp FAB
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {
          final whatsappUrl = Uri.parse('https://wa.me/8866114453');
          launchUrl(whatsappUrl);
        },
        icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
        label: const Text(
          'How can I help you?',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Example Responsive Modal
class BookVisitForm extends StatelessWidget {
  final VoidCallback onClose;

  const BookVisitForm({required this.onClose, super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: isMobile ? double.infinity : 400,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Book a Visit",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Name")),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onClose,
              child: const Text("Submit & Close"),
            ),
          ],
        ),
      ),
    );
  }
}

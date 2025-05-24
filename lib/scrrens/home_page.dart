// ignore_for_file: unused_local_variable

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
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

// Example Responsive Modal
class BookVisitForm extends StatefulWidget {
  final VoidCallback onClose;

  const BookVisitForm({required this.onClose, super.key});

  @override
  State<BookVisitForm> createState() => _BookVisitFormState();
}

class _BookVisitFormState extends State<BookVisitForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _mobileController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse(
        'https://mail.google.com/mail/u/0/?tab=rm&ogbl',
      ); // Replace
      final response = await launchUrl(
        Uri.parse(
          'mailto:YOUR_EMAIL?subject=New Visit&body=Name: ${_nameController.text}\nSchool: ${_schoolController.text}\nMobile: ${_mobileController.text}',
        ),
      );
      widget.onClose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: isMobile ? double.infinity : 1000,
          height: isMobile ? null : 500,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child:
              isMobile
                  ? _buildVerticalLayout(context)
                  : _buildHorizontalLayout(context),
        ),
      ),
    );
  }

  Widget _buildVerticalLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _formSection(context),
          const SizedBox(height: 20),
          _imageSection(),
        ],
      ),
    );
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _formSection(context)),
        const SizedBox(width: 20),
        Expanded(child: _imageSection()),
      ],
    );
  }

  Widget _formSection(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Unlock your Academic\nGoals with us',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Enter Your Name',
              border: OutlineInputBorder(),
            ),
            validator:
                (value) => value!.isEmpty ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _schoolController,
            decoration: const InputDecoration(
              hintText: 'Enter Your School & Standard',
              border: OutlineInputBorder(),
            ),
            validator:
                (value) =>
                    value!.isEmpty ? 'Please enter school and standard' : null,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _mobileController,
            decoration: const InputDecoration(
              hintText: 'Enter your Mobile Number',
              border: OutlineInputBorder(),
            ),
            validator:
                (value) =>
                    value!.isEmpty ? 'Please enter your mobile number' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            icon: const Icon(Icons.send, color: Colors.white),
            label: const Text(
              'Send Your Message',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/LOGO.jpg', // Make sure this is added
        fit: BoxFit.cover,
      ),
    );
  }
}

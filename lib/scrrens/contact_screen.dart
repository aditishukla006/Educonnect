import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eduwebsite/base_layout.dart';
import 'package:http/http.dart' as http;

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void _openMapLocation() async {
    const url = 'https://maps.app.goo.gl/fWjAXe8HCoVT6jqX8';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _callNumber(String number) async {
    final uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                  ),
                ),
                const SizedBox(height: 30),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 700;
                    return Flex(
                      direction: isWide ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _InfoTile(
                                icon: Icons.phone,
                                title: 'Call Us',
                                content:
                                    '+91 88661 14453\nDharmik Maheta (Managing Director)',
                                onTap: () => _callNumber('+91 88661 14453'),
                              ),
                              const SizedBox(height: 20),
                              _InfoTile(
                                icon: Icons.location_on,
                                title: 'Our Location',
                                content:
                                    'Raghukul Society, B/3/36, near Shahibaug Flyover,\nopp. Railway Crossing, Jain Colony, Shahibag,\nAhmedabad, Gujarat 380004',
                                onTap: _openMapLocation,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40, height: 40),
                        const Expanded(flex: 1, child: _ContactForm()),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final VoidCallback? onTap;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: Colors.indigo),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(content, style: GoogleFonts.poppins(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String message = '';

  static const String serviceId = 'service_6d51x7b';
  static const String templateId = 'template_q5f587b';
  static const String userId = 'UZm4-_eVnlP6BeM5o';

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final headers = {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      };
      final body = json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
          'email': email,
          'phone': phone,
          'message': message,
        },
      });

      try {
        final response = await http.post(url, headers: headers, body: body);
        debugPrint('EmailJS Response: ${response.statusCode} ${response.body}');

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')),
          );
          _formKey.currentState?.reset();
          setState(() {
            name = '';
            email = '';
            phone = '';
            message = '';
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to send message. Try again.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required void Function(String?) onSaved,
    required String? Function(String?) validator,
    int? maxLines,
  }) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      minLines: maxLines != null && maxLines > 1 ? 5 : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            label: 'Full Name',
            icon: Icons.person,
            onSaved: (val) => name = val ?? '',
            validator: (val) => val == null || val.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Email',
            icon: Icons.email,
            onSaved: (val) => email = val ?? '',
            validator:
                (val) =>
                    val != null && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)
                        ? null
                        : 'Enter valid email',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Phone',
            icon: Icons.phone,
            onSaved: (val) => phone = val ?? '',
            validator: (val) => val == null || val.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Message',
            icon: Icons.message,
            onSaved: (val) => message = val ?? '',
            validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            maxLines: 8,
          ),

          // Add the contact card here inside the form if you want to show it here
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Send',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

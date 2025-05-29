import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CareerScreen extends StatelessWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Career Opportunities',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                JobCard(
                  icon: Icons.science,
                  title: 'Chemistry Teacher',
                  description:
                      'Qualification: Diploma/Graduate/Post Graduate in Chemistry\n'
                      'Experience: 1–2 years of teaching in School/College/Coaching\n'
                      'Job Profile: Teach Chemistry to 11-12 Science students including JEE/GUJCET. Freshers with passion can apply.',
                  experience:
                      'Experience: 1–2 years (Freshers with passion can apply)',
                ),
                JobCard(
                  icon: Icons.calculate,
                  title: 'Maths Teacher (11-12 Science)',
                  description:
                      'Qualification: Diploma/Graduate/Post Graduate in Mathematics or Engineering\n'
                      'Experience: 1–2 years in School/College/Coaching\n'
                      'Job Profile: Teach Mathematics to 11-12 Science students including JEE/GUJCET. Freshers with passion can apply.',
                  experience:
                      'Experience: 1–2 years (Freshers with passion can apply)',
                ),
                JobCard(
                  icon: Icons.bar_chart,
                  title: 'Accounts & Statistics Teacher (11-12 Commerce)',
                  description:
                      'Qualification: B.Com/M.Com/CA/MBA in Finance/Final Year Students\n'
                      'Experience: 1–2 years in School/College/Coaching\n'
                      'Job Profile: Teach Accounts & Statistics to 11-12 Commerce students. Freshers with passion can apply.',
                  experience:
                      'Experience: 1–2 years (Freshers with passion can apply)',
                ),
                JobCard(
                  icon: Icons.business_center,
                  title: 'Business Development Manager',
                  description:
                      'Qualification: Any Graduate/Post Graduate (Preferably BBA/MBA),Final Year Students\n'
                      'Experience: 1–2 years in business development (Freshers can apply)\n'
                      'Skills: Business acumen, strong communication, marketing, MS Office, digital marketing, social media, strategic thinking,educational marketing',
                  experience: 'Experience: 1–2 years (Freshers can also apply)',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String experience;

  const JobCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.experience,
  });

  Future<void> _openGoogleForm(BuildContext context) async {
    final Uri url = Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLScUdjED1nNRVbbBhkpNuoK9TtE3VuZ5L2iKBput5BMP4hEG8Q/viewform?usp=header',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open the form')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.indigo, size: 28),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(description, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 12),
          Text(
            experience,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _openGoogleForm(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.indigo,
                side: const BorderSide(color: Colors.indigo),
              ),
              child: const Text('Contact Us'),
            ),
          ),
        ],
      ),
    );
  }
}

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
                  title: 'Chemistry Teacher',
                  description:
                      'Teach 11th and 12th Science students. Strong subject knowledge and experience in handling board syllabus preferred.',
                  experience:
                      'Minimum 2 years of teaching experience required.',
                ),
                JobCard(
                  title: 'Maths Teacher (11-12 Science)',
                  description:
                      'Passionate educator needed for Higher Secondary Maths. Prior experience with Science students is a plus.',
                  experience: 'At least 3 years of experience teaching Maths.',
                ),
                JobCard(
                  title: 'Accounts & Statistics Teacher (11-12 Commerce)',
                  description:
                      'Expertise in Accounts and Statistics for Commerce students. Ability to simplify concepts is a must.',
                  experience:
                      '2–4 years of relevant teaching experience preferred.',
                ),
                JobCard(
                  title: 'Business Development Manager',
                  description:
                      'Dynamic individual responsible for outreach, student admissions, partnerships, and marketing strategies.',
                  experience:
                      'Minimum 5 years in education sales or marketing.',
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
  final String title;
  final String description;
  final String experience;

  const JobCard({
    super.key,
    required this.title,
    required this.description,
    required this.experience,
  });

  Future<void> _openGoogleForm(BuildContext context) async {
    final Uri url = Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLScUdjED1nNRVbbBhkpNuoK9TtE3VuZ5L2iKBput5BMP4hEG8Q/viewform?usp=header',
    ); // 🔁 Replace this

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
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 8),
          Text(description),
          const SizedBox(height: 8),
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

import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            return isMobile ? _buildMobileLayout() : _buildDesktopLayout();
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: _TeamCard(
            name: 'Dharmik Mehta',
            designation: 'Senior Abacus Instructor',
            description:
                'Dharmik Mehta has over 12 years of experience teaching abacus to students across various age groups. He specializes in visual memory training and speed calculation, helping students enhance their concentration and arithmetic skills.',
            experience: '12 Years',
            experienceAt: 'Navkar Education Institute',
            email: 'dharmik.navkar@gmail.com',
            mobile: '+91 98765 43210',
            imagePath: 'assets/images/dharmik.png',
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: _TeamCard(
            name: 'Pooja Mehta',
            designation: 'Academic Coordinator',
            description:
                'Pooja Mehta coordinates all academic activities at Navkar. With a background in education management, she ensures smooth communication between instructors and parents, helping maintain quality standards in all our programs.',
            experience: '8 Years',
            experienceAt: 'Navkar Education Institute',
            email: 'pooja.navkar@gmail.com',
            mobile: '+91 91234 56789',
            imagePath: 'assets/images/pooja.png',
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: const [
        _TeamCard(
          name: 'Dharmik Mehta',
          designation: 'Senior Abacus Instructor',
          description:
              'Dharmik Mehta has over 12 years of experience teaching abacus to students across various age groups. He specializes in visual memory training and speed calculation, helping students enhance their concentration and arithmetic skills.',
          experience: '12 Years',
          experienceAt: 'Navkar Education Institute',
          email: 'dharmik.navkar@gmail.com',
          mobile: '+91 98765 43210',
          imagePath: 'assets/images/dharmik.png',
        ),
        SizedBox(height: 24),
        _TeamCard(
          name: 'Pooja Mehta',
          designation: 'Academic Coordinator',
          description:
              'Pooja Mehta coordinates all academic activities at Navkar. With a background in education management, she ensures smooth communication between instructors and parents, helping maintain quality standards in all our programs.',
          experience: '8 Years',
          experienceAt: 'Navkar Education Institute',
          email: 'pooja.navkar@gmail.com',
          mobile: '+91 91234 56789',
          imagePath: 'assets/images/pooja.png',
        ),
      ],
    );
  }
}

class _TeamCard extends StatelessWidget {
  final String name;
  final String designation;
  final String description;
  final String experience;
  final String experienceAt;
  final String email;
  final String mobile;
  final String imagePath;

  const _TeamCard({
    required this.name,
    required this.designation,
    required this.description,
    required this.experience,
    required this.experienceAt,
    required this.email,
    required this.mobile,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            designation,
            style: const TextStyle(fontSize: 18, color: Colors.purple),
          ),
          const SizedBox(height: 16),
          Text(description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Experience: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: experience),
              ],
            ),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Experience At: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: experienceAt),
              ],
            ),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: email),
              ],
            ),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Mobile: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: mobile),
              ],
            ),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

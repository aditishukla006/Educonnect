import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eduwebsite/base_layout.dart';

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
            return isMobile
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context);
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _TeamCard(
                name: 'Dharmik Mehta',
                designation: 'Managing Director',
                description:
                    'Dharmik Mehta is the Managing Director at Navkar Education and a Maths expert with over 15 years of experience. With a strong background in Mathematics, Physics, English Grammar, and Engineering coaching, he is dedicated to helping students excel in academics and engineering projects.',
                experience: '15+ Years',
                AreaofInterest:
                    'Mathematics, Physics, English Grammar, Engineering Projects, Engineering Coaching',
                email: 'dbmehta.30@gmail.com',
                mobile: '+91-8866114453',
                imagePath: 'assets/images/dharmik.png',
                education: 'B.Tech & M.Tech',
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _TeamCard(
                name: 'Pooja Mehta',
                designation: 'Academic Head & Career Counsellor',
                description:
                    'Pooja Mehta is the Centre Director for the ABACUS Whole Brain Development Program and serves as the Academic Head and Career Counsellor at Navkar Education. With over 10 years of experience, she specializes in ABACUS training along with subjects like History, Economics, English, Environment, Law, and Humanities.',
                experience: '10+ Years',
                AreaofInterest:
                    'ABACUS (Whole Brain Development Program), History, Economics, English, Environment, Law, Humanities & Social Science ',
                email: 'pooja.mehta3001@gmail.com',
                mobile: '+91-8160549426',
                imagePath: 'assets/images/pooja.png',
                education: 'B.Com, CS',
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _TeamCard(
          name: 'Dharmik Mehta',
          designation: 'Managing Director',
          description:
              'Dharmik Mehta is the Managing Director at Navkar Education and a Maths expert with over 15 years of experience. With a strong background in Mathematics, Physics, English Grammar, and Engineering coaching, he is dedicated to helping students excel in academics and engineering projects.',
          experience: '15+ Years',
          AreaofInterest:
              'Mathematics, Physics, English Grammar, Engineering Projects, Engineering Coaching',
          email: 'dbmehta.30@gmail.com',
          mobile: '+91-8866114453',
          imagePath: 'assets/images/dharmik.png',
          education: 'B.Tech & M.Tech',
        ),
        const SizedBox(height: 24),
        _TeamCard(
          name: 'Pooja Mehta',
          designation: 'Academic Head & Career Counsellor',
          description:
              'Pooja Mehta is the Centre Director for the ABACUS Whole Brain Development Program and serves as the Academic Head and Career Counsellor at Navkar Education. With over 10 years of experience, she specializes in ABACUS training along with subjects like History, Economics, English, Environment, Law, and Humanities.',
          experience: '10+ Years',
          AreaofInterest:
              'ABACUS (Whole Brain Development Program), History, Economics, English, Environment, Law, Humanities & Social Science ',
          email: 'pooja.mehta3001@gmail.com',
          mobile: '+91-8160549426',
          imagePath: 'assets/images/pooja.png',
          education: 'B.Com, CS',
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _TeamCard extends StatelessWidget {
  final String name;
  final String designation;
  final String description;
  final String experience;
  final String AreaofInterest;
  final String education;

  final String email;
  final String mobile;
  final String imagePath;

  const _TeamCard({
    required this.name,
    required this.designation,
    required this.description,
    required this.experience,
    required this.AreaofInterest,
    required this.email,
    required this.mobile,
    required this.imagePath,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 24),
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
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            designation,
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.purple),
          ),
          const SizedBox(height: 16),
          Text(description, style: GoogleFonts.poppins(fontSize: 16)),
          const SizedBox(height: 16),
          _buildInfoRow('Experience:', experience),
          _buildInfoRow('Experience At:', AreaofInterest),
          _buildInfoRow('Email:', email),
          _buildInfoRow('Mobile:', mobile),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

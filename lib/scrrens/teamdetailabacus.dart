import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';

class Teamdetail extends StatelessWidget {
  const Teamdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OUR TEAM',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Meet the passionate educator behind Navkar Education.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // --- Single Team Member Card ---
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Profile Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/class1.jpeg', // Replace with actual image
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),

                    // Text Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mrs. pooja Mehta',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Founder & Abacus Trainer',
                            style: TextStyle(
                              color: Colors.indigo.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Pooja Mehta is the Centre Director for the ABACUS Whole Brain Development Program and serves as the Academic Head and Career Counsellor at Navkar Education. With over 10 years of experience, she specializes in ABACUS training along with subjects like History, Economics, English, Environment, Law, and Humanities.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:eduwebsite/base_layout.dart';
import 'package:eduwebsite/scrrens/contact_screen.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:animated_widgets/animated_widgets.dart';
import 'package:animate_do/animate_do.dart';

class HistoryOfAbacusPage extends StatefulWidget {
  const HistoryOfAbacusPage({super.key});

  @override
  State<HistoryOfAbacusPage> createState() => _HistoryOfAbacusPageState();
}

class _HistoryOfAbacusPageState extends State<HistoryOfAbacusPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Top Image Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/activity3.jpeg',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 24),

            // 🔹 Animated Title
            FadeIn(
              duration: const Duration(milliseconds: 800),
              child: Text(
                'ITS JOURNEY FROM A MANUAL CALCULATOR TO A BRAIN DEVELOPMENT TOOL',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade700,
                ),
              ),
            ),
            const SizedBox(height: 10),

            FadeIn(
              duration: const Duration(milliseconds: 1000),
              child: Text(
                'HISTORY OF ABACUS',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            FadeIn(
              duration: const Duration(milliseconds: 1200),
              child: const Text(
                'If we were to understand the modern Abacus, we have to understand the history of Abacus, its journey from a manual calculator to a brain development tool. '
                'The word Abacus comes from a Greek word ‘abax’ or ‘abakon’ meaning ‘tabular form’, possibly derived from a Semitic word ‘abq’ or ‘sand’. '
                'It is the most primitive form of calculating or counting device. The Abacus origin is not exactly established. It probably was invented somewhere between 300 and 500 BC.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 32),

            // 🔹 Contact Us Section
            FadeIn(
              duration: const Duration(milliseconds: 1300),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Example: Navigate to ContactPage (create it if needed)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.contact_mail),
                  label: const Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 10),

            FadeIn(
              duration: const Duration(milliseconds: 1400),
              child: const Text(
                'Welcome to Navkar Education\n\n'
                'The ancient Abacus calculating devices or the Abacus Calculators have traveled a long way and have transitioned in the process of travel through different countries. '
                'The study of the history of Abacus indicates that Suanpan, the Chinese abacus, had 2/5 decks, but due to its complexity was replaced by Soroban abacus, a Japanese abacus, '
                'that was modified by a famous mathematician Seki Kowa. He removed one bead each from upper and lower decks to make it 1/4 decks, i.e., the abacus we use today, the Soroban abacus. '
                'This revolutionized Abacus Math as it did help count large numbers.\n\n'
                'It gained popularity with the whole World competing on a common platform after Globalization. It had an impact on the education system of different nations. '
                'Today no one asks the question, ‘what is an Abacus?’\n\n'
                'Although Abacus is a simple counting tool, it enhances the overall comprehension of Math and boosts better and faster calculation skills and improves problem-solving abilities. '
                'It would be easy to say abacus training has become an essential element of learning Mental Math.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 40),

            const Divider(thickness: 2),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';
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
              child: Image.asset('assets/images/abacus_banner.jpg'),
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
              child: Text(
                'Contact Us',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade700,
                ),
              ),
            ),
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

            // 🔹 CTA Section
            FadeIn(
              duration: const Duration(milliseconds: 1500),
              child: Text(
                'Navkar Education',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 10),

            FadeIn(
              duration: const Duration(milliseconds: 1600),
              child: const Text(
                'Join Navkar Education for expert Abacus training, where young minds grow through fun, focus, and calculation mastery. '
                'Our experienced faculty and child-centric methods ensure every student gets a strong foundation in mental math and holistic development.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),

            ScaleAnimatedWidget.tween(
              duration: const Duration(milliseconds: 800),
              scaleDisabled: 1.0,
              scaleEnabled: 1.05,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo.shade100),
                ),
                child: Row(
                  children: [
                    Icon(Icons.school, size: 48, color: Colors.indigo.shade700),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Enroll Today!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Give your child the gift of speed, accuracy, and confidence in math with Navkar’s Abacus program.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';

class HistoryOfAbacusPage extends StatelessWidget {
  const HistoryOfAbacusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ITS JOURNEY FROM A MANUAL CALCULATOR TO A BRAIN DEVELOPMENT TOOL',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'HISTORY OF ABACUS',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'If we were to understand the modern Abacus, we have to understand the history of Abacus, '
              'its journey from a manual calculator to a brain development tool. The word Abacus comes from a Greek word '
              '‘abax’ or ‘abakon’ meaning ‘tabular form’, possibly derived from a Semitic word ‘abq’ or ‘sand’. It is the most '
              'primitive form of calculating or counting device. The Abacus origin is not exactly established. It probably '
              'was invented somewhere between 300 and 500 BC.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              'Contact Us',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome to Shree Brains Creativity\n\n'
              'The ancient Abacus calculating devices or the Abacus Calculators have traveled a long way and have transitioned '
              'in the process of travel through different countries. The study of the history of Abacus indicates that Suanpan the '
              'Chinese abacus had 2/5 decks, but due to its complexity was replaced by Soroban abacus, a Japanese abacus, that was '
              'modified by a famous mathematician Seki Kowa. He removed one bead each from upper and lower decks to make it 1/4 decks, '
              'i.e., the abacus we use today, the Soroban abacus, this revolutionized Abacus Math as it did help count large numbers.\n\n'
              'It gained popularity with the whole World competing on a common platform after Globalization. It had an impact on the '
              'education system of different nations. Today no one asks the question, ‘what is an Abacus?’\n\n'
              'Although Abacus is a simple counting tool it enhances the overall comprehension of Math and Boosts better and faster '
              'calculation skills and improves problem-solving abilities. It would be easy to say abacus training become an essential '
              'element of learning Mental Math.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            Divider(thickness: 2),
            const SizedBox(height: 20),
            Text(
              'Navkar Education',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Join Navkar Education for expert Abacus training, where young minds grow through fun, focus, and calculation mastery. '
              'Our experienced faculty and child-centric methods ensure every student gets a strong foundation in mental math and holistic development.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Container(
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

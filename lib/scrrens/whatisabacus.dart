import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';

class WhatIsAbacusPage extends StatelessWidget {
  const WhatIsAbacusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'THE GATEWAY TO MENTAL MATH MASTERY',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'WHAT IS ABACUS?',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // NEW ROW WITH IMAGE AND TEXT
            LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 700;
                return isMobile
                    ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/activity3.jpeg', // <-- Add your image in assets folder
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'The abacus, a time-honored tool for calculation, is traditionally made up of a rectangular frame containing several rods, each lined with beads. '
                          'These beads are slid along the rods to represent numbers and facilitate various arithmetic operations. In modern times, the abacus has found a new role '
                          'as a tool for enhancing brain development in children. It has been particularly effective in improving mental math skills, capturing worldwide attention '
                          'for its remarkable benefits in this area.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                    : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/class1.jpeg', // <-- Make sure to add this asset
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'The abacus, a time-honored tool for calculation, is traditionally made up of a rectangular frame containing several rods, each lined with beads. '
                            'These beads are slid along the rods to represent numbers and facilitate various arithmetic operations. In modern times, the abacus has found a new role '
                            'as a tool for enhancing brain development in children. It has been particularly effective in improving mental math skills, capturing worldwide attention '
                            'for its remarkable benefits in this area.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    );
              },
            ),

            const SizedBox(height: 30),
            Text(
              'Abacus: A Brain-Boosting System',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Recognized globally as a ‘Holistic Brain Development System,’ the abacus is more than just a counting tool. It’s a brain enhancer! Kids using the abacus demonstrate '
              'amazing mental math abilities, dazzling everyone with their speed and accuracy. Research shows that children aged 5 to 14 benefit the most from abacus training.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              'How Does the Abacus Work?',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ever wondered how this simple tool can be so powerful in math? The abacus makes all arithmetic calculations like addition, subtraction, multiplication, and division a breeze. '
              'But there’s more – it’s also adept at handling decimal calculations and negative numbers. The secret lies in moving its beads up and down. Each bead’s position represents a '
              'specific value, and by skillfully manipulating them, you can perform complex calculations with ease and speed. It’s not just a tool; it’s a brain exercise that enhances your numerical agility.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              'The Power of Learning Abacus',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dr. Toshio Hayashi, a renowned brain development expert, believes starting abacus learning early is key to activating a child’s brain. '
              'When kids use an abacus, they engage both hands, sparking activity in various brain regions. This leads to enhanced whole-brain functioning and a sharper intellect.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              'Benefits of Abacus Training',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Boosts visualization and imagination.\n'
              '• Sharpens focus and concentration.\n'
              '• Encourages logical thinking and problem-solving.\n'
              '• Enhances memory and recall abilities.\n\n'
              'Studies confirm that kids who learn abacus outperform their peers in academics, showcasing superior cognitive skills. With these benefits, abacus learners scored higher than non-abacus learners. '
              'They show overall improved performance in their academics.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              'What is Mental Math?',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mental Math is the ability to solve a mathematical sum with speed and accuracy without the help of any tools like a calculator or computer. '
              'The Abacus Training develops the ability to visualize the abacus tool and move the beads logically on it. Students recall the final bead position due to their photographic memory '
              'and solve the sums mentally. When a student trained in Abacus exhibits their mental mathematical skills, the child is said to be doing Abacus Mental Maths.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

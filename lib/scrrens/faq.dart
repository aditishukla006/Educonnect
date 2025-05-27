import 'package:eduwebsite/base_layout.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FREQUENTLY ASKED QUESTIONS',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Get answers to common questions about Abacus and our learning platform.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // FAQ Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ExpansionPanelList.radio(
                  expandedHeaderPadding: EdgeInsets.zero,
                  children: [
                    ExpansionPanelRadio(
                      value: 'q1',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text(
                            'What is an Abacus and What are the benefits of learning abacus?',
                          ),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Abacus is an ancient calculating device invented for higher calculations before calculators existed. '
                          'Originally used for counting with fingers, it evolved into a tool using beads. Today, Abacus learning '
                          'enhances mental math skills and overall brain development by activating both the logical and creative hemispheres '
                          'of a child\'s brain, improving memory, concentration, listening, and academic performance.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q2',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text('How to use an Abacus?'),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'An abacus is a frame with rods and beads where each bead has a value. Calculations are performed by moving the beads using specific formulas. '
                          'It is used for addition, subtraction, multiplication, and division. Over time, it has become a brain development tool rather than just a calculator.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q3',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text(
                            'What is Abacus Mental Math and how will it help my child?',
                          ),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Abacus Mental Math refers to the mental visualization of abacus to perform calculations. '
                          'Children who complete abacus courses can do long calculations mentally at great speed. It improves both sides of the brain, leading to better concentration, memory, listening skills, and academic performance across all subjects.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q4',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text('How to teach Abacus to kids at home?'),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Previously, teaching abacus at home was difficult. With the Mastermind Abacus E-learning platform, '
                          'kids can learn through an interactive portal that integrates video conferencing and fun game exercises, eliminating the need for printed workbooks. '
                          'It provides online exams, digital homework, and classwork, making learning engaging and effective.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q5',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text(
                            'What is your Online E-Learning platform like?',
                          ),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'The Mastermind Abacus E-Learning platform is a unique online program combining live video conferencing with high-quality content videos. '
                          'It offers game-based practice without needing printed books and uses a virtual abacus to enhance learning. This makes the online experience as effective as live classes.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q6',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text('Do you take physical classes also?'),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Yes. We offer both physical and online abacus classes. Physical classes are available at 2000+ franchise centers, '
                          'while online learning is accessible from home through our E-learning platform. Students can choose the mode that suits them best.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q7',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text(
                            'How many classes are conducted in a week and how many levels are there in your Program?',
                          ),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'The complete Mastermind Abacus program consists of 8 levels. Classes are held once a week for 2 hours. '
                          'Each level takes 3 months to complete, making the total program duration 2 years.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q8',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text(
                            'How will I be able to help my child in his/her practice?',
                          ),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'We upload practice sheets in the student\'s portal for download and printing. A Parent’s Handbook is provided to help guide children at home. '
                          'Additionally, trainers are available for any support parents may need during practice.',
                        ),
                      ),
                    ),
                    ExpansionPanelRadio(
                      value: 'q9',
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          title: Text(
                            'Do you conduct International, National, and State Level Competitions?',
                          ),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Yes, we conduct Center, State, National, and International level competitions both online and offline. '
                          'Students must be enrolled through Mastermind Abacus Centers to participate. Photos of past competitions are available in our gallery.',
                        ),
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

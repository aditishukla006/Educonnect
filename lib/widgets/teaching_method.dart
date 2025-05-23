import 'package:flutter/material.dart';

class TeachingMethod extends StatelessWidget {
  const TeachingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    return Container(
      color: Colors.indigo.shade50,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        children: [
          const Text(
            'Our Teaching Methodology',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 20),

          // Responsive layout:
          isSmallScreen
              ? Column(
                children: const [
                  _MethodCard(
                    icon: Icons.group,
                    title: 'Interactive Learning',
                    description:
                        'Group discussions, activities, and engagement.',
                  ),
                  SizedBox(height: 20),
                  _MethodCard(
                    icon: Icons.auto_graph,
                    title: 'Progress Tracking',
                    description:
                        'Continuous monitoring of student performance.',
                  ),
                  SizedBox(height: 20),
                  _MethodCard(
                    icon: Icons.lightbulb,
                    title: 'Concept Clarity',
                    description: 'Focus on basics to build strong foundation.',
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _MethodCard(
                    icon: Icons.group,
                    title: 'Interactive Learning',
                    description:
                        'Group discussions, activities, and engagement.',
                  ),
                  _MethodCard(
                    icon: Icons.auto_graph,
                    title: 'Progress Tracking',
                    description:
                        'Continuous monitoring of student performance.',
                  ),
                  _MethodCard(
                    icon: Icons.lightbulb,
                    title: 'Concept Clarity',
                    description: 'Focus on basics to build strong foundation.',
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _MethodCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(icon, size: 50, color: Colors.orange.shade700),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  final List<_Feature> features = const [
    _Feature(
      icon: Icons.calendar_today,
      title: 'Since 2010',
      description: '15+ years of educational excellence.',
    ),
    _Feature(
      icon: Icons.school,
      title: 'Expert Teachers',
      description: 'Experienced & qualified faculty.',
    ),
    _Feature(
      icon: Icons.computer,
      title: 'Modern Methods',
      description: 'Technology integrated learning.',
    ),
    _Feature(
      icon: Icons.assignment,
      title: 'Weekly Assessment',
      description: 'Stay on track with regular tests.',
    ),
    _Feature(
      icon: Icons.thumb_up,
      title: 'Quality Education',
      description: 'Focused on overall growth.',
    ),
    _Feature(
      icon: Icons.emoji_events,
      title: '100% Results',
      description: 'Every year consistent success.',
    ),
    _Feature(
      icon: Icons.female,
      title: 'Special Girls Batch',
      description: 'Dedicated & supportive environment.',
    ),

    _Feature(
      icon: Icons.group,
      title: 'Smaller Batches',
      description: 'Better focus, better learning.',
    ),
    _Feature(
      icon: Icons.person_pin_circle,
      title: 'Personalized Attention',
      description: 'We care for every student.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double cardWidth;
    if (screenWidth < 400) {
      cardWidth = screenWidth * 0.8;
    } else if (screenWidth < 700) {
      cardWidth = 200;
    } else {
      cardWidth = 220;
    }

    return Container(
      color: Colors.indigo.shade50,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        children: [
          const Text(
            'Our Features',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 25),
          Wrap(
            spacing: 40,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children:
                features.map((f) {
                  return SizedBox(
                    width: cardWidth,
                    child: Column(
                      children: [
                        Icon(f.icon, size: 50, color: Colors.orange.shade700),
                        const SizedBox(height: 10),
                        Text(
                          f.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          f.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String description;

  const _Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

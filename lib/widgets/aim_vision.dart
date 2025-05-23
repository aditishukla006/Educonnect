import 'package:flutter/material.dart';

class AimVision extends StatelessWidget {
  const AimVision({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: isMobile ? 20 : 60,
          ),
          color: Colors.indigo.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Our Aim & Vision',
                style: TextStyle(
                  fontSize: isMobile ? 25 : 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              isMobile
                  ? Column(
                    children: [
                      _AimVisionCard(
                        title: 'Aim',
                        content:
                            'To provide quality education with innovative teaching methods.',
                        icon: Icons.flag,
                        color: Colors.orange.shade700,
                      ),
                      const SizedBox(height: 20),
                      _AimVisionCard(
                        title: 'Vision',
                        content:
                            'To empower students to reach their highest potential.',
                        icon: Icons.visibility,
                        color: Colors.indigo,
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _AimVisionCard(
                        title: 'Aim',
                        content:
                            'To provide quality education with innovative teaching methods.',
                        icon: Icons.flag,
                        color: Colors.orange.shade700,
                      ),
                      _AimVisionCard(
                        title: 'Vision',
                        content:
                            'To empower students to reach their highest potential.',
                        icon: Icons.visibility,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
            ],
          ),
        );
      },
    );
  }
}

class _AimVisionCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;

  const _AimVisionCard({
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth < 600 ? double.infinity : 280;

    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 5,
        shadowColor: color.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class AcademicCards extends StatefulWidget {
  const AcademicCards({super.key});

  @override
  State<AcademicCards> createState() => _AcademicCardsState();
}

class _AcademicCardsState extends State<AcademicCards> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  double _scrollOffset = 0;

  final List<_SubjectInfo> subjects = const [
    _SubjectInfo(
      title: 'Playgroup, Nursery,\nJr.KG & Sr.KG',
      icon: Icons.child_friendly,
      color: Colors.pink,
    ),
    _SubjectInfo(
      title: 'Std. 1 to 10 &\n11-12 (Com./Sci.)',
      icon: Icons.menu_book,
      color: Colors.blue,
    ),
    _SubjectInfo(
      title: 'ABACUS\n(Whole Brain Development)',
      icon: Icons.calculate,
      color: Colors.deepPurple,
    ),
    _SubjectInfo(
      title: 'Degree / Diploma\nEngineering',
      icon: Icons.engineering,
      color: Colors.green,
    ),
    _SubjectInfo(
      title: 'Engineering\nProjects',
      icon: Icons.build,
      color: Colors.orange,
    ),
    _SubjectInfo(
      title: 'Spoken English\n(With Certification)',
      icon: Icons.record_voice_over,
      color: Colors.indigo,
    ),
    _SubjectInfo(
      title: 'IELTS Coaching',
      icon: Icons.translate,
      color: Colors.cyan,
    ),
    _SubjectInfo(
      title: 'Computer Training\n(With Certification)',
      icon: Icons.computer,
      color: Colors.teal,
    ),
    _SubjectInfo(
      title: 'AutoCAD, PCB Designing\n(With Certification)',
      icon: Icons.design_services,
      color: Colors.brown,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_scrollController.hasClients) {
        _scrollOffset += 240; // approximate card width + spacing
        if (_scrollOffset > _scrollController.position.maxScrollExtent) {
          _scrollOffset = 0;
        }
        _scrollController.animateTo(
          _scrollOffset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          const Text(
            'Academic Programs(GSEB,CBSE,ICSC)',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 270,
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return _SubjectCard(info: subjects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SubjectInfo {
  final String title;
  final IconData icon;
  final Color color;

  const _SubjectInfo({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class _SubjectCard extends StatelessWidget {
  final _SubjectInfo info;

  const _SubjectCard({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: info.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: info.color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(info.icon, size: 50, color: info.color),
          const SizedBox(height: 12),
          Text(
            info.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: info.color,
            ),
          ),
        ],
      ),
    );
  }
}

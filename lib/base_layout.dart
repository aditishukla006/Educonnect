import 'package:flutter/material.dart';
import 'package:eduwebsite/widgets/app_bar_widget.dart';
import 'package:eduwebsite/widgets/footer.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;

  const BaseLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarWidget(onBookVisitTap: () {}),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            child, // Page content
            const SizedBox(height: 40),
            const Footer(), // Footer below content, visible only when scrolled down
          ],
        ),
      ),
    );
  }
}

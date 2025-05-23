import 'dart:async';
import 'package:flutter/material.dart';

class QuotesWidget extends StatefulWidget {
  const QuotesWidget({super.key});

  @override
  State<QuotesWidget> createState() => _QuotesWidgetState();
}

class _QuotesWidgetState extends State<QuotesWidget> {
  final List<String> imagePaths = [
    'assets/class1.jpeg',
    'assets/class2.jpeg',
    'assets/class3.jpeg',
    'assets/class4.jpeg',
  ];

  final List<String> textMessages = [
    "A Perfect\nBeginning With\nNAVKAR:\nEmpowering Young Minds\nThrough Quality Education",
    "Unlocking Knowledge\nThe NAVKAR Way:\nGuiding Every Student\nto Bright Success",
    "Learning with Values\nat NAVKAR:\nWhere Ethics and Excellence\nGo Hand in Hand",
    "NAVKAR Classes:\nWhere Each Child\nBegins Their Journey\nto Brilliance",
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % imagePaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Threshold for switching layout - adjust as needed
    final bool isSmallScreen = screenWidth < 800;

    return Container(
      color: Colors.indigo.shade50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child:
              isSmallScreen
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left animated text section
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        transitionBuilder:
                            (child, animation) => FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                        child: SizedBox(
                          key: ValueKey<String>(textMessages[_currentIndex]),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            key: ValueKey<String>(textMessages[_currentIndex]),
                            children: [
                              Text(
                                textMessages[_currentIndex],
                                style: const TextStyle(
                                  fontSize:
                                      28, // Slightly smaller font for smaller screens
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.indigo,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  // Action: navigate or show apply form
                                },
                                child: const Text(
                                  'APPLY NOW',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Right image section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Image.asset(
                            imagePaths[_currentIndex],
                            key: ValueKey<String>(imagePaths[_currentIndex]),
                            fit: BoxFit.cover,
                            height: 250, // Smaller height on small screens
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      // Left animated text section
                      Expanded(
                        flex: 5,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder:
                              (child, animation) => FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                          child: SizedBox(
                            key: ValueKey<String>(textMessages[_currentIndex]),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              key: ValueKey<String>(
                                textMessages[_currentIndex],
                              ),
                              children: [
                                Text(
                                  textMessages[_currentIndex],
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.indigo,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Action: navigate or show apply form
                                  },
                                  child: const Text(
                                    'APPLY NOW',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),

                      // Right image section
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Image.asset(
                              imagePaths[_currentIndex],
                              key: ValueKey<String>(imagePaths[_currentIndex]),
                              fit: BoxFit.cover,
                              height: 400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

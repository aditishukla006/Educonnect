import 'package:flutter/material.dart';
import '../base_layout.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> resultImages = [
    'assets/result1.jpeg',
    'assets/result2.jpeg',
    'assets/result3.jpeg',
    'assets/result4.jpeg',
    'assets/result5.jpeg',
    'assets/result6.jpeg',
  ];

  final List<String> activityImages = [
    'assets/activity1.jpeg',
    'assets/activity2.jpeg',
    'assets/activity3.jpeg',
    'assets/activity4.jpeg',
    'assets/activity5.jpeg',
    'assets/activity6.jpeg',
  ];

  int currentResultSet = 0; // 0 for first 3, 1 for next 3
  int currentActivitySet = 0;

  List<bool> _resultVisible = [false, false, false];
  List<bool> _activityVisible = [false, false, false];

  @override
  void initState() {
    super.initState();

    // Animate both sections
    _animateImages(_resultVisible);
    _animateImages(_activityVisible, delay: 1500);

    // Auto-switch both sets after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          currentResultSet = 1;
          _resultVisible = [false, false, false];
        });
        _animateImages(_resultVisible);
      }
    });

    Future.delayed(const Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          currentActivitySet = 1;
          _activityVisible = [false, false, false];
        });
        _animateImages(_activityVisible);
      }
    });
  }

  void _animateImages(List<bool> visibleList, {int delay = 0}) {
    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: delay + 400 * i), () {
        if (mounted) {
          setState(() {
            visibleList[i] = true;
          });
        }
      });
    }
  }

  Widget _buildImageGrid(List<String> images, List<bool> visibleFlags) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: List.generate(images.length, (index) {
        final imgPath = images[index];
        return AnimatedOpacity(
          opacity: visibleFlags[index] ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (_) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(imgPath, fit: BoxFit.contain),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                    ),
              );
            },
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(imgPath, fit: BoxFit.cover),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> visibleResultImages = resultImages.sublist(
      currentResultSet * 3,
      (currentResultSet + 1) * 3,
    );

    final List<String> visibleActivityImages = activityImages.sublist(
      currentActivitySet * 3,
      (currentActivitySet + 1) * 3,
    );

    return BaseLayout(
      child: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF8F6F4),
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Results and Achievements',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildImageGrid(visibleResultImages, _resultVisible),

              const SizedBox(height: 64),

              const Text(
                'Student Activities',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildImageGrid(visibleActivityImages, _activityVisible),
            ],
          ),
        ),
      ),
    );
  }
}

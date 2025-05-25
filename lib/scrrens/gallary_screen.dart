import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    'assets/activity7.jpeg',
    'assets/activity8.jpeg',
    'assets/activity9.jpeg',
    'assets/activity10.jpeg',
  ];

  final List<String> academicImages = [
    'assets/activity5.jpeg',
    'assets/activity8.jpeg',
    'assets/activity9.jpeg',
    'assets/activity1.jpeg',
    'assets/activity2.jpeg',
    'assets/activity3.jpeg',
  ];

  int currentResultSet = 0;
  int currentActivitySet = 0;
  int currentAcademicSet = 0;

  List<bool> _resultVisible = [false, false, false];
  List<bool> _activityVisible = [false, false, false];
  List<bool> _academicVisible = [false, false, false];

  @override
  void initState() {
    super.initState();

    _animateImages(_resultVisible);
    _animateImages(_activityVisible, delay: 1500);
    _animateImages(_academicVisible, delay: 3000);

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

    Future.delayed(const Duration(seconds: 11), () {
      if (mounted) {
        setState(() {
          currentAcademicSet = 1;
          _academicVisible = [false, false, false];
        });
        _animateImages(_academicVisible);
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

  Widget _buildContactCard(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Take the first step toward a brighter future by booking a visit with us. Discover our teaching approach, meet our expert faculty, and see how we can help you achieve your academic goals.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                height: 1.5,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.indigoAccent,
                ),
                onPressed: () {
                  // TODO: add booking logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking your visit...')),
                  );
                },
                child: Text(
                  'Book Visit',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid(List<String> images, List<bool> visibleFlags) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
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
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
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
    final visibleResultImages = resultImages.sublist(
      currentResultSet * 3,
      (currentResultSet + 1) * 3,
    );

    final visibleActivityImages = activityImages.sublist(
      currentActivitySet * 3,
      (currentActivitySet + 1) * 3,
    );

    final visibleAcademicImages = academicImages.sublist(
      currentAcademicSet * 3,
      (currentAcademicSet + 1) * 3,
    );

    return BaseLayout(
      child: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF8F6F4),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Results and Achievements',
                style: TextStyle(
                  fontSize: 34,
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
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildImageGrid(visibleActivityImages, _activityVisible),

              const SizedBox(height: 64),

              const Text(
                'Academic Activities',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildImageGrid(visibleAcademicImages, _academicVisible),
              const SizedBox(height: 32),
              _buildContactCard(context),
            ],
          ),
        ),
      ),
    );
  }
}

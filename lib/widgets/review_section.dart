import 'package:flutter/material.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final List<Map<String, String>> reviews = [
    {
      'text':
          'Grateful to navkar education for the amazing quality of education they provide. A special thanks to Dharmik sir and pooja mam for their excellent teaching methods, dedication, and clarity in explaining complex concepts. Their support and guidance have made learning not just easier but genuinely enjoyable.',
      'name': 'Anita Gondaliya',
    },
    {
      'text':
          'Navkar education is excellent coaching 👍👍. Sir and Mam is humble with student. There teaching method is so good that students understand easily👍👍',
      'name': 'Chaitali shah',
    },
    {
      'text':
          'The instructors are informed and provide straightforward explanations of ideas. If you have any questions, they are always willing to help.',
      'name': 'Krishna Kankotiya',
    },
    {
      'text':
          'Best place for tution. Sir and Mams teaching method is so good to understand to children.',
      'name': 'Govind Prajapati',
    },
    {
      'text':
          'The dedication and expertise of the faculty at Navkar Education are truly commendable. They have a deep understanding of their subjects and employ innovative teaching methods that make learning enjoyable and engaging for students.',
      'name': 'Navya Shah',
    },
    {
      'text':
          'Strongly recommended my son and daughter improving very well Sir and mam both are very kind, intelligent and personally care taker. must go..',
      'name': 'MITTAL PATEL',
    },
    {
      'text':
          'Great education with personal development..Sir n mam both very talented. Treat student like their son and daughter...we get good result afterwards navkar education coaching.',
      'name': 'Shah Soniyas',
    },
    {
      'text':
          'One Can Rely on Expertise of Mr Dharmik and Ms Pooja. As both are very humble with Students, understands weakness of student and put their personal efforts to overcome student from their weakness. Wish you all the best for future growth..😊😊👍👍',
      'name': 'Maulin Fadia',
    },
    {
      'text':
          'Having been a student at Navkar Education for the past two years, I have had the opportunity to experience firsthand the many strengths of this institution. The dedicated sir and maam have consistently provided engaging lessons and valuable support, fostering a conducive learning environment.Overall, my time at Navkar Education has been enriching, and I m grateful for the education and support Ive received here.',
      'name': 'Chavda Bhoomi',
    },
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _cycleReview);
  }

  void _cycleReview() {
    if (!mounted) return;
    setState(() {
      _currentIndex = (_currentIndex + 1) % reviews.length;
    });
    Future.delayed(const Duration(seconds: 3), _cycleReview);
  }

  @override
  Widget build(BuildContext context) {
    final currentReview = reviews[_currentIndex];

    return Container(
      color: Colors.orange.shade50,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Hear From Our Learners',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(_currentIndex),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.format_quote,
                    size: 30,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentReview['text']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: Colors.orange,
                    indent: 100,
                    endIndent: 100,
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentReview['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

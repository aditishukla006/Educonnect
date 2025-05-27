import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eduwebsite/base_layout.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  Widget _buildRowSection(
    String title,
    String description,
    String imageAssetPath, { // renamed parameter for clarity
    bool reverse = false,
  }) {
    final textWidget = Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment:
              reverse ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: reverse ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
              textAlign: reverse ? TextAlign.right : TextAlign.left,
            ),
          ],
        ),
      ),
    );

    final imageWidget = Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imageAssetPath, fit: BoxFit.cover),
          ),
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            children:
                reverse ? [imageWidget, textWidget] : [textWidget, imageWidget],
          );
        } else {
          return Row(
            children:
                reverse ? [imageWidget, textWidget] : [textWidget, imageWidget],
          );
        }
      },
    );
  }

  Widget _buildTextOnlySection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade900,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 16,
              height: 1.7,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      color: Colors.indigo.shade50,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCardsSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        final cards = [
          _buildInfoCard(
            'Our Vision',
            'To create a strong and enjoyable learning process using innovative methods and synchronized learning, ensuring a solid foundation for every child.',
          ),
          _buildInfoCard(
            'Our Mission',
            'To foster critical thinking, creativity, and responsibility by delivering value-based education that goes beyond the classroom.',
          ),
          _buildInfoCard(
            'Our Values',
            'Integrity, honesty, and transparency in all endeavors. Building trust and respect through strong relationships and commitment to excellence.',
          ),
        ];

        if (isMobile) {
          return Column(children: cards);
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                cards
                    .map(
                      (card) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: card,
                        ),
                      ),
                    )
                    .toList(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextOnlySection(
                  'Welcome to Navkar Education',
                  'At Navkar Education, we are committed to nurturing young minds from the very beginning through to their academic and career milestones. We offer high-quality tuition for students from Nursery to 12th grade in Science and Commerce streams, covering all boards—CBSE, ICSE, GSEB—and mediums including Gujarati, English, and Hindi. Our curriculum is supported by experienced faculty, personalized attention, and regular performance tracking. In addition to school education, we specialize in IELTS coaching, Abacus mental math training, and various computer and diploma courses, empowering students with both academic and practical skills. With a focus on discipline, concept clarity, and holistic growth, Navkar Education is your trusted partner in academic excellence and beyond.',
                ),

                // Cards in row or column
                _buildInfoCardsSection(),

                _buildRowSection(
                  'Discipline Induction Among Kids',
                  'We go beyond textbooks, focusing on cultivating discipline, responsibility, and strong work ethics.',
                  'assets/image1.jpeg',
                ),
                _buildRowSection(
                  'Quality Teaching Through Innovative Methods',
                  'Using dynamic methods, technology, and real-world applications to make learning engaging and deep.',
                  'assets/image2.jpeg',
                  reverse: true,
                ),
                _buildRowSection(
                  'Guaranteed Improved Results',
                  'Personalized attention and a rigorous curriculum ensure every student achieves their academic goals.',
                  'assets/image3.jpeg',
                ),
                _buildRowSection(
                  'Daily Attendance Updates',
                  'Real-time updates to parents about their child\'s presence to ensure involvement and discipline.',
                  'assets/image4.jpeg',
                  reverse: true,
                ),
                _buildRowSection(
                  'Limited Students Per Batch / Personal Attention',
                  'Ensuring individual care by keeping batch sizes small and offering tailored teaching.',
                  'assets/image5.jpeg',
                ),
                _buildRowSection(
                  'Nominal Tuition Fees',
                  'Affordable fees so quality education is accessible to all deserving students.',
                  'assets/image6.jpeg',
                  reverse: true,
                ),
                _buildRowSection(
                  'Individual Experts for Each Subject',
                  'Subject specialists ensure in-depth understanding and expert guidance in every domain.',
                  'assets/class1.jpeg',
                ),
                _buildRowSection(
                  'Micro Schedule Content-Based Learning',
                  'Detailed schedules that break content into small parts for better clarity and retention.',
                  'assets/class2.jpeg',
                  reverse: true,
                ),
                _buildRowSection(
                  'Focused Efforts on Concept Clearing',
                  'Emphasis on fundamental understanding, helping students confidently face future challenges.',
                  'assets/class3.jpeg',
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

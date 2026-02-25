import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          _buildStatsSection(),
          _buildWhyChooseSection(),
          _buildAboutUsSection(),
          _buildVisitUsSection(),
        ],
      ),
    );
  }

  // 1. HEADER AND HERO SECTION
  Widget _buildHeroSection(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://i.ibb.co/RGc7KMQZ/welcome.jpg',
          height: 384,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 384,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            );
          },
        ),
        Container(
          height: 384,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 384,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Gothami Junior School',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'A Popular & Beautiful School In Gampaha',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            DefaultTabController.of(context).animateTo(1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Explore Our School',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            DefaultTabController.of(context).animateTo(3);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey[800],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // KEY STATISTICS
  Widget _buildStatsSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard('3100+', 'Students'),
          _buildStatCard('99+', 'Teachers'),
          _buildStatCard('93', 'Years of\nExcellence'),
          _buildStatCard('?', 'Achievements'),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // 2. WHY CHOOSE SECTION
  Widget _buildWhyChooseSection() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Why Choose Gothami Junior School?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'We Provide Our Best Teachers For Teach Students.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _buildWhyChooseCard(
            icon: Icons.school,
            iconColor: Colors.blue,
            title: 'Academic Excellence',
            description:
            'Providing a strong foundation from Grade 1 to 11 with dedicated teachers and a balanced curriculum.',
          ),
          const SizedBox(height: 16),
          _buildWhyChooseCard(
            icon: Icons.people,
            iconColor: Colors.green,
            title: 'Strong Community',
            description:
            'Nurturing discipline, respect, and teamwork while creating a caring school environment.',
          ),
          const SizedBox(height: 16),
          _buildWhyChooseCard(
            icon: Icons.emoji_events,
            iconColor: Colors.orange,
            title: 'Achievements',
            description:
            'Recognized for student success in academics, cultural activities, and sports at zonal and provincial levels.',
          ),
        ],
      ),
    );
  }

  Widget _buildWhyChooseCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // 3. ABOUT US SECTION
  Widget _buildAboutUsSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'About Us',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '93 Years of Educational Excellence',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://i.ibb.co/qMYTzCFF/frame.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 80, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Since its founding in 1932, Gothami Kanishta Vidyalaya in Gampaha has been committed to providing strong foundational education to young pupils. Situated at 51 Vishaka Road, Gampaha, the school serves grades 1 through 11, offering primary and junior secondary education in a nurturing, disciplined environment.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Our goal is to help every child grow academically, socially, and morally. To that end, we blend traditional values with modern practices. Our dedicated staff focus on promoting good behavior, strong ethics, and a love for learning from the earliest grades.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Facilities are designed to support a safe and supportive learning environment. While it is a smaller junior school, it has proven itself among the top in the Gampaha area for its caring atmosphere and quality of foundational teaching.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to about page or show more info
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Learn More About Us',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. VISIT US / CONTACT DETAILS SECTION
  Widget _buildVisitUsSection() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Visit Us',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'We\'d love to welcome you to our school community',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _buildVisitCard(
            icon: Icons.location_on,
            iconColor: Colors.red,
            title: 'Location',
            children: const [
              Text(
                '51 Vishaka Rd',
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                'Gampaha, Sri Lanka',
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildVisitCard(
            icon: Icons.phone,
            iconColor: Colors.green,
            title: 'Phone',
            children: const [
              Text(
                '0332 222 207 (Office)',
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                '+94 71 404 9933  (Principal)',
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildVisitCard(
            icon: Icons.access_time,
            iconColor: Colors.blue,
            title: 'School Hours',
            children: const [
              Text(
                'Monday - Friday',
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                '8:30 AM - 2:30 PM',
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVisitCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: children.map((child) {
              return DefaultTextStyle(
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
                child: child,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
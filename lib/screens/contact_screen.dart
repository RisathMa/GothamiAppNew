import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Gothami School',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We\'d love to hear from you! Whether you have questions about admissions, want to learn more about our programs, or need assistance, we\'re here to help.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            _buildContactCard(
              icon: Icons.location_on,
              iconColor: Colors.blue[600]!,
              title: 'Address',
              children: const [
                Text('51 Vishaka Rd'),
                Text('Gampaha, Sri Lanka'),
                Text('Postal Code: 11000'),
              ],
            ),
            const SizedBox(height: 24),
            _buildContactCard(
              icon: Icons.phone,
              iconColor: Colors.green[600]!,
              title: 'Phone Numbers',
              children: const [
                Text('0332 222 207 (Main Office)'),
                Text('+94 71 404 9933 (Principal)'),
              ],
            ),

            const SizedBox(height: 24),
            _buildContactCard(
              icon: Icons.code,
              iconColor: Colors.red[600]!,
              title: 'Developers',
              children: const [
                Text('Risath Manvidu (Main Developer)'),
                Text('Pemidu Dissanayake (Assistant Developer)'),
                Text('Randil Perera (Assistant Developer)'),
                Text('Aken Dinsara (Assistant Developer)'),
                Text('Shaneth Hansaja (Assistant Developer)'),
                Text('K.D. Jayakody (Guidance)'),
                Text('Shehan Avishka (Guidance)'),
              ],
            ),
            const SizedBox(height: 24),
            _buildContactCard(
              icon: Icons.email,
              iconColor: Colors.purple[600]!,
              title: 'Email Address',
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'gmgothamikv@gmail.com ',
                        style: TextStyle(
                          color: Colors.blue[600],
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle email tap
                          },
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'risath@companyrm.lk',
                        style: TextStyle(
                          color: Colors.blue[600],
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle email tap
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
                .map(
                  (child) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  child: child,
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}

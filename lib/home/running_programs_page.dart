// Step 9: Update pages/program_schedule_page.dart
// Integrated the provided code.
// Improved design: Added more info rows.

import 'package:flutter/material.dart';

class ProgramSchedulePage extends StatelessWidget {
  const ProgramSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MONDAY'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Photografe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildInfoRow(Icons.calendar_today, '6.4 M - 1h 30m'),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.timer, '8 PM - 10 PM'),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.location_on, 'Central Park'), // Added extra info
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Join'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
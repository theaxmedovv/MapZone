// Step 6: Update pages/history_page.dart
// Integrated the provided code.
// Improved design: Added more history items, animations.

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '46,00',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Kilometer',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text('Run'),
                  ],
                ),
                Column(
                  children: [
                    Text('5.50', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text('Average Pace'),
                  ],
                ),
                Column(
                  children: [
                    Text('4:10:00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text('Time'),
                  ],
                ),
              ],
            ),
            const Divider(height: 40),
            const Text(
              'This Week',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildHistoryItem('01/01 Mon', '3,00 Km', '15:00', '4\'55"'),
                  _buildHistoryItem('02/01 Tue', '15,00 Km', '1:15:00', '5\'00"'),
                  _buildHistoryItem('03/01 Wed', '21,00 Km', '1:45:00', '5\'00"'),
                  _buildHistoryItem('04/01 Thu', '7,00 Km', '35:00', '5\'00"'),
                  _buildHistoryItem('05/01 Fri', '10,00 Km', '50:00', '5\'00"'), // Added extra item
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String date, String distance, String time, String pace) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: const Icon(Icons.run_circle_outlined, color: Colors.green),
          title: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: [
              Text(distance),
              const SizedBox(width: 10),
              Text(time),
            ],
          ),
          trailing: Text(pace, style: const TextStyle(color: Colors.green)),
        ),
      ),
    );
  }
}
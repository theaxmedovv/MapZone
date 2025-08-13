// Step 8: Update pages/running_program_detail_page.dart
// Integrated the provided code.
// Added navigation to ProgramSchedulePage when clicking on a day card.
// Improved design: Added more days if needed, but kept 7.

import 'package:flutter/material.dart';

class RunningProgramDetailPage extends StatelessWidget {
  const RunningProgramDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('42 KM', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Image.network(
                'https://images.unsplash.com/photo-1587590227264-0ac64ce63ce8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                fit: BoxFit.cover,
              ),
              stretchModes: const [StretchMode.zoomBackground],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final days = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY'];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/program_schedule'),
                  child: _buildWeekDayCard(days[index], index + 1),
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDayCard(String day, int dayNumber) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1552674605-db6ffd402907?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              day,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              '$dayNumber',
              style: TextStyle(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 60),
            ),
          ),
        ],
      ),
    );
  }
}
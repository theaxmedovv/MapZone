// Step 5: Update pages/clubs_page.dart
// Integrated the provided code.
// Added navigation to RunningInfoPage when clicking on a club card.
// Improved design: Added animations, more clubs for "a bunch of other things".

import 'package:flutter/material.dart';

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Find The Club Near You'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/club_info'),
            child: _buildClubCard(
              context,
              'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
              'Tangerang Runners',
              'Tangerang, Banten',
              '120 Members',
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/club_info'),
            child: _buildClubCard(
              context,
              'https://images.unsplash.com/photo-1541534401786-2077ed84a95a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
              'Jakarta Pacers',
              'Jakarta, Indonesia',
              '88 Members',
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/club_info'),
            child: _buildClubCard(
              context,
              'https://images.unsplash.com/photo-1598586959223-9a244383b876?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
              'Bandung Striders',
              'Bandung, West Java',
              '150 Members',
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/club_info'),
            child: _buildClubCard(
              context,
              'https://images.unsplash.com/photo-1511308392434-39a7d9387579',
              'Surabaya Sprinters', // Added extra club
              'Surabaya, East Java',
              '200 Members',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubCard(BuildContext context, String imageUrl, String name, String location, String members) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(location, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(members),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Join'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
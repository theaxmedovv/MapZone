// Step 7: Update pages/running_info_page.dart
// Integrated the provided code.
// Improved design: Added more posts, map placeholder improved.

import 'package:flutter/material.dart';

class RunningInfoPage extends StatelessWidget {
  const RunningInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tangerang Runners',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'About Half Marathon',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('Map Placeholder')), // Improved placeholder
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Latest Posts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildPostItem(
                'Bennie',
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                'Finished the morning run! Felt great. #running #fitness'),
            _buildPostItem(
                'You',
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                'Planning a 10k for this weekend. Who is in?'),
            _buildPostItem(
                'Alex',
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                'Great session today! #marathonprep'), // Added extra post
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(String name, String avatarUrl, String postText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(postText),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Like'),
                    SizedBox(width: 16),
                    Icon(Icons.comment_outlined, size: 20, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Comment'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// Step 4: Update pages/home_page.dart
// Integrated the provided code.
// Added navigation: BottomNavigationBar for Home, Clubs, History, Programs.
// "See all" in clubs navigates to ClubsPage.
// Clicking on programs navigates to RunningProgramsPage.
// Added drawer for menu with links to profile (dummy), settings (dummy), logout.
// Improved design: Added animations to cards using AnimatedContainer.
// Added more activities and clubs for "a bunch of other things".
// Added a floating action button to start a run (dummy action).

import 'package:flutter/material.dart';
import '../services/auth_storage.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<void> _logout(BuildContext context) async {
    await AuthStorage.clear();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/clubs');
        break;
      case 2:
        Navigator.pushNamed(context, '/history');
        break;
      case 3:
        Navigator.pushNamed(context, '/programs');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Welcome, ${widget.username}'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightGreen),
              child: Text('Menu', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Add profile page navigation if needed
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Add settings page navigation if needed
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: _buildDashboard(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Clubs'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: 'Programs'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Start run action (dummy)
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Starting run...')));
        },
        backgroundColor: Colors.lightGreenAccent,
        child: const Icon(Icons.play_arrow, color: Colors.black),
      ),
    );
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1511308392434-39a7d9387579'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Running today?',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Track your run',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Last Activities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildActivityCard('3,00 KM', '4.8', '15.00'),
            const SizedBox(height: 10),
            _buildActivityCard('15,00 KM', '4.8', '1:15:00'),
            const SizedBox(height: 10),
            _buildActivityCard('10,00 KM', '5.0', '50:00'), // Added extra activity
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Find The Club Near You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/clubs'),
                  child: const Text('See all'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/club_info'),
                    child: _buildClubCard('https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b', 'Asics Club'),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/club_info'),
                    child: _buildClubCard('https://images.unsplash.com/photo-1541534401786-2077ed84a95a', 'Puma Club'),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/club_info'),
                    child: _buildClubCard('https://images.unsplash.com/photo-1598586959223-9a244383b876', 'Nike Club'), // Added extra club
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Running Programs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/program_detail'),
              child: _buildProgramCard('ELIUD KIPCHOGE', '42 KM', '4.8', 'https://images.unsplash.com/photo-1587590227264-0ac64ce63ce8'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                label: const Text('START'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(String distance, String pace, String time) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.run_circle_outlined, color: Colors.green, size: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(distance, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const Text('Distance'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pace, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const Text('Avg. Pace'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const Text('Time'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClubCard(String imageUrl, String clubName) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              clubName,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgramCard(String name, String distance, String rating, String imageUrl) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  distance,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Step 4: Create pages/main_screen.dart
// This is a new page that handles the bottom navigation bar.
// It switches between Home, Clubs, History, Programs using IndexedStack.
// This allows "jumping" between pages seamlessly without pushing new routes.
// AppBar and Drawer are shared across tabs for consistency.
// FloatingActionButton is added for starting a run.

import 'package:flutter/material.dart';
import '../home/home_page.dart';
import 'clubs_page.dart';
import 'history_page.dart';
import 'running_programs_page.dart';
import '../home/running_programs_page.dart';
import '../services/auth_storage.dart';

class MainScreen extends StatefulWidget {
  final String username;
  const MainScreen({super.key, required this.username});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(username: widget.username),
      const ClubsPage(),
      const HistoryPage(),
      const ProgramSchedulePage(),
    ];

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
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d'),
            ),
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
              onTap: () => Navigator.pop(context), // Dummy profile
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context), // Dummy settings
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Starting run...')));
        },
        backgroundColor: Colors.lightGreenAccent,
        child: const Icon(Icons.play_arrow, color: Colors.black),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/tasks_page.dart';
import 'package:app/pages/statistics_page.dart';
import 'package:app/pages/profile_page.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    TasksPage(),
    StatisticsPage(),
    ProfilePage(),
  ];

  final List<String> _labels = ["Home", "Tasks", "Stats", "Profile"];
  final List<IconData> _icons = [
    Icons.home,
    Icons.task,
    Icons.bar_chart,
    Icons.person,
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? const Color(0xFF23324c) : Colors.grey;

    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            if (isSelected) ...[
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 0,
        child: const Icon(Icons.add, color: Color(0xFF23324c)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildNavItem(_icons[0], _labels[0], 0),
                  const SizedBox(width: 20),
                  _buildNavItem(_icons[1], _labels[1], 1),
                ],
              ),
              Row(
                children: [
                  _buildNavItem(_icons[2], _labels[2], 2),
                  const SizedBox(width: 20),
                  _buildNavItem(_icons[3], _labels[3], 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

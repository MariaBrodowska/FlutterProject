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

    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF23324c) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: child,
                ),
              ),
              child: isSelected
                  ? Padding(
                      key: ValueKey("label_$index"),
                      padding: const EdgeInsets.only(top: 12.0, left: 6.0),
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey("empty")),
            ),
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
        child: const Icon(Icons.add, color: Color(0xFF23324c)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(_icons[0], _labels[0], 0),
              _buildNavItem(_icons[1], _labels[1], 1),
              const SizedBox(width: 40),
              _buildNavItem(_icons[2], _labels[2], 2),
              _buildNavItem(_icons[3], _labels[3], 3),
            ],
          ),
        ),
      ),
    );
  }
}

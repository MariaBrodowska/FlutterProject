import 'package:app/pages/nav.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 226, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1),
            Image(image: AssetImage('assets/welcome_page_icon.png')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Manage your daily tasks',
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 49, 104),
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Plan what you will do to be more organized for today, tomorrow and beyond',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 223, 241, 255),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(68, 0, 0, 0),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(-4, 6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Nav(),
                            ),
                          );
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 17, 49, 104),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

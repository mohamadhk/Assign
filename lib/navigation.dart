import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/dashboard.dart';
import 'package:quiz/forms_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final pages = [FormsScreen(), Dashboard()];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) =>
            {if (i != index) setState(() => index = i)},
        destinations: [
          const NavigationDestination(
              icon: Icon(Icons.person), label: "Registration"),
          const NavigationDestination(
              icon: Icon(Icons.house), label: "Dashboard")
        ],
      ),
    );
  }
}

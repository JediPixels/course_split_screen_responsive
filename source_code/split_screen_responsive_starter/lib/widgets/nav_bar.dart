import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.selectedPageIndex,
    required this.onDestinationSelected,
  });

  final int selectedPageIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.people),
          label: 'Users',
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view),
          label: 'Photos',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart),
          label: 'Dashboard',
        ),
      ],
      selectedIndex: selectedPageIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}

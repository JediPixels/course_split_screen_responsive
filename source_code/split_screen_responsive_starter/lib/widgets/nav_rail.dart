import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';

class NavRail extends StatelessWidget {
  const NavRail({
    super.key,
    required this.selectedPageIndex,
    this.onDestinationSelected,
  });

  final int selectedPageIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
      labelType: NavigationRailLabelType.all,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Icon(
          Icons.account_circle,
          size: Sizes.iconMedium,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('Users'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.grid_view),
          label: Text('Photos'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bar_chart),
          label: Text('Dashboard'),
        ),
      ],
      selectedIndex: selectedPageIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}

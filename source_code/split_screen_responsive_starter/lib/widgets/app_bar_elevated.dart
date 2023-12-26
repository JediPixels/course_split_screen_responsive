import 'package:flutter/material.dart';

class AppBarElevated extends StatelessWidget implements PreferredSizeWidget {
  const AppBarElevated({
    super.key,
    required this.title,
  });

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

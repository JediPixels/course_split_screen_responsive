import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/models/user_model.dart';

class AppState extends InheritedWidget {
  const AppState({
    super.key,
    required this.selectedUserIndex,
    required this.userSelectedNotifier,
    required this.selectedPageIndex,
    required this.colorsList,
    required this.setUserIndex,
    required this.setPageIndex,
    required super.child,
  });

  final int selectedUserIndex;
  final ValueNotifier<User> userSelectedNotifier;
  final int selectedPageIndex;
  final List<Color?> colorsList;
  final Function setUserIndex;
  final Function setPageIndex;

  static AppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>();
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return selectedUserIndex != oldWidget.selectedUserIndex ||
        selectedPageIndex != oldWidget.selectedPageIndex;
  }
}

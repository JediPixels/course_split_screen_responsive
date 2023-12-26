import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/models/user_model.dart';
import 'package:responsive_adaptive_split_screen/widgets/app_bar_elevated.dart';
import 'package:responsive_adaptive_split_screen/widgets/graph_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

typedef GroupedAges = Map<int, List<int>>;

class _DashboardState extends State<Dashboard> {
  final UsersModel _usersList = UsersModel.loadDataJson();
  final GroupedAges _groupedAges = {};

  @override
  void initState() {
    super.initState();
    _calculateTotals();
  }

  void _calculateTotals() {
    _usersList.users.sort((a, b) => a.dob.age.compareTo(b.dob.age));

    // TIP: The ~/ means Divide and return an integer
    for (var user in _usersList.users) {
      final int tensPlace = user.dob.age ~/ 10;
      if (!_groupedAges.containsKey(tensPlace)) {
        _groupedAges[tensPlace] = [];
      }
      _groupedAges[tensPlace]!.add(user.dob.age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarElevated(title: Text('D A S H B O A R D')),
      body: SafeArea(
        child: SingleChildScrollView(
          // TIP: Use FittedBox for Desktop if user resizes window very small
          child: Center(
            child: FittedBox(
              child: Row(
                children: [
                  for (final group in _groupedAges.values) ...[
                    VerticalBarWidget(
                      icon: Icons.people,
                      numberToPlot: group.length,
                      numberToPlotMax: group.length + 1,
                      title: '${(group.first ~/ 10)}0\'s',
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

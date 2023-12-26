import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';
import 'package:responsive_adaptive_split_screen/pages/User/user_detail.dart';
import 'package:responsive_adaptive_split_screen/pages/User/user_list.dart';

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // List
        SizedBox(
          width: Sizes.listWidth,
          child: UserList(),
        ),

        VerticalDivider(width: Sizes.verticalDividerWidth),

        // Details
        Expanded(child: UserDetail()),
      ],
    );
  }
}

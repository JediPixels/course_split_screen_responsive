import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';
import 'package:responsive_adaptive_split_screen/state/app_state.dart';
import 'package:responsive_adaptive_split_screen/widgets/nav_rail.dart';

class DesktopWeb extends StatefulWidget {
  const DesktopWeb({super.key, required this.selectedPage});

  final List<Widget> selectedPage;

  @override
  State<DesktopWeb> createState() => _DesktopWebState();
}

class _DesktopWebState extends State<DesktopWeb> {
  late AppState _appState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appState = AppState.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TIP: This is only used if Window is resized vertically smaller
        //      than the NavigationRail height
        //      SingleChildScrollView -> Container .. BoxConstraints
        SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(minHeight: 300.0),
            height: MediaQuery.sizeOf(context).height,
            child: NavRail(
              selectedPageIndex: _appState.selectedPageIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _appState.setPageIndex(index);
                });
              },
            ),
          ),
        ),

        const VerticalDivider(width: Sizes.verticalDividerWidth),

        Expanded(
          child: IndexedStack(
            index: _appState.selectedPageIndex,
            children: widget.selectedPage,
          ),
        ),
      ],
    );
  }
}

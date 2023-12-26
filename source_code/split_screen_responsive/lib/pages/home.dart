import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';
import 'package:responsive_adaptive_split_screen/state/app_state_notifier.dart';
import 'package:responsive_adaptive_split_screen/pages/responsive/desktop_web.dart';
import 'package:responsive_adaptive_split_screen/pages/responsive/mobile_tablet.dart';
import 'package:responsive_adaptive_split_screen/pages/responsive/responsive_layout_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TIP: UserState remembers selected user and allows refresh of detail page
    return AppStateNotifier(
      child: ResponsiveLayoutBuilder(
        mobile: MobileTablet(
          selectedPage: SelectedPage.bodySelectedPage,
        ),
        tablet: MobileTablet(
          selectedPage: SelectedPage.bodySelectedPageSplitScreen,
        ),
        desktopWeb: DesktopWeb(
          selectedPage: SelectedPage.bodySelectedPageSplitScreen,
        ),
      ),
    );
  }
}

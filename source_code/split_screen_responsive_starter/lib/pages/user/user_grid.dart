import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';
import 'package:responsive_adaptive_split_screen/helpers/themes.dart';
import 'package:responsive_adaptive_split_screen/models/user_model.dart';
import 'package:responsive_adaptive_split_screen/widgets/app_bar_elevated.dart';
import 'package:responsive_adaptive_split_screen/widgets/title_gradient_bar.dart';

class UserGrid extends StatelessWidget {
  const UserGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersModel usersList = UsersModel.loadDataJson();
    usersList.users.sort((a, b) => a.name.first.compareTo(b.name.first));

    return Scaffold(
      appBar: const AppBarElevated(title: Text('G R I D')),
      // TIP: Use SafeArea with left: false for landscape scenarios if
      //      Detail Page Content needs it according to content layout
      //      left: false allows to use page content all the way to the left
      //      side of the List Page Split-Screen
      body: usersList.users.isEmpty
          ? const Center(
              // Sets its height to the child's height multiplied by this factor.
              heightFactor: 2,
              child: Icon(
                Icons.person,
                size: Sizes.iconLarge,
                color: ThemeColors.grey,
                shadows: [Shadow(color: ThemeColors.grey, blurRadius: 12.0)],
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Sizes.imageHeight,
              ),
              itemBuilder: (BuildContext context, int index) {
                return DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ThemeColors.titleBarText,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // TIP: macOS - Without the com.apple.security.network.client
                      //      entitlement, for example, network requests
                      //      fail with a message such as:
                      //      Without the com.apple.security.network.server
                      // https://docs.flutter.dev/platform-integration/macos/building
                      //      macOS DebugProfile.entitlements file add the following:
                      //      <key>com.apple.security.network.client</key>
                      //      <true/>
                      //      <key>com.apple.security.network.server</key>
                      //      <true/>
                      //
                      // TIP: Web: Enable the html renderer in the index.html
                      //      let config = {renderer: "html"}
                      //      engineInitializer.initializeEngine(config).then(function(appRunner)
                      Image.network(
                        usersList.users[index].picture.large,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),

                      // Title Gradient Bar
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: TitleGradientBar(
                          title: usersList.users[index].name.first,
                          email: usersList.users[index].email,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: usersList.users.length,
            ),
    );
  }
}

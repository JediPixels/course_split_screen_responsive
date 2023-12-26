import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';
import 'package:responsive_adaptive_split_screen/helpers/nav_transition.dart';
import 'package:responsive_adaptive_split_screen/helpers/themes.dart';
import 'package:responsive_adaptive_split_screen/models/user_model.dart';
import 'package:responsive_adaptive_split_screen/pages/User/user_detail.dart';
import 'package:responsive_adaptive_split_screen/state/app_state.dart';
import 'package:responsive_adaptive_split_screen/widgets/app_bar_elevated.dart';

/// TIP: Set [PageStorageBucket] as Global to remember scrolled position
final PageStorageBucket pageStorageBucket = PageStorageBucket();

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final HeroController _heroController =
      MaterialApp.createMaterialHeroController();

  @override
  Widget build(BuildContext context) {
    // TIP: When running on phone, no Split-Screen, we use Nested Navigator
    //      showing List page, and allowing navigation from List to Detail page
    // TIP: When running on Tablet, Desktop, and Web show List page
    //      since it's part of the Split-Screen
    // TIP: Takes account device view size, great when resizing or changing
    //      orientation it gives the width of the current rendered view
    // TIP: Since we are using Nested Navigator for Mobile to use Hero Animation
    //      we need to use the HeroControllerScope
    return switch (ResponsiveSizes.whichDevice()) {
      ResponsiveSizes.mobile => HeroControllerScope(
          controller: _heroController,
          child: Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const BuildListViewSeparated(),
              );
            },
          ),
        ),
      ResponsiveSizes.tablet ||
      ResponsiveSizes.desktopWeb =>
        const BuildListViewSeparated(),
    };
  }
}

class BuildListViewSeparated extends StatefulWidget {
  const BuildListViewSeparated({super.key});

  @override
  State<BuildListViewSeparated> createState() => _BuildListViewSeparatedState();
}

class _BuildListViewSeparatedState extends State<BuildListViewSeparated> {
  late AppState appState;
  late User _userSelected;
  final UsersModel _usersList = UsersModel.loadDataJson();
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appState = AppState.of(context)!;
    _userSelected = appState.userSelectedNotifier.value;
    _usersList.users.sort((a, b) => a.name.first.compareTo(b.name.first));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarElevated(title: Text('L I S T')),
      body: PageStorage(
        bucket: pageStorageBucket,
        child: ListView.separated(
          key: const PageStorageKey<String>('scrollPosition'),
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              // TIP: Add contentPadding when screens are resized very small
              //      otherwise it causes error:
              //      'tileWidth != leadingSize.width || tileWidth == 0.0'
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              leading: Hero(
                tag: '$index',
                child: CircleAvatar(
                  backgroundImage: Image.network(
                    _usersList.users[index].picture.large,
                  ).image,
                ),
              ),
              title: Text(
                '${_usersList.users[index].name.first} '
                '${_usersList.users[index].name.last}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: appState.colorsList[index],
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              subtitle: Text(
                _usersList.users[index].nat,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ThemeColors.greyShade600,
                    ),
              ),
              selected: ResponsiveSizes.whichDevice() == ResponsiveSizes.mobile
                  ? false
                  : (appState.selectedUserIndex == index),
              selectedTileColor: Theme.of(context).focusColor,
              onTap: () {
                _userSelected = _usersList.users[index];
                appState.setUserIndex(index);
                appState.userSelectedNotifier.value = _userSelected;

                if (ResponsiveSizes.whichDevice() == ResponsiveSizes.mobile) {
                  // TIP: Using an extension with Fade Transition allowing
                  //      custom timing for Hero Transition
                  Navigator.of(context).push(
                    FadeTransitionRoute(widget: const UserDetail()),
                  );

                  // TIP: Default Navigation Hero Transition is very fast
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const UserDetail(),
                  //   ),
                  // );
                }
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _usersList.users.length,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/helpers/constants.dart';
import 'package:responsive_adaptive_split_screen/helpers/formatters.dart';
import 'package:responsive_adaptive_split_screen/helpers/themes.dart';
import 'package:responsive_adaptive_split_screen/models/user_model.dart';
import 'package:responsive_adaptive_split_screen/state/app_state.dart';
import 'package:responsive_adaptive_split_screen/widgets/app_bar_elevated.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late AppState _appState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appState = AppState.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarElevated(title: Text('D E T A I L')),
      // TIP: Use SafeArea with left: false for landscape scenarios if
      //      Detail Page Content needs it according to content layout
      //      left: false allows to use page content all the way to the left
      //      side of the List Page Split-Screen
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: ValueListenableBuilder(
          valueListenable: _appState.userSelectedNotifier,
          builder: (
            BuildContext context,
            User userSelected,
            Widget? child,
          ) {
            return userSelected.name.first.isEmpty
                ? const Center(
                    // Sets its height to the child's height multiplied by this factor.
                    heightFactor: 2,
                    child: Icon(
                      Icons.person,
                      size: Sizes.iconLarge,
                      color: ThemeColors.grey,
                      shadows: [
                        Shadow(color: ThemeColors.grey, blurRadius: 12.0)
                      ],
                    ),
                  )
                : Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      runSpacing: 32.0,
                      spacing: 32.0,
                      children: [
                        Hero(
                          tag: '${_appState.selectedUserIndex}',
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            elevation: 16.0,
                            child: Image.network(
                              userSelected.picture.large,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              height: 280.0,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${userSelected.name.title} '
                              '${userSelected.name.first} '
                              '${userSelected.name.last}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: _appState.colorsList[
                                        _appState.selectedUserIndex],
                                  ),
                            ),
                            Text(
                              userSelected.email,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              Format.toReadableDate(userSelected.dob.date),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '${userSelected.dob.age} years old',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

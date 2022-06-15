import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendid/providers/navigation.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
    required this.selectedItem,
    required this.ref,
  }) : super(key: key);

  final NavBarItem selectedItem;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: MediaQuery.of(context).size.height - 28,
      child: RotatedBox(
        quarterTurns: 1,
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 100),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: selectedItem.index,
          onDestinationSelected: (index) => {
            ref
                .read(navigationProvider.notifier)
                .update((state) => state = NavBarItem.values.elementAt(index))
          },
          destinations: const [
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.space_dashboard),
                label: "Dashboard",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.inbox),
                label: "Inbox",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.badge),
                label: "Clients",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.supervised_user_circle),
                label: "Users",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.task),
                label: "Tasks",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.content_paste),
                label: "Board",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.shield_outlined),
                label: "Admin",
                tooltip: "",
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: NavigationDestination(
                icon: Icon(Icons.settings),
                label: "Settings",
                tooltip: "",
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprint/providers/navigation.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    Key? key,
    required this.selectedItem,
    required this.ref,
  }) : super(key: key);

  final NavBarItem selectedItem;
  final WidgetRef ref;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  var isSidebarExtended = true;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: (index) => {
        widget.ref
            .read(navigationProvider.notifier)
            .update((state) => state = NavBarItem.values.elementAt(index))
      },
      leading: ElevatedButton(
          onPressed: () => setState(() {
                isSidebarExtended = !isSidebarExtended;
              }),
          child: isSidebarExtended
              ? const Icon(Icons.arrow_back)
              : const Icon(Icons.arrow_forward)),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.space_dashboard),
          label: Text("Dashboard"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.content_paste),
          label: Text("Board"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.shield_outlined),
          label: Text("Admin"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text("Settings"),
        ),
      ],
      minExtendedWidth: 230,
      labelType: NavigationRailLabelType.none,
      selectedIndex: widget.selectedItem.index,
      useIndicator: true,
      extended: isSidebarExtended,
    );
  }
}

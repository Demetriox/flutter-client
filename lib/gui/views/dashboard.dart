import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprint/gui/widgets/global/section.dart';
import 'package:sprint/gui/widgets/sections/new-activity.dart';
import 'package:sprint/providers/theme.dart';
import 'package:sprint/utils/constants.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    super.initState();
    ref.read(colorNamesProvider);
    ref.read(themeProvider);
  }

  List<Widget> list = [
    Section(
      icon: Icons.inbox,
      title: "New Activity",
      content: const NewActivity(),
      onTap: () {},
    ),
    Section(
      icon: Icons.bar_chart,
      title: "Charts",
      content: const NewActivity(),
      onTap: () {},
    )
  ];
  @override
  Widget build(BuildContext context) {
    final colorNames = ref.watch(colorNamesProvider);
    final selectedColor = ref.watch(colorSchemeProvider);

    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  height: isMobile ? 0 : 200,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl:
                      "https://source.unsplash.com/random/?${colorNames[selectedColor.index]}}",
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount:
                    (MediaQuery.of(context).size.width < 800) ? 1 : 2,
                shrinkWrap: true,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.4,
                children: list,
              ),
            ),
          )
        ],
      ),
    );
  }
}

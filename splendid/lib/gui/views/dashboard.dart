import 'package:flutter/material.dart';
import 'package:splendid/gui/widgets/global/section.dart';
import 'package:splendid/gui/widgets/sections/new-activity.dart';
import 'package:splendid/utils/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(
                  "https://source.unsplash.com/random/?pink",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
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

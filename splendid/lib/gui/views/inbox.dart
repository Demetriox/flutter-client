import 'package:flutter/cupertino.dart';
import 'package:splendid/gui/widgets/global/section.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<Widget> list = const [
    Section(content: Text("Test")),
    Section(content: Text("Test 2")),
    Section(content: Text("Test 3")),
    Section(content: Text("Test 4"))
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/header.jpg",
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4),
                  children: List.generate(list.length, (index) => list[index])),
            ),
          )
        ],
      ),
    );
  }
}

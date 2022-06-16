import 'package:flutter/material.dart';

class NewActivity extends StatefulWidget {
  const NewActivity({Key? key}) : super(key: key);

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  var dummyData = const [
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded)
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text("Card data..."),
            ElevatedButton(onPressed: () => {}, child: const Text("Press me!"))
          ],
        )
      ],
    );
  }
}

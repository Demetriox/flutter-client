import 'package:flutter/cupertino.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Banner(
          message: "message",
          location: BannerLocation.topStart,
          child: Image.network(
            "assets/images/random.jpg",
            width: 100,
          ),
        )
      ],
    );
  }
}

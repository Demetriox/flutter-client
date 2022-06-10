import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  final Widget content;
  const Section({Key? key, required this.content}) : super(key: key);
  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        height: 10.0,
        width: 10.0,
        child: widget.content,
      ),
    );
  }
}

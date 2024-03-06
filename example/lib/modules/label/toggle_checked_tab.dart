import 'package:flutter/material.dart';
import 'package:flutter_parts/flutter_parts.dart';

class ToggleCheckedTab extends StatefulWidget {
  const ToggleCheckedTab({super.key});

  @override
  State<StatefulWidget> createState() => ToggleCheckedTabState();
}

class ToggleCheckedTabState extends State<ToggleCheckedTab> {
  bool isChecked = false;

  void toggleState() {
    setState(() {
      isChecked = !isChecked;
    });
    print('----$isChecked');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleState,
      child: Tag(
        checked: isChecked,
        child: Text('Toggle Checked State: $isChecked'),
      ),
    );
  }
}

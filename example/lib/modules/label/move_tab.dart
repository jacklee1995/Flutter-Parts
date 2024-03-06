import 'package:flutter/widgets.dart';
import 'package:flutter_parts/flutter_parts.dart';

class MoveTab extends StatefulWidget {
  final String text;
  final TypeEnum type;
  final EffectEnum effect;
  const MoveTab(this.text,
      {super.key, required this.type, this.effect = EffectEnum.dark});

  @override
  State<MoveTab> createState() => _MoveTabState();
}

class _MoveTabState extends State<MoveTab> {
  bool _isTagVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _isTagVisible
          ? Tag(
              closable: true,
              type: widget.type,
              effect: widget.effect,
              onClose: () {
                setState(() {
                  _isTagVisible = false;
                });
              },
              child: Text(widget.text),
            )
          : null,
    );
  }
}

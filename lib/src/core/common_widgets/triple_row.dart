import 'package:flutter/widgets.dart';

/// Keeps the middle widget centered, in the same exact spot
/// Doesn't matter if leading / trailing widgets are provided, or not
class TripleRow extends StatelessWidget {
  const TripleRow({
    super.key,
    this.leading,
    this.middle,
    this.trailing,
  });

  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1,
            child: leading,
          ),
        ),
        if (middle != null) middle!,
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            heightFactor: 1,
            child: trailing,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';

/// Keeps the middle widget centered, in the same exact spot
/// Doesn't matter if leading / trailing widgets are provided, or not
class TripleColumn extends StatelessWidget {
  const TripleColumn({
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
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 1,
            child: leading,
          ),
        ),
        if (middle != null) middle!,
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 1,
            child: trailing,
          ),
        ),
      ],
    );
  }
}

// class ViewLayout extends StatelessWidget {
//   const ViewLayout({
//     required this.content,
//     this.header,
//     this.footer,
//     super.key,
//   });

//   final Widget content;
//   final Widget? header;
//   final Widget? footer;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (header != null) ...[header!, const SizedBox(height: 32)],
//           Expanded(child: content),
//           if (footer != null) ...[const SizedBox(height: 32), footer!],
//         ],
//       ),
//     );
//   }
// }

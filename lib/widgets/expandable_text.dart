// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_expandable_text/flutter_expandable_text.dart';

// class SeeMoreExample extends StatelessWidget {
//   final String longText =
//       'This is a very long text. You can show a "See More" link and expand the text when the user taps on it. This way, you can handle long texts without taking up too much space in your UI.';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ExpandablePanel(
//         header: Text(
//           'See More Example',
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         expanded: ExpandableText(
//           longText,
//           // linkColor: Colors.blue,
//         ),
//         theme: const ExpandableThemeData(
//           crossFadePoint: 0.5,
//         ), collapsed: null,
//       ),
//     );
//   }
// }
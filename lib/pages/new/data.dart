// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CreatingData {
//   static const shaxsList = <String>[
//     "Jismoniy shaxs",
//     "Yuridik shaxs",
//   ];

//    final TextStyle styleWhite = GoogleFonts.ubuntu(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       fontStyle: FontStyle.normal,
//       color: Color(0xFFE7E7E7));
  
//   final List<PopupMenuItem<String>> _popUpMenu = shaxsList
//         .map((String element) => PopupMenuItem<String>(
//             value: element,
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 width: sizeQuery.width,
//                 child: Row(
//                   children: [
//                     Text(
//                       element,
//                       style: styleWhite,
//                     ),
//                     Spacer(),
//                     Radio(
//                         value: element,
//                         groupValue: _individualValue,
//                         onChanged: (String? newValue) {})
//                   ],
//                 ),
//               ),
//             )))
//         .toList();
        
// }
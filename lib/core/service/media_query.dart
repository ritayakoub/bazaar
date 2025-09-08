import 'package:flutter/material.dart';

class MediaQueryUtil {
  //412 Width
  //844 Height
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
// import 'package:flutter/material.dart';

// class ResponsivePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // الحصول على أبعاد الشاشة
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('واجهة متجاوبة'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'أبعاد الشاشة:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text('العرض: ${screenWidth.toStringAsFixed(2)}'),
//             Text('الارتفاع: ${screenHeight.toStringAsFixed(2)}'),
//             SizedBox(height: 20),

//             // صورة متجاوبة
//             Container(
//               width: screenWidth * 0.9,
//               height: screenHeight * 0.3,
//               color: Colors.blueAccent,
//               child: Center(
//                 child: Text(
//                   'صورة تجريبية',
//                   style: TextStyle(color: Colors.white, fontSize: 22),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),

//             // نص متجاوب
//             Text(
//               'هذا النص يتم عرضه حسب حجم الشاشة. كلما زاد العرض، زاد حجم النص قليلاً.',
//               style: TextStyle(
//                 fontSize: screenWidth * 0.045, // حجم نص نسبي
//               ),
//             ),

//             Spacer(),

//             // زر بعرض نسبي
//             SizedBox(
//               width: screenWidth * 0.8,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: Text('اضغط هنا'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

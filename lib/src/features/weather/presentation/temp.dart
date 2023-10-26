// import 'package:flutter/material.dart';
// import 'package:weatherLeaf/src/constants/constants.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class WeatherDetailPage extends StatelessWidget {
//   const WeatherDetailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text('Paris', style: kH1TextStyle),
//       ),
//       backgroundColor: const Color(0xFFFFE142),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(16)),
//                   child: const Padding(
//                     padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
//                     child: Text(
//                       "Friday, January 20",
//                       style: TextStyle(
//                         color: kYellorColor,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               const Center(child: Text("Sunny", style: kH2TextStyle)),
//               const SizedBox(
//                 height: 8,
//               ),
//               const Center(
//                   child: Text(
//                 "31°",
//                 style: TextStyle(
//                   fontSize: 130,
//                 ),
//               )
//                   // .animate().then().shake(duration: 2000.ms)
//                   ),
//               const SizedBox(
//                 height: 16,
//               ),
//               const Text(
//                 "Daily Summary",
//                 style: kH1TextStyle,
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               RichText(
//                 text: TextSpan(
//                   text: 'Now it feels like +',
//                   style: kBodyTextStyle.copyWith(fontSize: 14),
//                   children: const <TextSpan>[
//                     TextSpan(
//                         text: '35°',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: ' , actually '),
//                     TextSpan(
//                         text: '+31°.',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(
//                         text: '\nIt feels hot because of the direct sun.  '),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.black),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       WeatherIcon(
//                           icon: Icons.air_outlined,
//                           description: "4km/h",
//                           weatherCondition: "Wind"),
//                       WeatherIcon(
//                           icon: Icons.water_drop_outlined,
//                           description: "48%",
//                           weatherCondition: "Humidity"),
//                       WeatherIcon(
//                           icon: Icons.visibility_outlined,
//                           description: "1.6km",
//                           weatherCondition: "Visibility"),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Weekly forecast",
//                     style: kH1TextStyle,
//                   ),
//                   Icon(
//                     Icons.arrow_right_alt,
//                     size: 30,
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               // ListView(
//               //
//               // )
//               SizedBox(
//                   height: 100, // Set the desired height for the horizontal list
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 7, // Adjust the number of items as needed
//                     itemBuilder: (BuildContext context, int index) {
//                       // Replace WeeklyForecastWidget() with your content for each day
//                       return Container(
//                         width: 100, // Set the width of each item
//                         margin: const EdgeInsets.only(
//                             right: 16), // Add margin between items
//                         child:
//                             const WeeklyForecastWidget(), // Replace with your widget
//                       );
//                     },
//                   )),
//             ].animate(interval: 100.ms).fade(duration: 800.ms)),
//       ),
//     );
//   }
// }

// class WeeklyForecastWidget extends StatelessWidget {
//   const WeeklyForecastWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           width: 2, // Border thickness
//           color: Colors.black, // Border color
//         ),
//       ),
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "26°",
//               style: kH2TextStyle,
//             ),
//             Icon(Icons.sunny),
//             Text(
//               "21 Jan",
//               style: kBodyTextStyle,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class WeatherIcon extends StatelessWidget {
//   const WeatherIcon(
//       {super.key,
//       required this.icon,
//       required this.description,
//       required this.weatherCondition});
//   final IconData icon;
//   final String description;
//   final String weatherCondition;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(
//           icon,
//           color: const Color(0xFFFFE142),
//           size: 50,
//         )
//             .animate(
//               onPlay: (controller) => controller.loop(count: 6, reverse: true),
//               delay: 600.ms,
//             )
//             .slideY(begin: 0, curve: Curves.bounceIn, duration: 200.ms)
//             .then()
//             .slideY(end: -0.25, curve: Curves.bounceOut),
//         const SizedBox(
//           height: 16,
//         ),
//         Text(
//           description,
//           style: const TextStyle(fontSize: 16, color: kYellorColor),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           weatherCondition,
//           style: const TextStyle(fontSize: 12, color: kYellorColor),
//         ),
//       ],
//     );
//   }
// }

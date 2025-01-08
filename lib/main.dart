// import 'package:flutter/material.dart';
//
// void main() => runApp(const DockApp());
//
// class DockApp extends StatelessWidget {
//   const DockApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const DockScreen(),
//     );
//   }
// }
//
// class DockScreen extends StatelessWidget {
//   const DockScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: const [
//           Dock(),
//         ],
//       ),
//     );
//   }
// }
//
// class Dock extends StatefulWidget {
//   const Dock({super.key});
//
//   @override
//   State<Dock> createState() => _DockState();
// }
//
// class _DockState extends State<Dock> {
//   List<IconData> icons = [
//     Icons.home,
//     Icons.search,
//     Icons.settings,
//     Icons.favorite,
//     Icons.message,
//     Icons.notifications,
//   ];
//
//   int? draggingIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(
//           icons.length,
//               (index) {
//             return DragTarget<int>(
//               onAccept: (fromIndex) {
//                 setState(() {
//                   final icon = icons.removeAt(fromIndex);
//                   icons.insert(index, icon);
//                   draggingIndex = null;
//                 });
//               },
//               onWillAccept: (fromIndex) {
//                 return draggingIndex != index; // Prevent accepting the same icon back
//               },
//               builder: (context, candidateData, rejectedData) {
//                 return Draggable<int>(
//                   data: index,
//                   onDraggableCanceled: (_, __) {
//                     setState(() {
//                       draggingIndex = null;
//                     });
//                   },
//                   feedback: Material(
//                     color: Colors.transparent,
//                     child: Icon(
//                       icons[index],
//                       size: 50,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   childWhenDragging: Opacity(
//                     opacity: 0.0,
//                     child: Icon(
//                       icons[index],
//                       size: 40,
//                       color: Colors.white,
//                     ),
//                   ),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     curve: Curves.easeInOut,
//                     width: candidateData.isNotEmpty ? 60 : 40,
//                     height: candidateData.isNotEmpty ? 60 : 40,
//                     child: draggingIndex != index
//                         ? Icon(
//                       icons[index],
//                       size: candidateData.isNotEmpty ? 50 : 40,
//                       color: Colors.white,
//                     )
//                         : Container(), // Hide the icon when it's being dragged
//                   ),
//                   onDragStarted: () {
//                     setState(() {
//                       draggingIndex = index; // Track which icon is being dragged
//                     });
//                   },
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/firestore/firebase_options.dart';
import 'package:history_ai/infrastructure/languages/translation_services.dart';
import 'package:history_ai/infrastructure/routes/app_pages.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/onboarding/splash_screen.dart';
SharedPreferences ?preferences ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences =await SharedPreferences.getInstance();
  Gemini.reInitialize(apiKey: "AIzaSyD8MDsuIV6ymQrmi3G_-h7LuGa9ZYksjqc", enableDebugging: false);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) {});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      getPages: AppPages.routes,
      initialRoute: RouteConstants.splash,
      theme: ThemeData.light(useMaterial3: true),
      home: const SplashScreen(),
      // home: const MainScreen(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}

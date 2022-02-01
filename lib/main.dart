import 'package:flutter/material.dart';
import 'package:messenger_app_ui/core/theme_data.dart';
import 'package:messenger_app_ui/presentation/group_chat_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Messenger UI App',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.appThemeData,
            home: const GroupChat(),
          );
        }
    );
  }
}


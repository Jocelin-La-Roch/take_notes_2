import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_note/db_helper.dart';
import 'package:take_note/colors.dart';
import 'package:take_note/add_note_screen.dart';
import 'package:get/get.dart';

import 'note_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBHelper.initDb();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: colorPrimaryDark));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: colorPrimary,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      defaultTransition: Transition.rightToLeft,
      home: NoteListScreen(),
    );
  }
}
import 'package:assesment_app/providers/moments_provider.dart';
import 'package:assesment_app/views/schedule_home_view.dart';
import 'package:assesment_app/views/schedule_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MomentsProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE6E6E6),
        primarySwatch: Colors.blue,
      ),
      home: ScheduleHomeView(),
    );
  }
}

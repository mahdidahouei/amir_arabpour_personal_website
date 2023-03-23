import 'package:flutter/material.dart';

import 'ui/pages/landing_page/landing_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, app) {
        return app!;
      },
      theme: ThemeData(),
      home: const LandingPage(),
    );
  }
}

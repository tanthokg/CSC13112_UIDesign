import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/login.dart';
import 'package:uniride/features/rating/driver_rate.dart';
import 'package:uniride/features/driver/driver_ready_to_start.dart';

import 'features/driver/driver_finish.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: blueSky,
      ),
      home: const LoginView(),
      routes: {
        Routes.login: (context) => const LoginView(),

        Routes.driverRating: (context) => const DriverRateView(),
        Routes.driverReadyToStart: (context) => const DriverReadyToStartView(),
        Routes.driverFinish: (context) => const DriverFinishView(),
        
      },
    );
  }
}

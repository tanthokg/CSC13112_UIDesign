import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/forgot_password.dart';
import 'package:uniride/features/auth/login.dart';
import 'package:uniride/features/driver/driver_start_trip.dart';
import 'package:uniride/features/find_location/find_location.dart';
import 'package:uniride/features/homepage/homepage.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/features/auth/register.dart';
import 'package:uniride/features/rating/driver_rate.dart';
import 'package:uniride/features/driver/driver_ready_to_start.dart';

import 'features/driver/driver_confirm_trip.dart';
import 'features/driver/driver_end_trip.dart';
import 'features/driver/driver_finish.dart';

import 'package:uniride/features/book_ride/book_ride_list.dart';
import 'package:uniride/features/home.dart';
import 'package:uniride/features/chat/chat.dart';
import 'package:uniride/features/chat/chat_detail.dart';

import 'features/rating/booker_rate.dart';

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
      home: const HomePage(),
      routes: {
        Routes.login: (context) => const LoginView(),
        Routes.register: (context) => const RegisterView(),
        Routes.forgotPassword: (context) => const ForgotPassword(),
        Routes.findLocation: (context) => const FindLocationView(),
        Routes.currentLocation: (context) => const CurrentLocationView(),

        Routes.driverRating: (context) => const DriverRateView(),

        Routes.driverReadyToStart: (context) => const DriverReadyToStartView(),
        Routes.driverStart: (context) => const DriverStartView(),
        Routes.driverEnd: (context) => const DriverEndView(),
        Routes.driverFinish: (context) => const DriverFinishView(),
        Routes.driverConfirm: (context) => const DriverConfirmView(),

        Routes.home: (context) => const HomeView(),
        Routes.rideList: (context) => const BookRideListView(),
        Routes.chat: (context) => const ChatView(),
        Routes.chatDetail: (context) => const ChatDetailView(),
        Routes.rating: (context) => const BookerRatingView(),
      },
    );
  }
}
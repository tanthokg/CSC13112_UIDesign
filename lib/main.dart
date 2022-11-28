import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/forgot_password.dart';
import 'package:uniride/features/auth/login.dart';
import 'package:uniride/features/book_ride/book_ride_list.dart';
import 'package:uniride/features/home.dart';
import 'package:uniride/features/auth/register.dart';

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
        Routes.register: (context) => const RegisterView(),
        Routes.forgotPassword: (context) => const ForgotPassword(),
        Routes.home: (context) => const HomeView(),
        Routes.rideList: (context) => const BookRideListView(),
      },
    );
  }
}
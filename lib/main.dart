import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/forgot_password.dart';
import 'package:uniride/features/auth/login.dart';
import 'package:uniride/features/chat/chat.dart';
import 'package:uniride/features/chat/chat_detail.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/features/auth/register.dart';
import 'package:uniride/features/homepage/homepage.dart';
import 'package:uniride/features/map/simple_map.dart';

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
        Routes.homepage: (context) => const HomePage(),
        Routes.chat: (context) => const ChatView(),
        Routes.chatDetail: (context) => const ChatDetailView(),
      },
    );
  }
}

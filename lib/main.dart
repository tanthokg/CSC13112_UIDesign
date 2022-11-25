import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/login.dart';
import 'package:uniride/features/chat/chat.dart';
import 'package:uniride/features/chat/chat_detail.dart';
import 'package:uniride/features/notification/dialog.dart';

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
      // home: const LoginView(),
      home: const DialogView(),
      routes: {
        Routes.login: (context) => const LoginView(),
        Routes.chat: (context) => const ChatView(),
        Routes.chatDetail: (context) => const ChatDetailView(),
      },
    );
  }
}

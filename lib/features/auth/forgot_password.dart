import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Image.asset(
                'assets/illustration/reset_password.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 32),
              Text(
                'Vui lòng nhập email bạn đã dùng\nđể đăng ký tài khoản',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: blackBlue,
                ),
              ),
              const SizedBox(height: 32),
              Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 3.0,
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey[200],
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    hintText: 'Email',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Icon(Icons.mail_rounded, color: blueSky, size: 32),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blueSky, width: 2),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: blueSky,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text(
                  'Gửi mã',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Quay về đăng nhập',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: blueSky),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

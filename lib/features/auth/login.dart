import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _saveLogin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 280,
                height: 280,
                child: Image.asset('assets/illustration/login.png'),
              ),
              const SizedBox(height: 16),
              Text(
                'Đăng nhập',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: blackBlue,
                ),
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 16),
              Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 3.0,
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey[200],
                child: TextField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Icon(Icons.key_rounded, color: blueSky, size: 32),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blueSky, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: blueSky,
                    value: _saveLogin,
                    onChanged: (value) {
                      setState(() {
                        _saveLogin = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Lưu đăng nhập',
                      style: TextStyle(fontSize: 18, color: blackBlue),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: blueSky),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: blueSky,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'hoặc đăng nhập bằng',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: blackBlue),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/logo/facebook.png',
                        width: 40, height: 40),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                    onTap: () {},
                    child:
                        Image.asset('assets/logo/google.png', width: 40, height: 40),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Chưa có tài khoản?',
                    style: TextStyle(fontSize: 17, color: blackBlue),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {},
                    child: Text('Đăng ký ngay',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: blueSky)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

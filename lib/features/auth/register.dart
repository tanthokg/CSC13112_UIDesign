import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/database/user_dao.dart';
import 'package:uniride/entity/user.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Image.asset(
                'assets/illustration/register.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 24),
              Text(
                'Tạo tài khoản',
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
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    hintText: 'Họ và tên',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Icon(Icons.person_rounded, color: blueSky, size: 32),
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
                  controller: _emailController,
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
                  controller: _passwordController,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    hintText: 'Mật khẩu',
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
              const SizedBox(height: 16),
              Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 3.0,
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey[200],
                child: TextField(
                  controller: _retypePasswordController,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    hintText: 'Nhập lại mật khẩu',
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
              const SizedBox(height: 32),
              TextButton(
                onPressed: () async {
                  await _register(
                    _nameController.text,
                    _emailController.text,
                    _passwordController.text,
                  );

                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: blueSky,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text(
                  'Đăng ký',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Đã có tài khoản?',
                    style: TextStyle(fontSize: 17, color: blackBlue),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, color: blueSky),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _register(String name, String email, String password) async {
  if (name.isEmpty || email.isEmpty || password.isEmpty) {
    return;
  }

  final user = User(name: name, email: email, password: password);
  await UserDAO.instance.createUser(user);
}

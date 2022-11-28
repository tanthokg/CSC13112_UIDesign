import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/database/user_dao.dart';
import 'package:uniride/entity/user.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _emptyName = false;
  bool _emptyEmail = false;
  bool _emptyPassword = false;
  bool _emptyRetypePassword = false;

  bool _passwordMismatch = false;
  bool _invalidEmail = false;

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
              _emptyName
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        'Name cannot be empty',
                        style: TextStyle(fontSize: 14, color: red),
                      ),
                    )
                  : const SizedBox.shrink(),
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
              _emptyEmail
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        'E-mail address cannot be empty',
                        style: TextStyle(fontSize: 14, color: red),
                      ),
                    )
                  : const SizedBox.shrink(),
              _invalidEmail
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        'Please enter a valid email address',
                        style: TextStyle(fontSize: 14, color: red),
                      ),
                    )
                  : const SizedBox.shrink(),
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
              _emptyPassword
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        'Password cannot be empty',
                        style: TextStyle(fontSize: 14, color: red),
                      ),
                    )
                  : const SizedBox.shrink(),
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
              _emptyRetypePassword
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        'Please enter your password again',
                        style: TextStyle(fontSize: 14, color: red),
                      ),
                    )
                  : const SizedBox.shrink(),
              _passwordMismatch
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        'Your password does not match',
                        style: TextStyle(fontSize: 14, color: red),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () async {
                  // Validate full name
                  if (_nameController.text.isEmpty) {
                    setState(() {
                      _emptyName = true;
                    });
                  } else {
                    setState(() {
                      _emptyName = false;
                    });
                  }
                  // Validate email address
                  if (_emailController.text.isEmpty) {
                    setState(() {
                      _emptyEmail = true;
                    });
                  } else {
                    setState(() {
                      _emptyEmail = false;
                    });
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_emailController.text)) {
                      setState(() {
                        _invalidEmail = true;
                      });
                    } else {
                      setState(() {
                        _invalidEmail = false;
                      });
                    }
                  }
                  // Validate password
                  if (_passwordController.text.isEmpty) {
                    setState(() {
                      _emptyPassword = true;
                    });
                  } else {
                    setState(() {
                      _emptyPassword = false;
                    });
                  }
                  // Validate re-typed password
                  if (_retypePasswordController.text.isEmpty) {
                    setState(() {
                      _emptyRetypePassword = true;
                    });
                  } else {
                    setState(() {
                      _emptyRetypePassword = false;
                    });
                    if (_passwordController.text != _retypePasswordController.text) {
                      setState(() {
                        _passwordMismatch = true;
                      });
                    } else {
                      setState(() {
                        _passwordMismatch = false;
                      });
                    }
                  }

                  if (!_emptyName &&
                      !_emptyEmail &&
                      !_emptyPassword &&
                      !_emptyRetypePassword &&
                      !_passwordMismatch) {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    await _register(name, email, password);

                    if (mounted) {
                      Navigator.pop(context);
                    }
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

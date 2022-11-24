import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _role = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: double.maxFinite,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/avatar/avatar-01.png'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chào mừng,',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: blackBlue.shade200,
                            ),
                          ),
                          Text(
                            'Nguyễn Văn A',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: blackBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.apps_rounded, size: 32, color: blueSky),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  margin: const EdgeInsets.all(24),
                  elevation: 3.0,
                  surfaceTintColor: Colors.white,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Image.asset(
                          _role
                              ? 'assets/illustration/role_rider.png'
                              : 'assets/illustration/role_booker.png',
                          width: 240,
                          height: 240,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 200,
                          height: 48,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: blueSky.shade50,
                                    borderRadius: BorderRadius.circular(32)),
                              ),
                              _role
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          setState(() {
                                            _role = !_role;
                                          });
                                        },
                                        child: Container(
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: blueSky.shade100,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: blueSky.shade50,
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  //offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                        ),
                                      ),
                                    )
                                  : Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          setState(() {
                                            _role = !_role;
                                          });
                                        },
                                        child: Container(
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: purple.shade100,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: purple.shade50,
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  //offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Bạn đang chọn',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: blackBlue.shade200,
                          ),
                        ),
                        Text(
                          _role ? 'Người lái xe' : 'Người đặt xe',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: blackBlue,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: _role ? blueSky : purple,
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: Text(
                            _role ? 'Tạo chuyến xe' : 'Tìm chuyến xe',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

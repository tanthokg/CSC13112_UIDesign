import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _riderRole = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  margin: const EdgeInsets.all(16),
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
                          _riderRole
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
                              _riderRole
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          setState(() {
                                            _riderRole = !_riderRole;
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
                                            _riderRole = !_riderRole;
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
                          'B???n ??ang ch???n',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: blackBlue.shade200,
                          ),
                        ),
                        Text(
                          _riderRole ? 'Ng?????i l??i xe' : 'Ng?????i ?????t xe',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: blackBlue,
                              fontFamily: 'Inter'),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.findLocation, arguments: _riderRole);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: _riderRole ? blueSky : purple,
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: Text(
                            _riderRole ? 'T???o chuy???n xe' : 'T??m chuy???n xe',
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
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'T??nh n??ng n???i b???t',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: blackBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'C??c t??nh n??ng ???????c nhi???u ng?????i\ns??? d???ng trong v??ng 1 th??ng!',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackBlue.shade200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/illustration/top_features.png',
                      width: 80,
                      height: 80,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.findLocation);
                },
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/create_trip.png',
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _riderRole ? 'T???o chuy???n xe' : 'T???o cu???c h???n',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: blackBlue,
                              ),
                            ),
                            Text(
                              _riderRole
                                  ? 'T???o th??ng tin chuy???n xe ?????\nth???c hi???n d???ch v??? ??i xe'
                                  : 'T???o cu???c h???n ????? ?????ng h??nh\nc??ng ng?????i l??i xe ',
                              style: TextStyle(
                                fontSize: 14,
                                color: blackBlue.shade300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_riderRole) {
                    Navigator.pushNamed(context, Routes.driverConfirm);
                  } else {
                    Navigator.pushNamed(context, Routes.rideList);
                  }
                },
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/find_trip.png',
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _riderRole
                                  ? 'X??c nh???n chuy???n xe'
                                  : 'T??m chuy???n xe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: blackBlue,
                              ),
                            ),
                            Text(
                              _riderRole
                                  ? 'Xem v?? ph?? duy???t c??c\ny??u c???u ?????t xe'
                                  : 'T??m c??c chuy???n xe ?????\n??i ?????n v??? tr?? mong mu???n',
                              style: TextStyle(
                                fontSize: 14,
                                color: blackBlue.shade300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.currentLocation);
                },
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/open_map.png',
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xem b???n ?????',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: blackBlue,
                              ),
                            ),
                            Text(
                              'T??m ki???m ?????a ??i???m\ntr??n b???n ?????',
                              style: TextStyle(
                                fontSize: 14,
                                color: blackBlue.shade300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'T??nh n??ng kh??c',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: blackBlue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Image.asset(
                              'assets/icon/wallet.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            'Li??n k???t\nv?? ??i???n t???',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: blackBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.chat),
                      child: Column(
                        children: [
                          Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            surfaceTintColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Image.asset(
                                'assets/icon/chat.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              'Tr?? chuy???n\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: blackBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Ph??t tri???n b???i nh??m HCMUS UniRide\n?? All rights reserved',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: blackBlue.shade300,
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

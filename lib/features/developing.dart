import 'package:flutter/material.dart';

class DevelopingView extends StatefulWidget {
  const DevelopingView({Key? key}) : super(key: key);

  @override
  State<DevelopingView> createState() => _DevelopingViewState();
}

class _DevelopingViewState extends State<DevelopingView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('We are developing this page'),
      ),
    );
  }
}

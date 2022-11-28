import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/drivers_list_routes.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({Key? key}) : super(key: key);

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  String departureText = "";
  String destinationText = "";
  String additionalDescription = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: background,
            appBar:
                AppBar(title: Text('Thông tin chuyến xe'), centerTitle: true,),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  const SizedBox(height: 24),
                  TextField(
                    onChanged: (newString) {
                      departureText = newString;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        labelText: "Vị trí đi",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (newString) {
                      destinationText = newString;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        labelText: "Vị trí đến",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(height: 12),
                  Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    ElevatedButton(
                        child: const Text("Bấm vô đây để chọn ngày"),
                        onPressed: () async {
                          DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025));
                        })
                  ]),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (newString) {
                      additionalDescription = newString;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 10),
                        labelText: "Mô tả",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DriversListRoute(
                                                    departureText:
                                                        departureText,
                                                    destinationText:
                                                        destinationText,
                                                    additionalDescription:
                                                        additionalDescription)));
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: blueSky,
                                    minimumSize: const Size.fromHeight(56),
                                  ),
                                  child: const Text('Tạo chuyến xe',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white))))))
                ]))));
  }
}

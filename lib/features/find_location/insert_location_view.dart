import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/locations.dart';
import 'package:uniride/entity/location.dart';

class InsertLocationView extends StatefulWidget {
  const InsertLocationView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InsertLocationView> createState() => _InsertLocationViewState();
}

class _InsertLocationViewState extends State<InsertLocationView> {
  final _controller = TextEditingController();

  List<Location> _valid = [];

  void _validateLocationSearch(String query) {
    _valid.clear();
    final keyword = query.replaceAll(',', '').toLowerCase();
    for (var location in locations) {
      if ((location.name.toLowerCase().contains(keyword) || location.alias.contains(keyword)) &&
          !_valid.contains(location)) {
        _valid.add(location);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: blackBlue),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey[200],
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400],
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'nhập địa điểm',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: Icon(Icons.location_on_outlined, color: blueSky, size: 32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                onChanged: _validateLocationSearch,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                _controller.text.isEmpty ? 'Địa điểm gần đây' : 'Kết quả tìm kiếm',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: blackBlue.shade600),
              ),
            ),
            _valid.isEmpty
                ? _controller.text.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: locations.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: Icon(
                              Icons.school_rounded,
                              color: blueSky,
                              size: 28,
                            ),
                            title: Text(locations[index].name),
                            subtitle: Text(locations[index].detail),
                            onTap: () {
                              Navigator.pop(context, locations[index].name);
                            },
                          ),
                        ),
                      )
                    : const Center(
                        child: Text('Không tìm thấy địa điểm bạn nhập'),
                      )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _valid.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(_valid[index].name),
                        subtitle: Text(_valid[index].detail),
                        onTap: () {
                          Navigator.pop(context, _valid[index].name);
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

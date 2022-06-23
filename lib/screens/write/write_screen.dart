import 'package:flutter/material.dart';
import 'package:mbtmi/constants.dart';

class WriteScreen extends StatefulWidget {
  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kYellowColor,
        leading: IconButton(
            padding: const EdgeInsets.only(left: 10),
            icon: Icon(
              Icons.check_box_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.check_box_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // 비속어 필터링 팝업
              })
        ],
      ),
    );
  }
}

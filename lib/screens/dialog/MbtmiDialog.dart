import 'package:flutter/material.dart';

Future<void> showMbtmiDialog(
    BuildContext context, String title, String content) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            titlePadding: EdgeInsets.all(8),
            title: Center(
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/noti.png"),
                    width: 45,
                  ),
                  SizedBox(height: 12),
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      content,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 12),
                    Divider()
                  ]),
            ),
            contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            actions: [
              Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: AssetImage("assets/images/confirm.png"),
                      width: 32,
                    )),
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)));
      });
}

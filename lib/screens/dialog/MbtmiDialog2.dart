import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'MbtmiDialog.dart';

Future<void> showMbtmiDialog2(BuildContext context, String title) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            titlePadding: EdgeInsets.all(8),
            title: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/feed_actionIcon.svg',
                        color: Colors.black,
                        height: Get.height * 0.025,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showMbtmiDialog(context, "감사합니다.", "신고가 정상적으로 접수되었습니다.");
                },
                // onTap: () =>Navigator.pop(context),
                //     showMbtmiDialog(context, "감사합니다.", "신고가 정상적으로 접수되었습니다."),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 50,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20),
                      Text(
                        '욕설 / 비하',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '낚시 / 놀람 / 도배',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '정당 / 정치인 비하 및 선거 운동',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '음란물 / 불건전한 만남 및 대화',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '상업적 광고 및 판매',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '유출 / 사칭 / 사기',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 20),
                    ]),
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(5, 15, 15, 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)));
      });
}

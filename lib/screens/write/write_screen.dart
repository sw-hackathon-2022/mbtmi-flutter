import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbtmi/constants.dart';

class WriteScreen extends StatefulWidget {
  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  String title = "다음과 같은 비속어가 발견되어\n게시글 등록에 실패했습니다\n\n수정 후 재등록해주세요.";
  String content = "발견된 비속어: X발, X랄";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kYellowColor,
          leading: IconButton(
              padding: const EdgeInsets.only(left: 10),
              icon: Icon(
                Icons.disabled_by_default_outlined,
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
                  showDialog(
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
                                          fontSize: 16, color: Colors.black),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                    SizedBox(height: 12),
                                    Divider()
                                  ]),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 15, 15, 5),
                            actions: [
                              Center(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/confirm.png"),
                                      width: 32,
                                    )),
                              )
                            ],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)));
                      });
                })
          ],
        ),
        body: Column(
          children: [
            Image(
              width: double.infinity,
              image: AssetImage("assets/images/write_header.png"),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(15.0),
              child: Column(children: [
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: new Border.all(
                      color: kYellowColor.withOpacity(0.3),
                      width: 1.0,
                    ),
                  ),
                  height: 50,
                  child: TextField(
                      style: TextStyle(fontSize: 16),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none,
                          hintText: '제목을 입력하세요',
                          hintStyle: TextStyle(
                            fontFamily: "GmarketSans",
                            fontSize: 15,
                          ))),
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: new Border.all(
                      color: kYellowColor.withOpacity(0.3),
                      width: 1.0,
                    ),
                  ),
                  height: 500,
                  child: TextField(
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none,
                          hintText:
                              '내용을 입력하세요\n\n\n\n *커뮤니티 이용규칙\n\n *욕설, 비속어 사용 시 글 작성이 제한될 수 있습니다.',
                          hintStyle: TextStyle(
                              fontFamily: "GmarketSans",
                              fontSize: 14,
                              fontWeight: FontWeight.w300))),
                )
              ]),
            )
          ],
        ));
  }
}

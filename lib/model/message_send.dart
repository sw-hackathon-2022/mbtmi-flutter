import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbtmi/constants.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() async {
    print("send message");
    FocusScope.of(context).unfocus();
    //final user = "ESTJ";
    /*final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get(); */
    //현재 모든 유저의 데이터를 담음
    /*FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userID': user.uid,
      'userName': userData.data()!['userId']
    });*/
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: '댓글을 입력하세요',
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'GmarketSans',
                      fontWeight: FontWeight.w300,
                      fontSize: 13),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: kYellowColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: kYellowColor),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _userEnterMessage = value;
                  });
                },
              ),
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: SvgPicture.asset(
              'assets/svg/detail_send.svg',
              color: kYellowColor,
              width: 25,
            ),
          ),
        ],
      ),
    );
  }
}

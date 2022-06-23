import 'package:flutter/material.dart';
import 'package:mbtmi/constants.dart';

class MbtiChip extends StatefulWidget {
  MbtiChip(
      {Key? key,
      required this.leftText,
      required this.rightText,
      required this.isLeftChecked,
      required this.isRightChecked,
      required this.onLeftClick,
      required this.onRightClick})
      : super(key: key);

  final String leftText;
  final String rightText;
  bool isLeftChecked;
  bool isRightChecked;
  final VoidCallback onLeftClick;
  final VoidCallback onRightClick;

  @override
  State<MbtiChip> createState() => _MbtiChipState();
}

class _MbtiChipState extends State<MbtiChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1.5)),
      child: IntrinsicHeight(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            onTap: widget.onLeftClick,
            child: Container(
              width: 32,
              margin: EdgeInsets.all(2),
              color: widget.isLeftChecked ? kYellowColor : Colors.white,
              child: Center(
                  child: Text(
                widget.leftText,
                style: TextStyle(fontSize: 11),
              )),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: VerticalDivider(
              color: Colors.black,
              width: 1,
              thickness: 1.5,
            ),
          ),
          GestureDetector(
            onTap: widget.onRightClick,
            child: Container(
              width: 32,
              margin: EdgeInsets.all(2),
              color: widget.isRightChecked ? kYellowColor : Colors.white,
              child: Center(
                  child: Text(
                widget.rightText,
                style: TextStyle(fontSize: 11),
              )),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            ),
          ),
        ]),
      ),
    );
  }
}

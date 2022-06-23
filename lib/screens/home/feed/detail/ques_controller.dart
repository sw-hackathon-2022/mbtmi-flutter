import 'package:get/get.dart';

class QuestController extends GetxController {
  var pageIdx = 0.obs;
  var heart = <int>[];
  void changeColor(int _pageIdx) {
    if (pageIdx.value >= 1) {
      heart.add(-1);
      pageIdx.value = 0;
      update();
    } else {
      heart.add(pageIdx.value);
      pageIdx.value = _pageIdx;
      update();
    }
  }
}

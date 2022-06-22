import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var pageIdx = 1.obs;
  var history = <int>[];
  void changePage(int _pageIdx) {
    history.add(pageIdx.value);
    pageIdx.value = _pageIdx;
    update();
  }
}

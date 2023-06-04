import 'package:get/get.dart';
import 'package:onetimebill/tabscreen.dart';

class NavigatorController extends GetxController {
  RxInt NavigatIndex = 0.obs;
  RxList Screens = [
    tab(),
  ].obs;
}

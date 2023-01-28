import 'package:get/get.dart';

import '../model/experience.dart';

class DataController extends GetxController {
  RxInt bottombar = 0.obs;
  RxBool iscurrent = false.obs;

  RxString name = ''.obs;
  RxString address = ''.obs;
  RxString email = ''.obs;
  RxString mobileno = ''.obs;
  RxString course = ''.obs;
  RxString college = ''.obs;
  RxString mark = ''.obs;
  RxString year = ''.obs;
  RxString organization = ''.obs;
  RxString designation = ''.obs;
  RxString role = ''.obs;
  RxString from = ''.obs;
  RxString to = ''.obs;

  RxList<Experience> explist = <Experience>[].obs;
  RxList<Project> projectlist = <Project>[].obs;
}
import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxBool isLoading = false.obs;

  void startLoading() {
    isLoading(true);
  }

  void stopLoading() {
    isLoading(false);
  }
}
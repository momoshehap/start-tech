import 'package:get/get.dart';
import '../../controller/update/update_controller.dart';

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateController());
  }
}
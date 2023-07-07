import 'package:best_status/controllers/details_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }

}
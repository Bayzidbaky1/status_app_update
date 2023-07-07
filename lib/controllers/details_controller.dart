import 'package:best_status/helper/detailsHelper.dart';
import 'package:best_status/model/detailsModel.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController{
  var isLoading = false.obs;
  var detailsData = DetailsModel().obs;

  getData (String slug) async {
    isLoading.value = true;
    final data = await DetailsHelper().getData(slug);
    detailsData.value = data!;
    isLoading.value = false;
    update();
    print('From Controller --- ${detailsData}');
  }
}
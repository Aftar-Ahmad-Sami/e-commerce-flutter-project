import 'package:get/get.dart';

import 'Model/categoryModel.dart';
import 'repository.dart';

class Controller extends GetxController {
  var catList = List<CAtegory>.empty().obs;
  var isLoadingCategory = true.obs;

  void fatchCatData() async {
    print("calling caat");
    try {
      isLoadingCategory(true);
      var catData = await RemoteService.getCategory();

      if (catData != null) {
        catList.value = catData;
      }
    } finally {
      isLoadingCategory(false);
    }
  }
}

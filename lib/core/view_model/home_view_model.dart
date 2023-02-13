import 'package:dummy_ecomerce/core/enum/api_status.dart';
import 'package:dummy_ecomerce/core/model/product_model.dart';
import 'package:dummy_ecomerce/core/services/home_service.dart';
import 'package:dummy_ecomerce/core/view_model/base_view_modal.dart';

import '../model/response_model.dart';

class HomeViewModel extends BaseViewModal {
  late HomeService _homeService;

  set homeService(HomeService value) {
    _homeService = value;
  }

  List<ProductModel> products = [];

  Future<ResponseModel> fetchAllProduct() async {
    busy = true;
    final res = await _homeService.fetchAllProducts();
    if (res.status == ApiStatus.success) {
      products = res.data ?? [];
    }
    busy = false;
    return res;
  }
}

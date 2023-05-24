
import 'package:ecommerce/data/models/product_by_category_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  bool _getProductByCategoryInProgress = false;

  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();

  bool get getProductByCategoryInProgress => _getProductByCategoryInProgress;
  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;
  
  
  Future<bool> getProductByCategory(int categoryId)async{
    _getProductByCategoryInProgress = true;
    update();
    
    final response = await NetworkCaller.getRequest(url: "/ListProductByCategory/$categoryId");
    _getProductByCategoryInProgress = false;
    update();
    if(response.isSuccess){
      _productByCategoryModel = ProductByCategoryModel.fromJson(response.returnData);

      return true;
    }else{
      return false;
    }
  }
}
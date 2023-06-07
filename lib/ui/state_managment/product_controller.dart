import 'package:ecommerce/data/models/product_by_category_model.dart';
import 'package:ecommerce/data/models/product_details_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  bool _getProductByCategoryInProgress = false, _getProductsDetailsInProgress = false;

  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get getProductByCategoryInProgress => _getProductByCategoryInProgress;
  bool get getProductsDetailsInProgress => _getProductsDetailsInProgress;

  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  Future<bool> getProductByCategory(int categoryId)async{
    _getProductByCategoryInProgress = true;
    update();
    
    final response = await NetworkCaller.getRequest(url: "/ListProductByCategory/$categoryId");
    _getProductByCategoryInProgress = false;
    update();
    if(response.isSuccess){
      _productByCategoryModel = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      return false;
    }
  }
  Future<bool> getProductsDetails(int productId)async{
    _getProductsDetailsInProgress = true;
    final response = await NetworkCaller.getRequest(url: "/ProductDetailsById/$productId");
    _getProductsDetailsInProgress = false;
    update();
    if(response.isSuccess){
      _productDetailsModel = ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      return false;
    }
  }
}
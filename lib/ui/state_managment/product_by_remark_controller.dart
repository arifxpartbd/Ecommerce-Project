
import 'package:ecommerce/data/models/product_by_category_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:get/get.dart';

class ProductByRemarkController extends GetxController{
  
  bool _getPopularProductByRemarkInProgress = false;
  bool _getNewProductByRemarkInProgress = false;
  bool _getSpecialProductByRemarkInProgress = false;

  ProductByCategoryModel _productByRemarkModel = ProductByCategoryModel();
  ProductByCategoryModel _newByRemarkModel = ProductByCategoryModel();
  ProductByCategoryModel _specialByRemarkModel = ProductByCategoryModel();

  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;
  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;
  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;

  ProductByCategoryModel get productByRemarkModel => _productByRemarkModel;
  ProductByCategoryModel get newproductByRemarkModel => _newByRemarkModel;
  ProductByCategoryModel get specialproductByRemarkModel => _specialByRemarkModel;

  Future<bool> getPopularProductByRemark()async{
    _getPopularProductByRemarkInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/ListProductByRemark/popular");
    if(response.isSuccess){
      update();
      _productByRemarkModel = ProductByCategoryModel.fromJson(response.returnData);
      _getPopularProductByRemarkInProgress = false;
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

  Future<bool> getNewProductByRemark()async{
    _getNewProductByRemarkInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/ListProductByRemark/new");
    if(response.isSuccess){
      update();
      _newByRemarkModel = ProductByCategoryModel.fromJson(response.returnData);
      _getNewProductByRemarkInProgress = false;
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

  Future<bool> getSpecialProductByRemark()async{
    _getSpecialProductByRemarkInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/ListProductByRemark/special");
    if(response.isSuccess){
      update();
      _specialByRemarkModel = ProductByCategoryModel.fromJson(response.returnData);
      _getSpecialProductByRemarkInProgress = false;
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}
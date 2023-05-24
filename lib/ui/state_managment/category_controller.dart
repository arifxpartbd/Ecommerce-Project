
import 'package:ecommerce/data/models/catetory_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  CategoryModelData _categoryModelData = CategoryModelData();
  bool _getCategoryInProgress = false;
  
  bool get getCategoryInProgress => _getCategoryInProgress;
  
  CategoryModelData get categoryModelData =>_categoryModelData;

  Future<bool> getCategores() async{
    _getCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/CategoryList");
    if(response.isSuccess){
      update();
      _getCategoryInProgress = false;
      _categoryModelData = CategoryModelData.fromJson(response.returnData);
      update();
      return true;

    }else{
      update();
      return false;
    }
    
  }
}
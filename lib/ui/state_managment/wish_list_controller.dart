
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  bool _addNewItemInProgress = false;

  bool get addNewItemInProgress => _addNewItemInProgress;
  
  Future<bool> addToWishList(int productId) async{
    _addNewItemInProgress = true;
    update();
    
    final response = await NetworkCaller.getRequest(url: "/CreateWishList/$productId");
    _addNewItemInProgress = false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      if(response.statusCode == 401){
        Get.find<AuthController>().logout();
      }
      update();
      return false;
    }
  }
}
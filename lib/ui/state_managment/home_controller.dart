
import 'package:ecommerce/data/models/home_slider_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  bool _getSliderInProgress = false;

  HomeSliderModel _homeSliderModel = HomeSliderModel();
  bool get getSliderInProgress => _getSliderInProgress;
  HomeSliderModel get homeSliderModel => _homeSliderModel;


  Future<bool> getHomeSlider() async{
    _getSliderInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: "/ListProductSlider");
    if(response.isSuccess){
      _homeSliderModel = HomeSliderModel.fromJson(response.returnData);
      update();
      _getSliderInProgress = false;
      update();
      return true;
    }else{
      return false;
    }
  }
}
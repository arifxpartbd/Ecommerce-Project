import 'package:get/get.dart';

import '../../data/service/network_caller.dart';

class CompletProfileController extends GetxController{

  bool _completProfileInProgress = false;

  bool get completProfileInProgress => _completProfileInProgress;

  Future<bool> completProfile(String firstName, String lastName, String mobileNo, String city, String shippingAddres)async{
    _completProfileInProgress = true;
    update();
    final response = await NetworkCaller.postRequest(url: "/CreateProfile",
    body: {
      "firstName": firstName,
      "lastName":lastName,
      "mobile": mobileNo,
      "city": city,
      "shippingAddress": shippingAddres,
    });
    if(response.isSuccess){
      _completProfileInProgress = false;
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}
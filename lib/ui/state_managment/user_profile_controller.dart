
import 'package:ecommerce/data/models/profile_data_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:ecommerce/ui/screens/complet_profile_screen.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{

  bool _getProfileDataInProgress = false;
  bool get getProfileDataInProgress =>_getProfileDataInProgress;

  Future<bool> getProfileData()async{
    _getProfileDataInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: "/ReadProfile");

    _getProfileDataInProgress =false;
    update();

    if(response.isSuccess){
      final ProfileDataModel profileDataModel = ProfileDataModel.fromJson(response.returnData);
      if(profileDataModel.data != null) {
        Get.find<AuthController>().saveProfileData(profileDataModel.data!.first);
      }else{
        Get.to(CompleteProfileScreen());
      }
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

}
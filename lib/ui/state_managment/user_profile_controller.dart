
import 'package:ecommerce/data/models/profile_data_model.dart';
import 'package:ecommerce/data/service/network_caller.dart';
import 'package:ecommerce/ui/screens/complet_profile_screen.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{

  bool _getProfileDataInProgress = false;
  bool get getProfileDataInProgress => _getProfileDataInProgress;

  ProfileDataModel _profileDataModel = ProfileDataModel();

  ProfileDataModel get profileDataModel => _profileDataModel;

  Future<bool> getProfileData()async{
    _getProfileDataInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: "/ReadProfile");
    _getProfileDataInProgress = false;
    //update();
    if(response.isSuccess){
      _profileDataModel = ProfileDataModel.fromJson(response.returnData);
      //update();
      Get.find<AuthController>().saveProfileData(_profileDataModel.data!.first);
      //final ProfileDataModel profileDataModel = ProfileDataModel.fromJson(response.returnData);
      //update();
      if(_profileDataModel.data!= null) {
        Get.find<AuthController>().saveProfileData(_profileDataModel.data!.first);
      }else{
        Get.to(const CompleteProfileScreen());
      }
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

}
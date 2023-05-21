import 'dart:convert';

import 'package:ecommerce/data/models/profile_data_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? _token;
  static String? get token => _token;
  static ProfileData? _profileData;

  static ProfileData? get profileData => _profileData;

  Future<void> saveToken(String userToekn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = userToekn;
    await preferences.setString("token", userToekn);
  }

  Future<void> saveProfileData(ProfileData profileData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = profileData;
    await preferences.setString("profileData", profileData.toJson().toString());
  }

  Future<void> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(
        jsonDecode(preferences.getString("profileData") ?? "{}"));
  }

  Future<void> getProfileData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString("token");
  }

  Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    if (_token == null) {
      return false;
    } else {
      return true;
    }
  }
}

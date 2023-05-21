
import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/data/models/response_model.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:http/http.dart';

import '../utils/urls.dart';

class NetworkCaller {
  //singleton
  NetworkCaller._();
  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(
        Uri.parse(
          Urls.baseUrl + url),
        headers:{"Content-Type": "application/json",
          "Accept": "application/json",
          "token": AuthController.token.toString()}
      );
      log(response.body);

      if (response.statusCode == 200) {
        return ResponseModel(
          isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body),
            isSuccess: false);
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          statusCode: -1,
          returnData: e.toString(),
          isSuccess: false);
    }
  }
}

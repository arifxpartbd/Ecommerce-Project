import 'package:ecommerce/ui/state_managment/complet_profile_controller.dart';
import 'package:ecommerce/ui/utils/styles.dart';
import 'package:ecommerce/ui/widgets/commonElevatedButton.dart';
import 'package:ecommerce/ui/widgets/commonTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key, this.firstName, this.lastName, this.mobileNo, this.cityName, this.shippingaddress}) : super(key: key);

  final String? firstName, lastName, mobileNo, cityName, shippingaddress;
  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    firstNameController.text = widget.firstName.toString();
    lastNameController.text = widget.lastName.toString();
    cityController.text = widget.cityName.toString();
    mobileNoController.text = widget.mobileNo.toString();
    shippingAddressController.text = widget.shippingaddress.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 120.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Complete Profile",
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Get Started with us with your details",
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextField(
                    controller: firstNameController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please type your first name";
                      }
                      return null;
                    },
                    hintText: "First Name",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextField(
                    controller: lastNameController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please type your last name";
                      }
                      return null;
                    },
                    hintText: "Last Name",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextField(
                    textInputType: TextInputType.number,
                    controller: mobileNoController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "type your valid mobile no";
                      }
                      return null;
                    },
                    hintText: "Mobile No",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextField(
                    controller: cityController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "please type your city name";
                      }
                      return null;
                    },
                    hintText: "City",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextField(
                    maxLine: 5,
                    controller: shippingAddressController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please type your shipping address";
                      }
                      return null;
                    },
                    hintText: "Shipping Address",
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                 GetBuilder<CompletProfileController>(
                   builder: (completProfile) {
                     if(completProfile.completProfileInProgress){
                       return const Center(child: CircularProgressIndicator(),);
                     }
                     return CommonElevatedButton(title: "Complete",
                         onTap: (){
                       if(_globalKey.currentState!.validate()){
                       Get.find<CompletProfileController>()
                           .completProfile(
                           firstNameController.text,
                           lastNameController.text,
                           mobileNoController.text,
                           cityController.text,
                           shippingAddressController.text,
                       ).then((value) => Navigator.pop(context));
                         }}
                     );
                   }
                 )

                 // _isLoading? const Center(child: CircularProgressIndicator(),):
                  // CommonElevatedButton(
                  //   title: "Complete",
                  //   onTap: () async {
                  //     _isLoading = true;
                  //     setState(() {
                  //
                  //     });
                  //     if(_globalKey.currentState!.validate()){
                  //       final response = await NetworkCaller.postRequest(url: "/CreateProfile",
                  //         body: {
                  //           "firstName":firstNameController.text,
                  //           "lastName":lastNameController.text,
                  //           "mobile":mobileNoController.text,
                  //           "city": cityController.text,
                  //           "shippingAddress":shippingAddressController.text
                  //         }
                  //       );
                  //       if(response.isSuccess){
                  //         _isLoading = false;
                  //         setState(() {
                  //
                  //         });
                  //         if(mounted){
                  //           Navigator.pop(context);
                  //         }
                  //         return response.returnData;
                  //       }else{
                  //         _isLoading = false;
                  //         setState(() {
                  //
                  //         });
                  //
                  //       }
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

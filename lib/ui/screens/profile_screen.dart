import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/complet_profile_screen.dart';
import 'package:ecommerce/ui/screens/wish_list_screen.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:ecommerce/ui/state_managment/user_profile_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:ecommerce/ui/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Get.find<UserProfileController>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Profile Screen"),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Get.find<UserProfileController>().getProfileData();
          },
          child: GetBuilder<UserProfileController>(builder: (userProfileInfo) {
            if (userProfileInfo.getProfileDataInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final userdata = userProfileInfo.profileDataModel.data!.first;
            return ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 75,
                            backgroundColor: primaryColor,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/arif.jpeg'),
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      50,
                                    ),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(2, 4),
                                      color: Colors.black.withOpacity(
                                        0.3,
                                      ),
                                      blurRadius: 3,
                                    ),
                                  ]),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.add_a_photo,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${userdata.firstName} ${userdata.lastName}",
                            style: titleTextStyle,
                          ),
                          Text(
                            AuthController.profileData?.email.toString() ??
                                "User mail",
                            style: subTitleTextStyle,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CompleteProfileScreen(
                                        firstName: userdata.firstName,
                                        lastName: userdata.lastName,
                                        shippingaddress:
                                            userdata.shippingAddress,
                                        cityName: userdata.city,
                                        mobileNo: userdata.mobile,
                                      ),
                                    ));
                              },
                              child: const Text("Edit Profile"))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Get.to(const WishListScreen());
                  },
                  title: const Text("Wishlist"),
                  leading: const Icon(Icons.favorite_border),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                ListTile(
                  onTap: () {
                    Get.to(CartScreen());
                  },
                  title: const Text("My Cart List"),
                  leading: const Icon(Icons.shopping_cart_rounded),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                ExpansionTile(
                  title: const Text("Personal Info"),
                  children: [
                    ListTile(
                      title: const Text("City"),
                      leading: const Icon(Icons.location_city),
                      subtitle: Text(userdata.city.toString()),
                    ),
                    ListTile(
                      title: const Text("Shipping Address"),
                      leading: const Icon(Icons.location_on),
                      subtitle: Text(userdata.shippingAddress.toString()),
                    ),
                    ListTile(
                      title: const Text("Mobile No"),
                      leading: const Icon(Icons.call),
                      subtitle: Text(userdata.mobile.toString()),
                    ),
                  ],
                ),
              ],
            );
          }),
        ));
  }
}

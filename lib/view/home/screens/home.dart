import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startech/core/dialog/x_general_dialog.dart';
import 'package:startech/core/strings.dart';
import '../../../controller/home/home_controller.dart';
import '../../../routes/app_routes.dart';
import '../widget/profile_action.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      homeController.getUserFromCache();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            'Home Page',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'AlexandriaFLF'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
          child: Column(
            children: [
              homeController.user == null
                  ? Container()
                  : Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: AppColors.primary,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            homeController.name.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gray60,
                                fontFamily: 'AlexandriaFLF'),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
              homeController.user == null
                  ? Container()
                  : Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: AppColors.primary,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            homeController.countryCode +
                                homeController.phone.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gray60,
                                fontFamily: 'AlexandriaFLF'),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: AppColors.primary,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      homeController.email.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.gray60,
                          fontFamily: 'AlexandriaFLF'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileAction(
                text: 'Update Information',
                onPressed: () {
                  Get.toNamed(AppRoutes.update);
                },
              ),
              ProfileAction(
                text: 'Change Password',
                onPressed: () {
                 Get.toNamed(AppRoutes.changePassword);

                },
              ),
              ProfileAction(
                text: 'Delete Account',
                onPressed: () {

                   context.showGeneralDialog(
                                        image:  "assets/logo/delete.svg",
                                      title: "Are you sure you want to Delete your Account?",
                                     cancelText: "Cancel",
                                      onCancel: (){
                                       Navigator.of(context).pop();
                                      },
                                      confirmText: "Delete",
                                      onConfirm:  (){
                                homeController.deleteProfile();
                  homeController.removeUserFromCache();
                  Get.offNamed(AppRoutes.wellcom);
                                              }                                  
                                                        );
               
                },
              ),
              ProfileAction(
                text: 'Logout',
                onPressed: () {

                  context.showGeneralDialog(
                                        image:  "assets/logo/logout.svg",
                                      title: "Are you sure you want to Log Out?",
                                     cancelText: "Cancel",
                                      onCancel: (){
                                       Navigator.of(context).pop();
                                      },
                                      confirmText: "Log out",
                                      onConfirm:  (){
                               homeController.removeUserFromCache();
                  Get.offNamed(AppRoutes.login);
                                              }                                  
                                                        );
                 
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    });
  }
}

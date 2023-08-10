import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startech/core/strings.dart';
import '../../../controller/home/home_controller.dart';
import '../../../routes/app_routes.dart';
import '../widget/profile_action.dart';

class HomePage extends StatelessWidget {
final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        homeController.getUserFromCache();

       return  Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primary,
          title: const Text('Home Page' ,
           style: TextStyle(color: AppColors.white,
               fontSize: 20,
               fontWeight: FontWeight.bold,
               fontFamily: 'AlexandriaFLF'
        ),
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
          child: Column(
            children: [
           homeController.user==null?Container():   Row(
                children: [
                const  Icon(Icons.person,color: AppColors.primary,),
                  const SizedBox(width: 20,),
                  Text(homeController.name.toString(),style: const TextStyle( fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray60,
                  fontFamily: 'AlexandriaFLF'
                  ),),
                ],
              ),               const SizedBox(height: 10,),

               homeController.user==null?Container():   Row(
                children: [
                  const Icon(Icons.phone,color: AppColors.primary,),
                  const SizedBox(width: 20,),
                  Text(homeController.countryCode+homeController.phone.toString(),style: const TextStyle( fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray60,
                  fontFamily: 'AlexandriaFLF'
                  ),),
                ],
              ),                 
               const SizedBox(height: 10,),
                 Row(
                children: [
                const  Icon(Icons.email,color: AppColors.primary,),
                  const SizedBox(width: 20,),
                 
                  Text(homeController.email.toString(),
                  style: const TextStyle( fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray60,
                  fontFamily: 'AlexandriaFLF'
                  ),),
                ],
              ),
                             const SizedBox(height: 40,),

                ProfileAction(
                    text: 'Update Information',
                    onPressed: () {
                                          Get.toNamed(AppRoutes.update);

                    },
                  ),
                  ProfileAction(
                    text: 'Change Password',
                    onPressed: () {

                    },
                  ),
                  ProfileAction(
                    text: 'Delete Account',
                    onPressed: () {
                     homeController.deleteProfile();
                     homeController.removeUserFromCache();
                       Get.offNamed(AppRoutes.wellcom);
                    },
                  ),
                  ProfileAction(
                    text: 'Logout',
                    onPressed: () {
                     homeController.removeUserFromCache();
                       Get.offNamed(AppRoutes.login);
                    },
                  ),
                  const SizedBox(height: 16),
            ],
          ),
        ),
      );}
    );
  }
}
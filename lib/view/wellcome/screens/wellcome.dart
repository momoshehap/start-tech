import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/buttons/custom_button.dart';
import '../../../core/buttons/custom_outlined_button.dart';
import '../../../core/strings.dart';
import '../../../routes/app_routes.dart';


class WellcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric( vertical:50.0,horizontal: 20),
          child: Column(
            children: [
              Container(width: 100,height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
            const Text("Wellcome to the app",
            style: TextStyle(fontSize: 20, color: AppColors.primary,fontWeight: FontWeight.bold,fontFamily: 'AlexandriaFLF'),),
           const Spacer(),
           CustomButton(text: "Login",onPressed: (){
                  Get.offNamed(AppRoutes.login);
            
           },),
           CustomOutlinedButton(text: "Register",onPressed: () {
                         Get.offNamed(AppRoutes.signup,);
            
           },),
           const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

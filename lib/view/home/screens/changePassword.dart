import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startech/core/strings.dart';

import '../../../controller/change password/changePassword_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/buttons/custom_button.dart';
import '../../../core/text_fields/custom_form_field.dart';
import '../../../core/validators.dart';

class ChangePassword extends StatelessWidget {
final HomeController homeController = Get.put(HomeController());
final ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
homeController.getUserFromCache();
final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primary,
          title: const Text('Change Password' ,
           style: TextStyle(color: AppColors.white,
               fontSize: 20,
               fontWeight: FontWeight.bold,
               fontFamily: 'AlexandriaFLF'
        ),
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
            
                               const SizedBox(height: 40,),
           const SizedBox(height: 24),
                            CustomFormField(
                              title: 'Current Password',
                              label: 'Current Password',
                              controller: _currentPasswordController,
                              validate: FormsValidators.password,
                                    isSecretValue: true,
                              
                            ),
                            const SizedBox(height: 15),
                             Row(
                               children: [
                                
                                 Expanded(
                                   child: CustomFormField(
                                    
                                    title: 'New Password',
                                    label: 'New Password',
                                    controller: _newPasswordController,
                                    validate: FormsValidators.password,
                                    isSecretValue: true,

                                                           ),
                                 ),
                               ],
                             ),
                            const SizedBox(height: 15),
                             CustomFormField(
                              title: 'Confirm Password',
                              label: 'Confirm Password',
                              controller: _confirmPasswordController,
                                                          validate: (confirmation) =>

FormsValidators.confirmPassword(
                          _newPasswordController.text.toString(),
                          _confirmPasswordController.text.toString() ,
                        ),
                            isSecretValue: true,                              
                            ),
                            const SizedBox(height: 15),
                  CustomButton(text: "Change",
                 onPressed: (){
                      if (formKey.currentState!.validate()) {
                        changePasswordController.changePassword(
                          password:_newPasswordController.text.toString(),
                          passwordConfirm: _confirmPasswordController.text.toString(),
                        currentPassword:_currentPasswordController.text.toString(),
                        token: homeController.user!.data.token
                     
                       );
                        }
                  
                 },),
                    const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
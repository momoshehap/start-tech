import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startech/core/strings.dart';

import '../../../controller/home/home_controller.dart';
import '../../../controller/update/update_controller.dart';
import '../../../core/buttons/custom_button.dart';
import '../../../core/text_fields/custom_form_field.dart';
import '../../../core/validators.dart';

class UpdatePage extends StatelessWidget {
final HomeController homeController = Get.put(HomeController());
final UpdateController updateController = Get.put(UpdateController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
homeController.getUserFromCache();
final TextEditingController _nameController = TextEditingController(text: homeController.user!.data.name);
  final TextEditingController _phoneController = TextEditingController(text: homeController.user!.data.phone);
  final TextEditingController _emailController = TextEditingController(text: homeController.user!.data.email);
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primary,
          title: const Text('Update Information' ,
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
                              title: 'Full Name',
                              label: 'Full Name',
                              controller: _nameController,
                              validate: FormsValidators.hasValue,
                              
                            ),
                            const SizedBox(height: 15),
                             Row(
                               children: [
                                
                                 Expanded(
                                   child: CustomFormField(leading: SizedBox(width: 100,
                                  child: CountryCodePicker(
                                                            flagDecoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7),
                                                          ),     
                                                          onChanged: (value) {
                                                        updateController.countryCode=value.toString();                                                        },                       // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                                            initialSelection: homeController.countryCode.toString(),
                                                            // optional. Shows only country name and flag
                                                            showCountryOnly: false,
                                                            // optional. Shows only country name and flag when popup is closed.
                                                            showOnlyCountryWhenClosed: false,
                                                            // optional. aligns the flag and the Text left
                                                            alignLeft: false,
                                  ),
                                ),
                                    title: 'phone number',
                                    label: '55687439',
                                    controller: _phoneController,
                                    validate: FormsValidators.phoneNumber,
                                    
                                                           ),
                                 ),
                               ],
                             ),
                            const SizedBox(height: 15),
                             CustomFormField(
                              title: 'email',
                              label: 'Email Adrees',
                              controller: _emailController,
                              validate: FormsValidators.email,
                              
                            ),
                            const SizedBox(height: 15),
                  CustomButton(text: "Save",
                 onPressed: (){
                      if (formKey.currentState!.validate()) {
                        updateController.updateProfile(
                          name:_nameController.text.toString(),
                          phone: _phoneController.text.toString(),
                        email:_emailController.text.toString(),
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
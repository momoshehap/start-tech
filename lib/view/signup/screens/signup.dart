import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login/login_controller.dart';
import '../../../controller/signup/signup_controller.dart';
import '../../../core/buttons/custom_button.dart';
import '../../../core/strings.dart';
import '../../../core/text_fields/custom_form_field.dart';
import '../../../core/validators.dart';
import '../../../routes/app_routes.dart';


class SignupPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
           final SignupController signupController = Get.put(SignupController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric( vertical:50.0,horizontal: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                const Text("Register",
                style: TextStyle(fontSize: 30, color: AppColors.primary,fontWeight: FontWeight.bold,fontFamily: 'AlexandriaFLF'),),
                   const Divider(color: Colors.grey),
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
                                                      signupController.countryCode=value.toString();                                                        },                       // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                                          initialSelection: 'IT',
                                                          favorite: ['+39',],
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
                          CustomFormField(
                            title: 'password',
                            label: 'Password',
                            controller: _passwordController,
                            validate: FormsValidators.password,
                            isSecretValue: true,
                            
                          ), const SizedBox(height: 15),
                          CustomFormField(
                            title: 'confirm password',
                            label: 'confirm Password',
                            controller: _confirmPasswordController,
                            validate: (confirmation) =>
                            FormsValidators.confirmPassword(
                          _passwordController.text.toString(),
                          _confirmPasswordController.text.toString() ,
                        ),
                            isSecretValue: true,
                            
                          ),
                          const SizedBox(height: 15),
               CustomButton(text: "Register",
               onPressed: (){
                    if (formKey.currentState!.validate()) {
                      signupController.signup(
                        name:_nameController.text.toString(),
                        phone: _phoneController.text.toString(),
                      email:_emailController.text.toString(),
                    password: _passwordController.text.toString()
                     ).then((value) {             
                       value==null?null: !value?Get.offNamed(AppRoutes.home):null;

                      });
                      }
                
               },),
                                     const SizedBox(height: 24),
                      
               Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have account?',
               style: TextStyle(color: AppColors.primary,
               fontSize: 15,
               fontWeight: FontWeight.bold,
               fontFamily: 'AlexandriaFLF'),
                      
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.login);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.blue,fontSize: 15,
               fontWeight: FontWeight.bold,fontFamily: 'AlexandriaFLF'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

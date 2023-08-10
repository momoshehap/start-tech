import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/login/login_controller.dart';
import '../../../core/buttons/custom_button.dart';
import '../../../core/strings.dart';
import '../../../core/text_fields/custom_form_field.dart';
import '../../../core/validators.dart';
import '../../../routes/app_routes.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
           final LoginController loginController = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric( vertical:50.0,horizontal: 20),
          child: Form(
            key: formKey,
            child: Container(
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
                const Text("Login",
                style: TextStyle(fontSize: 30, color: AppColors.primary,fontWeight: FontWeight.bold,fontFamily: 'AlexandriaFLF'),),
               const Spacer(),
                   const Divider(color: Colors.grey),
                          const SizedBox(height: 24),
                          CustomFormField(
                            title: 'email',
                            label: 'Email Adrees',
                            controller: _emailController,
                            validate: FormsValidators.email,
                            
                          ),
                          const SizedBox(height: 24),
                          CustomFormField(
                            title: 'password',
                            label: 'Password',
                            controller: _passwordController,
                            validate: FormsValidators.password,
                            isSecretValue: true,
                            
                          ),
                          const SizedBox(height: 24),
               CustomButton(text: "Login",
               onPressed: (){
                    if (formKey.currentState!.validate()) {
                      loginController.login(_emailController.text.toString(), _passwordController.text.toString()).then((value) {
                        !value?Get.offNamed(AppRoutes.home):null;
                      });
                      }
                
               },),
                                     const SizedBox(height: 24),
                      
               Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('dosen\'t have account?',
               style: TextStyle(color: AppColors.primary,
               fontSize: 15,
               fontWeight: FontWeight.bold,
               fontFamily: 'AlexandriaFLF'),
                      
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.signup);
                        },
                        child: const Text(
                          'create one',
                          style: TextStyle(color: Colors.blue,fontSize: 15,
               fontWeight: FontWeight.bold,fontFamily: 'AlexandriaFLF'),
                        ),
                      ),
                    ],
                  ),
               const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

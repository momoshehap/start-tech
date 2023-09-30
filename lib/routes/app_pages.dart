
import 'package:get/get.dart';
import 'package:startech/binding/changePassword/changePassword_binding.dart';
import 'package:startech/view/home/screens/changePassword.dart';
import '../binding/home/home_binding.dart';
import '../binding/login/login_binding.dart';
import '../binding/signup/signup_binding.dart';
import '../binding/update/update_binding.dart';
import '../view/home/screens/home.dart';
import '../view/home/screens/update.dart';
import '../view/login/screens/login.dart';
import '../view/signup/screens/signup.dart';
import '../view/wellcome/screens/wellcome.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.wellcom,
      page: () => WellcomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.update,
      page: () => UpdatePage(),
      binding: UpdateBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => ChangePassword(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
import 'package:food_delivery/common/globs.dart';
import 'package:food_delivery/common/locator.dart';

typedef ResSuccess = Future<void> Function(Map<String, dynamic>);
typedef ResFailure = Future<void> Function(dynamic);

class ServiceCall {
  static final NavigationService navigationService = locator<NavigationService>();
  static Map userPayload = {};


  static void post(Map<String, dynamic> parameter, String path,
      {bool isToken = false, ResSuccess? withSuccess, ResFailure? failure}) {
    // Mocking the network call for a front-end only experience
    Future.delayed(const Duration(seconds: 1), () {
      if (withSuccess != null) {
        withSuccess({
          KKey.status: "1",
          KKey.message: "Success",
          KKey.payload: {
            KKey.name: parameter[KKey.name] ?? "Test User",
            KKey.email: parameter[KKey.email] ?? "test@gmail.com",
            KKey.mobile: parameter[KKey.mobile] ?? "1234567890",
            KKey.address: parameter[KKey.address] ?? "Test Address",
            KKey.userId: "1",
          }
        });
      }
    });
  }

  static void logout(){
    Globs.udBoolSet(false, Globs.userLogin);
    userPayload = {};
    navigationService.navigateTo("welcome");
  }


}

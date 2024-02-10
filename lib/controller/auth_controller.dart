

import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/navigation/page_navigation.dart';
import 'package:userapp/network/api_service.dart';
import 'package:userapp/utils/preference_utils.dart';
import 'package:userapp/utils/validation_utils.dart';
import '../model/auth/signin_model.dart';

class AuthController extends ChangeNotifier{

  //Form Key
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  //Network Service
  ApiService apiService = ApiService();
  //ApiRequest
  var signInModel = SignInModel();


  signIn(BuildContext context){
    if(loginKey.currentState!.validate()){
      if(ValidationUtils.emptyValidation(signInModel.username!) && ValidationUtils.emptyValidation(signInModel.password!)){
        context.loaderOverlay.show();
        apiService.signIn(signInModel).then((value){
          context.loaderOverlay.hide();
          PreferenceUtils.saveUserId(value.id!.toString());
          PreferenceUtils.saveUserToken(value.accessToken!);
          PageNavigation.gotoHomeScreen(context);
        }).catchError((e){
          context.loaderOverlay.hide();
          ValidationUtils.showAppToast("Something Wrong");
        });
      }else{
        ValidationUtils.showAppToast("All Fields are required");
      }
    }
  }



}
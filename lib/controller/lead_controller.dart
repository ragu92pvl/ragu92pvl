

import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/model/lead/lead_model.dart';

import '../network/api_service.dart';
import '../utils/validation_utils.dart';

class LeadController extends ChangeNotifier{

  //Form Key
  final GlobalKey<FormState> leadFormKey = GlobalKey<FormState>();
  //Network Service
  ApiService apiService = ApiService();
  //Variables
  var leadModel = LeadModel();
  var leadType = 0;


  addLeads(BuildContext context){
    if(leadFormKey.currentState!.validate()){
      if(ValidationUtils.emptyValidation(leadModel.name!)
          && ValidationUtils.emptyIntegerValidation(leadModel.mobile!)){
        context.loaderOverlay.show();
        apiService.addLeads(leadModel).then((value){
          context.loaderOverlay.hide();
        }).catchError((e){
          context.loaderOverlay.hide();
          ValidationUtils.showAppToast("Something Wrong");
        });
      }else{
        ValidationUtils.showAppToast("Name and Mobile Number are required.");
      }
    }
  }

}
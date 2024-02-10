

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/controller/lead_controller.dart';
import 'package:userapp/model/common_response_model.dart';
import 'package:userapp/model/product_model.dart';
import 'package:userapp/model/profile/profile_model.dart';
import 'package:userapp/network/api_service.dart';
import 'package:userapp/utils/preference_utils.dart';

import '../controller/auth_controller.dart';


final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
 return AuthController();
});

final profileDataProvider = FutureProvider<ProfileModel>((ref){
 return ref.watch(apiServiceProvider).getProfile();
});

final leadControllerProvider = ChangeNotifierProvider<LeadController>((ref) {
 return LeadController();
});



import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/model/auth/signin_model.dart';
import 'package:userapp/model/common_response_model.dart';
import 'package:userapp/model/lead/lead_model.dart';
import 'package:userapp/model/product_model.dart';
import 'package:userapp/model/profile/profile_model.dart';
import 'package:userapp/utils/preference_utils.dart';

class ApiService{

  Future<CommonResponseModel> signIn(SignInModel signInModel) async {
    try {
      Response response = await post(Uri.parse(ApiConstants.login),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: json.encode(signInModel.toJson()));
      print(ApiConstants.login);
      print(signInModel.toJson());
      if(response.statusCode == 200){
        CommonResponseModel model = CommonResponseModel.fromJson(json.decode(response.body));
        print(json.decode(response.body));
        return model;
      }else{
        throw Exception(response.reasonPhrase);
      }
    }catch(e){
      rethrow;
    }
  }

  Future<ProfileModel> getProfile() async {
    try {
        String? userToken = await PreferenceUtils.getUserToken();
        Response response = await get(Uri.parse(ApiConstants.profile),
          headers: {HttpHeaders.contentTypeHeader: 'application/json',HttpHeaders.authorizationHeader: 'Bearer $userToken'},);
        print(ApiConstants.profile);
        if(response.statusCode == 200){
          ProfileModel model = ProfileModel.fromJson(json.decode(response.body));
          return model;
        }else{
          throw Exception(response.reasonPhrase);
        }
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<CommonResponseModel> addLeads(LeadModel model) async {
    try {
      Response response = await post(Uri.parse(ApiConstants.leadCreate),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: json.encode(model.toJson()));
      print(ApiConstants.leadCreate);
      print(model.toJson());
      if(response.statusCode == 200){
        CommonResponseModel model = CommonResponseModel.fromJson(json.decode(response.body));
        print(json.decode(response.body));
        return model;
      }else{
        throw Exception(response.reasonPhrase);
      }
    }catch(e){
      rethrow;
    }
  }

}

final apiServiceProvider = Provider<ApiService>((ref)=>ApiService());


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/navigation/page_navigation.dart';
import 'package:userapp/utils/preference_utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      String? userId = await PreferenceUtils.getUserId();
      if(userId!=null){
        PageNavigation.gotoHomeScreen(context);
      }else{
        PageNavigation.gotoLoginScreen(context);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset("assets/images/logo.png",height: 250,width: 250,),
          ],
        ),
      ),
    );
  }
}



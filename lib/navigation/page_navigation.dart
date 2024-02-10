

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/page/home/home_page.dart';
import 'package:userapp/page/home/leads/add_leads_page.dart';
import 'package:userapp/page/login/login_screen.dart';
import 'package:userapp/page/notifications/notifications_page.dart';
import 'package:userapp/page/product_page.dart';

class PageNavigation{

  static gotoLoginScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  static gotoHomeScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  static gotoAddLeadPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddLeadsPage(),
      ),
    );
  }

  static gotoNotificationPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationPage(),
      ),
    );
  }


}
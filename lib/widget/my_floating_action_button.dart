

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/navigation/page_navigation.dart';
import 'package:userapp/page/home/leads/add_leads_page.dart';

class MyFAB extends StatefulWidget {
  MyFAB(AddLeadsPage addLeadsPage);
  @override
  _MyFABState createState() => _MyFABState();
}


class _MyFABState extends State<MyFAB> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 500),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue, // Set the background color of the FAB
      onPressed: () {
        PageNavigation.gotoAddLeadPage(context);
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.add_event, //
        color: Colors.white,// Choose any icon you want
        progress: _animationController,
      ),
    );
  }
}
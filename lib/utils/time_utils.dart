

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_util.dart';

class TimeUtils{

  static String convertMonthDateYear(String date){
    DateTime inputDate = DateFormat("dd-MM-yyyy").parse(date);
    return DateFormat("MMM dd, yyyy").format(inputDate);
  }

  static String convertUTC(String date){
    final DateTime dateTime = DateTime.parse(date);
    String formattedDateTime = DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
    return formattedDateTime;
  }

}
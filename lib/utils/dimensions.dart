import 'dart:ui';
import 'package:flutter/material.dart';

class AppDimensions {
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

  dimesions(BuildContext context){
    return view.physicalSize;
  }


  horizontalScreenPadding(BuildContext context){
    return MediaQuery.sizeOf(context).width * 0.04444444444444444444444;
  }
  verticalScreenPadding(BuildContext context){
    return MediaQuery.sizeOf(context).height * 0.04081632653061225;
  }

  Divider divider = const Divider(color: Colors.transparent,);
}
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';


class SpaceConfig{
  static const EdgeInsetsGeometry onlyTB6 = EdgeInsets.only(top: SizeConfig.s6, bottom: SizeConfig.s6);
  static const EdgeInsetsGeometry onlyTB12 = EdgeInsets.only(top: SizeConfig.margin, bottom: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyLR12 = EdgeInsets.only(left: SizeConfig.margin, right: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyLR6 = EdgeInsets.only(left: SizeConfig.s6, right: SizeConfig.s6);
  static const EdgeInsetsGeometry onlyLTB12 = EdgeInsets.only(left: SizeConfig.margin, top: SizeConfig.margin,bottom: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyTR12 = EdgeInsets.only(top: SizeConfig.margin, right: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyL12B8 = EdgeInsets.only(left: SizeConfig.margin, bottom: SizeConfig.s8);
  static const EdgeInsetsGeometry onlyLR12B8 = EdgeInsets.only(left: SizeConfig.margin,right: SizeConfig.margin, bottom: SizeConfig.s8);
  static const EdgeInsetsGeometry onlyLR12T8 = EdgeInsets.only(left: SizeConfig.margin,right: SizeConfig.margin, top: SizeConfig.s8);
  static const EdgeInsetsGeometry onlyL6 = EdgeInsets.only(left: SizeConfig.s6);
  static const EdgeInsetsGeometry onlyR6 = EdgeInsets.only(right: SizeConfig.s6);
  static const EdgeInsetsGeometry onlyL12 = EdgeInsets.only(left: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyR12 = EdgeInsets.only(right: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyR20 = EdgeInsets.only(right: SizeConfig.s20);
  static const EdgeInsetsGeometry onlyT6 = EdgeInsets.only(top: SizeConfig.s6);
  static const EdgeInsetsGeometry onlyT12 = EdgeInsets.only(top: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyT20 = EdgeInsets.only(top: SizeConfig.s20);
  static const EdgeInsetsGeometry onlyT30 = EdgeInsets.only(top: SizeConfig.s30);
  static const EdgeInsetsGeometry onlyT40 = EdgeInsets.only(top: SizeConfig.s40);
  static const EdgeInsetsGeometry onlyTL12 = EdgeInsets.only(top: SizeConfig.margin,left: SizeConfig.s12);
  static const EdgeInsetsGeometry onlyB5 = EdgeInsets.only(bottom: SizeConfig.s5);
  static const EdgeInsetsGeometry onlyB12 = EdgeInsets.only(bottom: SizeConfig.margin);
  static const EdgeInsetsGeometry all12 = EdgeInsets.all(SizeConfig.margin);
  static const EdgeInsetsGeometry onlyT6B12 = const EdgeInsets.only(top: SizeConfig.s6, bottom: SizeConfig.margin);
  static const EdgeInsetsGeometry onlyL12B20 = EdgeInsets.only(left: SizeConfig.margin, bottom: SizeConfig.s20);
}
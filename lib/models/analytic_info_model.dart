import 'package:flutter/material.dart';

class AnalyticInfo {
  final String? svgSrc, title;
  final int? count;
  final Color? color;
  final Color gradientStartColor;
  final Color gradientEndColor;

  AnalyticInfo({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
    required this.gradientStartColor,
    required this.gradientEndColor,
  });
}

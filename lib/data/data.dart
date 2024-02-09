import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/models/analytic_info_model.dart';
import 'package:responsive_admin_dashboard/models/discussions_info_model.dart';
import 'package:responsive_admin_dashboard/models/referal_info_model.dart';

List analyticData = [
  AnalyticInfo(
    title: "Active Station",
    count: 720,
    svgSrc: "assets/icons/station.svg",
    color: primaryColor,
    gradientStartColor: Colors.blue,
    gradientEndColor: Colors.green,
  ),
  AnalyticInfo(
    title: "Active Platform",
    count: 820,
    svgSrc: "assets/icons/Platform.svg",
    color: purple,
    gradientStartColor: Color.fromARGB(255, 76, 175, 80),
    gradientEndColor: Color.fromARGB(255, 35, 220, 233),
  ),
  AnalyticInfo(
    title: "Active Location",
    count: 920,
    svgSrc: "assets/icons/location.svg",
    color: orange,
    gradientStartColor: Color.fromARGB(255, 230, 4, 4),
    gradientEndColor: Color.fromARGB(255, 247, 87, 47),
  ),
  AnalyticInfo(
    title: "Active Opertator",
    count: 620,
    svgSrc: "assets/icons/operator.svg",
    color: green,
    gradientStartColor: const Color.fromARGB(255, 7, 163, 12),
    gradientEndColor: Color.fromARGB(255, 189, 240, 7),
  ),
  AnalyticInfo(
    title: "Active Route",
    count: 620,
    svgSrc: "assets/icons/train.svg",
    color: green,
    gradientStartColor: Colors.red,
    gradientEndColor: Colors.yellow,
  ),
  AnalyticInfo(
    title: "Active Terminal",
    count: 620,
    svgSrc: "assets/icons/terminal.svg",
    color: green,
    gradientStartColor: Color.fromARGB(255, 104, 22, 236),
    gradientEndColor: Color.fromARGB(255, 236, 63, 213),
  ),
  AnalyticInfo(
    title: "Working Station",
    count: 620,
    svgSrc: "assets/icons/station.svg",
    color: green,
    gradientStartColor: const Color.fromARGB(255, 243, 205, 33),
    gradientEndColor: const Color.fromARGB(255, 44, 204, 50),
  ),
  AnalyticInfo(
    title: "Working Platform",
    count: 620,
    svgSrc: "assets/icons/platform.svg",
    color: green,
    gradientStartColor: Colors.blue,
    gradientEndColor: Colors.green,
  ),
  AnalyticInfo(
    title: "Working Location",
    count: 620,
    svgSrc: "assets/icons/location.svg",
    color: green,
    gradientStartColor: Colors.blue,
    gradientEndColor: Colors.green,
  ),
  AnalyticInfo(
    title: "Working Operator",
    count: 620,
    svgSrc: "assets/icons/operator.svg",
    color: green,
    gradientStartColor: Colors.blue,
    gradientEndColor: Colors.green,
  ),
  AnalyticInfo(
    title: "Working Route",
    count: 620,
    svgSrc: "assets/icons/train.svg",
    color: green,
    gradientStartColor: Color.fromARGB(255, 97, 2, 100),
    gradientEndColor: Color.fromARGB(255, 169, 140, 248),
  ),
  AnalyticInfo(
    title: "Working Terminal",
    count: 620,
    svgSrc: "assets/icons/terminal.svg",
    color: green,
    gradientStartColor: Color.fromARGB(255, 71, 59, 4),
    gradientEndColor: Color.fromARGB(255, 253, 202, 35),
  ),
];

List discussionData = [
  DiscussionInfoModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo2.jpg",
    name: "Devi Carlos",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo3.jpg",
    name: "Danar Comel",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo4.jpg",
    name: "Karin Lumina",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo5.jpg",
    name: "Fandid Deadan",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Jan 25,2021",
  ),
];

List referalData = [
  ReferalInfoModel(
    title: "Facebook",
    count: 234,
    svgSrc: "assets/icons/Facebook.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Twitter",
    count: 234,
    svgSrc: "assets/icons/Twitter.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Linkedin",
    count: 234,
    svgSrc: "assets/icons/Linkedin.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/Dribbble.svg",
    color: red,
  ),
];

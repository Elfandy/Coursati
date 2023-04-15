import 'package:flutter/material.dart';

import 'BoxCourseLabelData.dart';
import 'BoxTCLabelData.dart';
import 'UserData.dart';

int? languageType, themeMode;
bool? isDark;
List<bool>? languageSelector;

//!deprectaed values
// String? appName;
// String? packageName;
// String? version;
// String? buildNumber;
//!-------------------
List<Locale> local = const [
  Locale('ar', 'AE'),
  Locale("en", "US"),
];

List<ThemeMode> themeSelector = [ThemeMode.light, ThemeMode.dark];
bool login = false;

//* These are the data of the app
// ? remove after setup with Laravel

List<UserData> users = [
  UserData(
      name: "ريان",
      image:
          "http://192.168.43.126/Images/shrajan_sci_fi_headphones8k_dfdb6871-06d3-44d5-82b3-c983f5e3d4f1.png",
      token: "g45g45g45g45g45g45g4g",
      notifications: 3),
  UserData(
      name: "تادر",
      image:
          "https://plus.unsplash.com/premium_photo-1678990345290-735e9718af20?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YW5pbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      token: "312313131231edd23d23d324fd3f4",
      notifications: 3),
  UserData(
      name: "محمد",
      image:
          "https://images.unsplash.com/photo-1578632767115-351597cf2477?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5pbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      token: "f24f34f34fg34eg34eg34eg",
      notifications: 3),
  UserData(
      name: "سالم",
      image:
          "https://qph.cf2.quoracdn.net/main-qimg-be1dfcd8602fc451692c482e47fdf4f6-lq",
      token: "g45g4g4g45g45g45g45g4g45g45g",
      notifications: 3),
];

UserData user = UserData(
    name: "ريان",
    image:
        "http://192.168.43.126/Images/shrajan_sci_fi_headphones8k_dfdb6871-06d3-44d5-82b3-c983f5e3d4f1.png",
    token: "",
    notifications: 3);
// ? --------------------------------------------------------------

// ? remove after setup with Laravel

List<BoxCourseLabelData> courseBLD = [
  BoxCourseLabelData(
    label: "البرمجة باستخدام لغة الجافا",
    In: "Octal",
    image:
        "http://192.168.43.126/Images/yustinus-tjiuwanda-BCBGahg0MH0-unsplash.jpg",
  ),
  BoxCourseLabelData(
    label: "تحليل البرمجيات الخبيثة",
    In: "Octal",
    image:
        "http://192.168.43.126/Images/XD_Slipcy_mobile_device_breaking_from_virus_blue_4k_04db82b1-9fc8-422b-ac2b-8f31cccbf54d.png",
  ),
  BoxCourseLabelData(
    label: "إدارة الوقت",
    In: "Gama",
    image:
        "http://192.168.43.126/Images/kelly-sikkema-io0ZLYbu31s-unsplash.jpg",
  ),
  BoxCourseLabelData(
    label: "هجمات الأندرويد",
    In: "Lablas",
    image:
        "http://192.168.43.126/Images/XD_Slipcy_mobile_device_cyber_attacks_blue_bfdc907f-2c89-48ae-9f83-4a3ec69de897.png",
  ),
];

List<BoxTCLabelData> trainingCenterBLD = [
  BoxTCLabelData(
    label: "Octal",
    address: "حي الأندلس",
    logo: "http://192.168.43.126/Images/Asset%201%20(2).png",
    image: "http://192.168.43.126/Images/all-bong-L2oedF1AsH8-unsplash.jpg",
  ),
  BoxTCLabelData(
    label: "Gama",
    address: "حي الأندلس",
    logo: "http://192.168.43.126/Images/Asset%201.png",
    image:
        "http://192.168.43.126/Images/quentin-basnier-bFpbKy69zdc-unsplash.jpg",
  ),
  BoxTCLabelData(
    label: "Beta",
    address: "غوط الشعال",
    logo: "http://192.168.43.126/Images/Asset%202.png",
    image:
        "http://192.168.43.126/Images/marc-olivier-jodoin--HIiNFXcbtQ-unsplash.jpg",
  ),
  BoxTCLabelData(
    label: "Lablas",
    address: "جنزور",
    logo: "http://192.168.43.126/Images/Asset%203.png",
    image: "http://192.168.43.126/Images/lucas-franco-aRTjFXs6HNc-unsplash.jpg",
  ),
];

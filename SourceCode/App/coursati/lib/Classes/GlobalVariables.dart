import 'package:coursati/Classes/Location.dart';
import 'package:coursati/Classes/TagData.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:flutter/material.dart';

import 'BoxCourseLabelData.dart';
import 'BoxTCLabelData.dart';
import 'Course.dart';
import 'Trainer.dart';
import 'UserData.dart';

String server = "http://192.168.43.126";

int languageType = 0;
bool isDark = false;
List<bool>? languageSelector;

// Future initData() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await getlanguage();
//   await getDarkMode();
//   return true;
// }

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
int picker = 0;
UserData? user;
//* These are the data of the app
// ? remove after setup with Laravel
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

List<UserData> users = [
  UserData(
      name: "ريان",
      image:
          "${server}/Images/shrajan_sci_fi_headphones8k_dfdb6871-06d3-44d5-82b3-c983f5e3d4f1.png",
      token: "g45g45g45g45g45g45g4g",
      notifications: 120,
      password: "123",
      birthDate: "2000/5/2",
      email: "ryan@gmail.com",
      gender: "Male",
      id: 4893123),
  UserData(
      name: "نادر",
      image:
          "https://plus.unsplash.com/premium_photo-1678990345290-735e9718af20?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YW5pbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      token: "312313131231edd23d23d324fd3f4",
      notifications: 0,
      password: "112233",
      birthDate: "1999/5/2",
      email: "nader@gmail.com",
      gender: "Male",
      id: 5654321),
  UserData(
      name: "محمد",
      image:
          "https://images.unsplash.com/photo-1578632767115-351597cf2477?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5pbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      token: "f24f34f34fg34eg34eg34eg",
      notifications: 33,
      password: "12345",
      birthDate: "2003/3/2",
      email: "mohammed@gmail.com",
      gender: "Male",
      id: 4321324),
  UserData(
      name: "سالم",
      image:
          "https://qph.cf2.quoracdn.net/main-qimg-be1dfcd8602fc451692c482e47fdf4f6-lq",
      token: "g45g4g4g45g45g45g45g4g45g45g",
      notifications: 3,
      password: "54321",
      birthDate: "2000/5/2",
      email: "salem@gmail.com",
      gender: "Male",
      id: 6543213),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

List<Course> courseBLD = [
  Course(
    name: "البرمجة باستخدام لغة الجافا",
    trainingCenterID: 0091,
    image: "${server}/Images/yustinus-tjiuwanda-BCBGahg0MH0-unsplash.jpg",
    id: 12331212,
    active: true,
    description: """Our core Java programming tutorial is designed for
students and working professionals. Java is an
object-oriented, class-based, concurrent,
secured and general-purpose
computer-programming language.
It is a widely used robust technology.
Our core Java programming tutorial is designed
for students and working professionals.
Java is an object-oriented, class-based, 
concurrent, secured and general-purpose
computer-programming language. 
It is a widely used robust technology.""",
    discount: 0,
    duration: 60,
    full: false,
    price: 300,
    startingDate: DateTime(2023, 5, 32),
    tags: [tags[0], tags[6], tags[7], tags[8]],
    trainer: 001,
    location: locations[0],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 3,
    period: 1,
    trainerData: Trainer(
      id: 001,
      discription: """an American business magnate, philanthropist
and investor. He is a co-founder of Microsoft,
along with his late childhood friend Paul Allen.
During his career at Microsoft, Gates held the 
positions of chairman, chief executive officer, 
president and chief software architect,
while also being the largest individual shareholder until May 2014.
He was a major entrepreneur of the
microcomputer revolution of the 1970s
and 1980s.""",
      image: "${server}/Images/ali-morshedlou-WMD64tMfc4k-unsplash.jpg",
      major: "Programming",
      name: "Bill Gates",
      rating: 3.2,
    ),
  ),
  Course(
    name: "تحليل البرمجيات الخبيثة",
    trainingCenterID: 0091,
    image:
        "${server}/Images/XD_Slipcy_mobile_device_breaking_from_virus_blue_4k_04db82b1-9fc8-422b-ac2b-8f31cccbf54d.png",
    id: 87654321,
    active: true,
    description: """Malware analysis is the process of understanding
the behavior and purpose of a suspicious file or URL. 
The output of the analysis aids in the detection and 
mitigation of the potential threat. The key benefit of 
malware analysis is that it helps incident responders 
and security analysts pragmatically triage incidents
by level of severity
Dynamic malware analysis executes suspected
 malicious code in a safe environment called a
 sandbox. This closed system enables security
 professionals to watch the malware in action
 without the risk of letting it infect their system or
 escape into the enterprise network.
Dynamic analysis provides threat hunters and
 incident responders with deeper visibility,
 allowing them to uncover the true nature of a
 threat. As a secondary benefit, automated
 sandboxing eliminates the time it would take to 
reverse engineer a file to discover the malicious code.""",
    discount: 0,
    duration: 120,
    full: false,
    price: 420,
    startingDate: DateTime(2023, 5, 32),
    tags: [tags[0], tags[4], tags[10], tags[3]],
    trainer: 003,
    location: locations[1],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 6,
    period: 1,
    trainerData: Trainer(
      id: 001,
      discription: """an American business magnate, philanthropist
and investor. He is a co-founder of Microsoft,
along with his late childhood friend Paul Allen.
During his career at Microsoft, Gates held the 
positions of chairman, chief executive officer, 
president and chief software architect,
while also being the largest individual shareholder until May 2014.
He was a major entrepreneur of the
microcomputer revolution of the 1970s
and 1980s.""",
      image: "${server}/Images/ali-morshedlou-WMD64tMfc4k-unsplash.jpg",
      major: "Programming",
      name: "Bill Gates",
      rating: 1.5,
    ),
  ),
  Course(
    name: "إدارة الوقت",
    trainingCenterID: 0004,
    image: "${server}/Images/kelly-sikkema-io0ZLYbu31s-unsplash.jpg",
    id: 12345678,
    active: false,
    description: """""",
    discount: 0,
    duration: 60,
    full: false,
    price: 750,
    startingDate: DateTime(2023, 6, 32),
    tags: [tags[3], tags[4], tags[8], tags[11]],
    trainer: 002,
    location: locations[2],
    icon: "${server}/Images/Asset%201.png",
    trainingCenterName: "Gama",
    repeats: false,
    trainerData: Trainer(
      id: 001,
      discription: """an American business magnate, philanthropist
and investor. He is a co-founder of Microsoft,
along with his late childhood friend Paul Allen.
During his career at Microsoft, Gates held the 
positions of chairman, chief executive officer, 
president and chief software architect,
while also being the largest individual shareholder until May 2014.
He was a major entrepreneur of the
microcomputer revolution of the 1970s
and 1980s.""",
      image: "${server}/Images/ali-morshedlou-WMD64tMfc4k-unsplash.jpg",
      major: "Programming",
      name: "Bill Gates",
      rating: 4.8,
    ),
  ),
  Course(
    name: "هجمات الأندرويد",
    trainingCenterID: 0123,
    image:
        "${server}/Images/XD_Slipcy_mobile_device_cyber_attacks_blue_bfdc907f-2c89-48ae-9f83-4a3ec69de897.png",
    id: 00932131,
    active: true,
    description: """""",
    discount: 20,
    duration: 80,
    full: true,
    price: 1600,
    startingDate: DateTime(2023, 10, 9),
    tags: [tags[0], tags[6], tags[7], tags[8]],
    trainer: 001,
    location: locations[3],
    icon: "${server}/Images/Asset%202.png",
    trainingCenterName: "Lablas",
    repeats: true,
    periodsRepeats: 1,
    period: 2,
    trainerData: Trainer(
      id: 001,
      discription: """an American business magnate, philanthropist
and investor. He is a co-founder of Microsoft,
along with his late childhood friend Paul Allen.
During his career at Microsoft, Gates held the 
positions of chairman, chief executive officer, 
president and chief software architect,
while also being the largest individual shareholder until May 2014.
He was a major entrepreneur of the
microcomputer revolution of the 1970s
and 1980s.""",
      image: "${server}/Images/ali-morshedlou-WMD64tMfc4k-unsplash.jpg",
      major: "Programming",
      name: "Bill Gates",
      rating: 2.2,
    ),
  ),

  //! repeated code
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<BoxTCLabelData> trainingCenterBLDSmall = [];
List<BoxCourseLabelData> courseBLDsmall = [];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<TrainingCenter> trainingCenterData = [
  TrainingCenter(
    branch: [Branches[0], Branches[1], Branches[2]],
    close: TimeOfDay(hour: 19, minute: 00),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Octal@gmail.com",
    id: 0091,
    location: locations[3],
    name: "Octal",
    open: TimeOfDay(hour: 8, minute: 00),
    phoneNumber: "0911234567",
    rating: 3.8,
    tags: [
      tags[0],
      tags[1],
      tags[2],
    ],
    image: "${server}/Images/all-bong-L2oedF1AsH8-unsplash.jpg",
    logo: "${server}/Images/Asset%201%20(2).png",
    facebook: "https://www.facebook.com",
    website: "https://www.octal.com.ly",
    viperAllow: true,
    whatsAppAllow: true,
  ),
  TrainingCenter(
    branch: null,
    close: TimeOfDay(hour: 19, minute: 45),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Gama@gmail.com",
    id: 0004,
    location: locations[2],
    name: "Gama",
    open: TimeOfDay(hour: 8, minute: 30),
    phoneNumber: "0911234567",
    rating: 3.8,
    tags: [
      tags[0],
      tags[1],
      tags[2],
      tags[9],
      tags[11],
    ],
    image: "${server}/Images/quentin-basnier-bFpbKy69zdc-unsplash.jpg",
    logo: "${server}/Images/Asset%201.png",
  ),
  TrainingCenter(
    branch: null,
    close: TimeOfDay(hour: 19, minute: 06),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Lablas@gmail.com",
    id: 0123,
    location: locations[1],
    name: "Lablas",
    open: TimeOfDay(hour: 8, minute: 01),
    phoneNumber: "0911234567",
    rating: 2.8,
    tags: [
      tags[0],
      tags[1],
      tags[2],
      tags[3],
      tags[4],
      tags[5],
      tags[6],
      tags[7],
      tags[8],
    ],
    image: "${server}/Images/marc-olivier-jodoin--HIiNFXcbtQ-unsplash.jpg",
    logo: "${server}/Images/Asset%202.png",
    viperAllow: true,
    whatsAppAllow: true,
  ),
  TrainingCenter(
    branch: null,
    close: TimeOfDay(hour: 19, minute: 00),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Beta@gmail.com",
    id: 0012,
    location: locations[0],
    name: "بيتا",
    open: TimeOfDay(hour: 8, minute: 00),
    phoneNumber: "0911234567",
    rating: 3.4,
    tags: [
      tags[9],
      tags[10],
      tags[11],
      tags[4],
    ],
    image: "${server}/Images/lucas-franco-aRTjFXs6HNc-unsplash.jpg",
    logo: "${server}/Images/Asset%203.png",
  ),

  //!! Repeated Data for tests
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<TrainingCenterBranch> Branches = [
  TrainingCenterBranch(
    close: TimeOfDay(hour: 19, minute: 00),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Octal@gmail.com",
    id: 0321,
    location: locations[2],
    name: "Octal",
    open: TimeOfDay(hour: 8, minute: 00),
    phoneNumber: "0911234567",
    rating: 4.3,
    tags: [
      tags[0],
      tags[1],
      tags[2],
    ],
    image: "",
  ),
  TrainingCenterBranch(
    close: TimeOfDay(hour: 19, minute: 00),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Octal@gmail.com",
    id: 3210,
    location: locations[1],
    name: "Octal",
    open: TimeOfDay(hour: 8, minute: 00),
    phoneNumber: "0911234567",
    rating: 4.2,
    tags: [
      tags[0],
      tags[1],
      tags[2],
    ],
    image: "",
  ),
  TrainingCenterBranch(
    close: TimeOfDay(hour: 19, minute: 00),
    description: """Advancing the Community with Hands-on Cyber
Security Training.
It is our ongoing mission to empower cyber security
 professionals with the practical skills and knowledge
 they need to make our world a safer place.
Advancing the Community with Hands-on Cyber Security
Training.
It is our ongoing mission to empower cyber security
professionals with the practical skills and knowledge
they need to make our world a safer place.""",
    email: "Octal@gmail.com",
    id: 0923,
    location: locations[0],
    name: "Octal",
    open: TimeOfDay(hour: 8, minute: 00),
    phoneNumber: "0911234567",
    rating: 3.3,
    tags: [
      tags[0],
      tags[1],
      tags[2],
    ],
    image: "",
  ),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<Location> locations = [
  Location(city_en: "Tripoli", city_ar: "طرابلس", id: 1),
  Location(city_en: "Janzour", city_ar: "جنزور", id: 2),
  Location(city_en: "Hay Alandalus", city_ar: "حي الاندلس", id: 3),
  Location(city_en: "Ghout alshaal", city_ar: "غوط الشعال", id: 4),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

List<Tag> tags = <Tag>[
  Tag(id: 1, name_ar: "برمجة", name_en: "Programming"),
  Tag(id: 2, name_ar: "هندسة", name_en: "Engineering"),
  Tag(id: 3, name_ar: "أمن سيبراني", name_en: "Cyber Security"),
  Tag(id: 4, name_ar: "اندرويد", name_en: "Android"),
  Tag(id: 5, name_ar: "فيروسات", name_en: "Malware"),
  Tag(id: 6, name_ar: "لينيكس", name_en: "Linux"),
  Tag(id: 7, name_ar: "البرمجة الكائينية", name_en: "OOP"),
  Tag(id: 8, name_ar: "اساسيات", name_en: "Basic"),
  Tag(id: 9, name_ar: "جافا", name_en: "Java"),
  Tag(id: 10, name_ar: "أمن", name_en: "Security"),
  Tag(id: 11, name_ar: "متقدم", name_en: "Advanced"),
  Tag(id: 12, name_ar: "إدارة", name_en: "Managment"),
];


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
//**************************************************************************** */
//????????????????????????????????????????????????????????????????????????????????
//******************************************************************************* */
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

//? Data base data



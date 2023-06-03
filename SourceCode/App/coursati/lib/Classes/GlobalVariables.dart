import 'package:coursati/Classes/Location.dart';
import 'package:coursati/Classes/TagData.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'BoxCourseLabelData.dart';
import 'BoxTCLabelData.dart';
import 'Course.dart';
import 'Trainer.dart';
import 'UserData.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

final RegExp english = RegExp(r'^[0-9a-zA-Z]+');
final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');

//!!!!!!!!!
//!!!!!!!!!
String server =
// "http://192.168.1.7";
// "http://192.168.43.126";
    "http://192.168.1.7";
// "http://192.168.43.20";
// "http://192.168.238.20";
// "http://192.168.1.153";

String serverStorage = "http://192.168.43.128:8000/storage/";

// String onlineServer = "http://192.168.2.103:8000/api/";
String onlineServer = "http://192.168.43.128:8000/api/";

String apiTestServer = "https://apimocha.com/coursatitest/";
// String apiTestServer = "https://192.168.43.128:8000/api/";
final Dio dioTestApi = Dio(BaseOptions(
  baseUrl: apiTestServer,
  contentType: 'application/json',
));
String deviceID = "";

String ConfigSave =
    "language:$languageType,\ndarkMode:$isDark,\n{name:${user.name}, email:${user.email}, image:${user.image}, token:${user.token}, password:${user.password}, birthDate:${user.birthDate}, notifications:${user.notifications}, gender:${user.gender} , id:${user.id}, trainingCenterId:${user.trainingCenterId}},deviceid=$deviceID";

int languageType = 0;
bool isDark = false;
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

TrainingCenter TC = TrainingCenter(
  // branch: [Branches[0]],
  close: TimeOfDay(hour: 0, minute: 00),
  description: """""",
  email: "",
  id: "0",
  location: locations[0],
  name: "",
  open: TimeOfDay(hour: 0, minute: 00),
  phoneNumber: "",
  rating: 3.8,
  tags: [tags[0]],
  image: "",
  logo: "",
);

List<ThemeMode> themeSelector = [ThemeMode.light, ThemeMode.dark];
bool login = false;
int picker = 0;

// UserData user = UserData(
//     name: "ريان",
//     image:
//         "${server}/Images/shrajan_sci_fi_headphones8k_dfdb6871-06d3-44d5-82b3-c983f5e3d4f1.png",
//     token: "g45g45g45g45g45g45g4g",
//     notifications: 120,
//     password: "123",
//     birthDate: "2000/5/2",
//     email: "ryan@gmail.com",
//     gender: "Male",
//     id: 4893123,
//     trainingCenterId: 0091);

UserData user =
// UserData(
//     name: "",
//     image: "",
//     token: "",
//     notifications: 0,
//     password: "",
//     birthDate: "",
//     email: "",
//     gender: 0,
//     id: 0);
    UserData(
        name: "ريان",
        image:
            "https://images.unsplash.com/photo-1683580735117-5432c7d9e001?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
        token: "g45g45g45g45g45g45g4g",
        notifications: 120,
        password: "123",
        birthDate: "2000/5/2",
        email: "ryan@gmail.com",
        gender: 0,
        id: 4893123,
        trainingCenterId: 0091,
        // orginaizationName: "coursati",
        personalID: "NY6D8DWE",
        phoneNumber: "0910502646");
// UserData(
//     name: "سالم",
//     image:
//         "https://qph.cf2.quoracdn.net/main-qimg-be1dfcd8602fc451692c482e47fdf4f6-lq",
//     token: "g45g4g4g45g45g45g45g4g45g45g",
//     notifications: 3,
//     password: "54321",
//     birthDate: "2000/5/2",
//     email: "salem@gmail.com",
//     gender: 0,
//     id: 6543213);
// //* These are the data of the app
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
      gender: 0,
      id: 4893123,
      trainingCenterId: 0091,
      // orginaizationName: "coursati",
      personalID: "NY6D8DWE",
      phoneNumber: "0910502646"),
  UserData(
    name: "نادر",
    image:
        "https://plus.unsplash.com/premium_photo-1678990345290-735e9718af20?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YW5pbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    token: "312313131231edd23d23d324fd3f4",
    notifications: 0,
    password: "112233",
    birthDate: "1999/5/2",
    email: "nader@gmail.com",
    gender: 0,
    id: 5654321,
    trainingCenterId: 0004,
  ),
  UserData(
      name: "محمد",
      image:
          "https://images.unsplash.com/photo-1578632767115-351597cf2477?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5pbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      token: "f24f34f34fg34eg34eg34eg",
      notifications: 33,
      password: "12345",
      birthDate: "2003/3/2",
      email: "mohammed@gmail.com",
      gender: 0,
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
      gender: 0,
      id: 6543213),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

List<Course> courseBLD = [
  Course(
    name: "البرمجة باستخدام لغة الجافا",
    trainingCenterID: "0091",
    image: "${server}/Images/yustinus-tjiuwanda-BCBGahg0MH0-unsplash.jpg",
    id: '12331212',
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
    trainer: "001",
    location: locations[0],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 3,
    period: 1,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "تحليل البرمجيات الخبيثة",
    trainingCenterID: "0091",
    image:
        "${server}/Images/XD_Slipcy_mobile_device_breaking_from_virus_blue_4k_04db82b1-9fc8-422b-ac2b-8f31cccbf54d.png",
    id: '87654321',
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
    trainer: "003",
    location: locations[1],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 6,
    period: 1,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "إدارة الوقت",
    trainingCenterID: "0004",
    image: "${server}/Images/kelly-sikkema-io0ZLYbu31s-unsplash.jpg",
    id: '12345678',
    active: false,
    description: """""",
    discount: 0,
    duration: 60,
    full: false,
    price: 750,
    startingDate: DateTime(2023, 6, 32),
    tags: [tags[3], tags[4], tags[8], tags[11]],
    trainer: "002",
    location: locations[2],
    icon: "${server}/Images/Asset%201.png",
    trainingCenterName: "Gama",
    repeats: false,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "هجمات الأندرويد",
    trainingCenterID: "0123",
    image:
        "${server}/Images/XD_Slipcy_mobile_device_cyber_attacks_blue_bfdc907f-2c89-48ae-9f83-4a3ec69de897.png",
    id: '00932131',
    active: true,
    description: """""",
    discount: 20,
    duration: 80,
    full: true,
    price: 1600,
    startingDate: DateTime(2023, 10, 9),
    tags: [tags[0], tags[6], tags[7], tags[8]],
    trainer: "001",
    location: locations[3],
    icon: "${server}/Images/Asset%202.png",
    trainingCenterName: "Lablas",
    repeats: true,
    periodsRepeats: 1,
    period: 2,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),

  //! repeated code
  Course(
    name: "البرمجة باستخدام لغة الجافا",
    trainingCenterID: "0091",
    image: "${server}/Images/yustinus-tjiuwanda-BCBGahg0MH0-unsplash.jpg",
    id: '12331212',
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
    trainer: "001",
    location: locations[0],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 3,
    period: 1,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "تحليل البرمجيات الخبيثة",
    trainingCenterID: "0091",
    image:
        "${server}/Images/XD_Slipcy_mobile_device_breaking_from_virus_blue_4k_04db82b1-9fc8-422b-ac2b-8f31cccbf54d.png",
    id: '87654321',
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
    trainer: "003",
    location: locations[1],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 6,
    period: 1,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "إدارة الوقت",
    trainingCenterID: "0004",
    image: "${server}/Images/kelly-sikkema-io0ZLYbu31s-unsplash.jpg",
    id: '12345678',
    active: false,
    description: """""",
    discount: 0,
    duration: 60,
    full: false,
    price: 750,
    startingDate: DateTime(2023, 6, 32),
    tags: [tags[3], tags[4], tags[8], tags[11]],
    trainer: "002",
    location: locations[2],
    icon: "${server}/Images/Asset%201.png",
    trainingCenterName: "Gama",
    repeats: false,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "هجمات الأندرويد",
    trainingCenterID: "0123",
    image:
        "${server}/Images/XD_Slipcy_mobile_device_cyber_attacks_blue_bfdc907f-2c89-48ae-9f83-4a3ec69de897.png",
    id: '00932131',
    active: true,
    description: """""",
    discount: 20,
    duration: 80,
    full: true,
    price: 1600,
    startingDate: DateTime(2023, 10, 9),
    tags: [tags[0], tags[6], tags[7], tags[8]],
    trainer: "001",
    location: locations[3],
    icon: "${server}/Images/Asset%202.png",
    trainingCenterName: "Lablas",
    repeats: true,
    periodsRepeats: 1,
    period: 2,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
  Course(
    name: "البرمجة باستخدام لغة الجافا",
    trainingCenterID: "0091",
    image: "${server}/Images/yustinus-tjiuwanda-BCBGahg0MH0-unsplash.jpg",
    id: '12331212',
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
    trainer: "001",
    location: locations[0],
    icon: "${server}/Images/Asset%201%20(2).png",
    trainingCenterName: "Octal",
    repeats: true,
    periodsRepeats: 3,
    period: 1,
    trainerData: Trainer(
      id: "001",
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
    ),
  ),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<BoxTCLabelData> trainingCenterBLDSmall = [];
List<BoxCourseLabelData> courseBLDsmall = [];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<TrainingCenter> trainingCenterData = [
  TrainingCenter(
    // branch: [Branches[0], Branches[1], Branches[2]],
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
    id: "0091",
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
    whatsAppNum: "0910502646",
  ),
  TrainingCenter(
    // branch: null,
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
    id: "0004",
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
    // branch: null,
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
    id: "0123",
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
  ),
  TrainingCenter(
    // branch: null,
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
    id: "0012",
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
    image: "${server}/Images/marc-olivier-jodoin--HIiNFXcbtQ-unsplash.jpg",
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
    image: "${server}/Images/lucas-franco-aRTjFXs6HNc-unsplash.jpg",
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
    image: "${server}/Images/mike-kononov-lFv0V3_2H6s-unsplash.jpg",
  ),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
List<Locations> locations = [
  Locations(city: "Tripoli", id: 1, lat: 13.32131, lng: 30.32131),
  Locations(city: "Janzour", id: 2, lat: 13.32131, lng: 30.32131),
  Locations(city: "Hay Alandalus", id: 3, lat: 13.32131, lng: 30.32131),
  Locations(city: "Ghout alshaal", id: 4, lat: 13.32131, lng: 30.32131),
];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

List<Tag> tags = <Tag>[];

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
//**************************************************************************** */
//????????????????????????????????????????????????????????????????????????????????
//******************************************************************************* */
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

//? Data base data

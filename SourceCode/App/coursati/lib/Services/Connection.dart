import 'dart:convert';
import 'dart:math';
import '';

// import 'package:dart_ping/dart_ping.dart';

// class Connection {
//   //!! This Function Still doesn't work
//   Future<PingResponse?> checkConnection(String ip) async {
//     final ping = Ping(
//       ip,
//       count: 1,
//     );

//     String x = await ping.stream.listen((event) {
//       final res = event.response;
//       if (res == null) return;
//       final ip = res.ip;
//       final ttl = res.ttl;
//       final time = res.time;
//       print(ip.toString() + "\n" + ttl.toString() + "\n" + time.toString());
//     }).toString();
//     print(x);
//    }
// }

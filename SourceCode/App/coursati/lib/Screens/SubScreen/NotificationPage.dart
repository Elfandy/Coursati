import 'package:coursati/Classes/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationClass> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "الإشعارات" : "Notification",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: FutureBuilder(
        future: getNoti(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            data.clear();
            for (var element in snapshot.data) {
              data.add(NotificationClass.fromJson(element));
            }
            int counter = 0;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor:
                            isDark ? Colors.grey[800] : Colors.grey[200],
                      ),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text((counter++).toString()),
                                ),
                                Text(languageType == 0 ? "العنوان" : "Title"),
                                Text("  " + data[index].title),
                              ]),
                          Text(languageType == 0 ? "المحتوى" : "Content"),
                          Text(data[index].content)
                        ],
                      ),
                    ));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future getNoti() async {
    var url = "noti";
    try {
      var response = await dioTestApi.get(url, data: {'id': user.id});
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }
}

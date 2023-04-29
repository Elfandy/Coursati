import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';
import '../../main.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          (languageType == 0) ? "إدارة الحساب" : "Account",
          style: const TextStyle(color: Colors.black54),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                user.image,
              ),
              radius: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GridPaper()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


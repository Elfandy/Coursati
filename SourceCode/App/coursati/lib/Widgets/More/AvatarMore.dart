import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../Classes/UserData.dart';
import 'FloatingBar.dart';

class AvatarMore extends StatefulWidget {
  const AvatarMore({super.key, required this.user});
  final UserData user;

  @override
  State<AvatarMore> createState() => _AvatarMoreState();
}

class _AvatarMoreState extends State<AvatarMore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
          backgroundColor: isDark ? Colors.grey[200] : Colors.white,
          backgroundImage: NetworkImage(
            serverStorage + widget.user.image,
          ),
          radius: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.user.name,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingBar(notificationCount: widget.user.notifications),
      ],
    );
  }
}

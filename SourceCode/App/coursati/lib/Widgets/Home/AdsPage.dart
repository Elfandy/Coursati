import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/Ads.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdsPage extends StatefulWidget {
  AdsPage({super.key, required this.ad});
  Ads ad;
  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "adsHero",
      child: Scaffold(
        body: Column(children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            imageUrl: widget.ad.image,
          ),
          Text(widget.ad.title),
          Text(widget.ad.description),
          Text(widget.ad.link)
        ]),
      ),
    );
  }
}

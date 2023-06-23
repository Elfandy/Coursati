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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            imageUrl: widget.ad.image,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.ad.title,
              maxLines: 2,
              softWrap: true,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.ad.description,
              maxLines: 10,
              softWrap: true,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {},
                child: Text(languageType == 0 ? "اذهب للموقع" : "Go to Link")),
          )
        ]),
      ),
    );
  }
}

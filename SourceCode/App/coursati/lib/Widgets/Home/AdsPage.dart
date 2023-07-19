import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/Ads.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Center(
            child: Text(
              widget.ad.description,
              maxLines: 10,
              softWrap: true,
              style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.grey[200] : Colors.grey[600]),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  _launchSocial(widget.ad.link.startsWith('http')
                      ? widget.ad.link
                      : widget.ad.link.startsWith('https')
                          ? widget.ad.link
                          : "https://" + widget.ad.link);
                },
                child: Text(
                  languageType == 0 ? "اذهب للموقع" : "Go to Link",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ]),
      ),
    );
  }

  void _launchSocial(String url) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    try {
      if (!await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
    // await launchUrl(Uri.https(url),mode: LaunchMode.externalApplication ,);
  }
}

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InterstitialAds extends StatefulWidget {
  @override
  _InterstitialAdsState createState() => _InterstitialAdsState();
}

class _InterstitialAdsState extends State<InterstitialAds> {
  InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }

  Future showInterstitialAds() async {
    try {
      MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
        keywords: <String>['Utils', 'useful app'],
        contentUrl: 'https://flutter.io',
        childDirected: false,
        testDevices: <String>[], // Android emulators are considered test devices
      );

      myInterstitial = InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("InterstitialAd event is $event");
        },
      );

      myInterstitial
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0,
        );
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Interstitial Ads'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Show"),
            onPressed: () {
              showInterstitialAds();
            },
          ),
        ),
      ),
      onWillPop: () {
        Navigator.pop(context);
      },
    );
  }
}

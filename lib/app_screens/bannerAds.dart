import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class BannerAds extends StatefulWidget {
  @override
  _BannerAdsState createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  BannerAd myBanner;

  @override
  void initState() {
    super.initState();

    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['Utils', 'useful app'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[], // Android emulators are considered test devices
    );

    myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
//      adUnitId: 'ca-app-pub-8126362785815437/6998433679',
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Banner Ads'),
        ),
      ),
      onWillPop: () {
        Navigator.pop(context);
      },
    );
  }
}

class BannerAds1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appId = "ca-app-pub-8126362785815437~5741192322";
//    FirebaseAdMob.instance.initialize(appId: appId);

    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['Utils', 'useful app'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[], // Android emulators are considered test devices
    );

    BannerAd myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
//      adUnitId: 'ca-app-pub-8126362785815437/6998433679',
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );

    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Banner Ads'),
        ),
      ),
      onWillPop: () {
        Future.delayed(const Duration(milliseconds: 500), () {
          myBanner.dispose();
          myBanner = null;
          Navigator.pop(context);
        });
      },
    );
  }
}

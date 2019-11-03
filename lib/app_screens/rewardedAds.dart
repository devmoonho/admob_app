import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardedAds extends StatefulWidget {
  @override
  _RewardedAdsState createState() => _RewardedAdsState();
}

class _RewardedAdsState extends State<RewardedAds> {
  int _coins = 0;
  bool _loaded = false;

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['Utils', 'useful app'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  @override
  void initState() {
    super.initState();
  }

  Future showRewardedAds() async {
    try {
      RewardedVideoAd.instance.listener =
          (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
        if (event == RewardedVideoAdEvent.rewarded) {
          setState(() {
            // Here, apps should update state to reflect the reward.
            print('Coin!! : ${++_coins}');
          });
        }
      };

      await RewardedVideoAd.instance.load(
          targetingInfo: targetingInfo, adUnitId: RewardedVideoAd.testAdUnitId);

      await RewardedVideoAd.instance.show();
    }on PlatformException catch(e){
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    showRewardedAds();

    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rewarded Ads'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Show"),
            onPressed: () {
              showRewardedAds();
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

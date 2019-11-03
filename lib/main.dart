import 'package:admob_app/app_screens/InterstitialAds.dart';
import 'package:admob_app/app_screens/bannerAds.dart';
import 'package:admob_app/app_screens/rewardedAds.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

void main() => runApp(AdmobFlutterApp());

class AdmobFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admob Exmaple',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appId = "ca-app-pub-8126362785815437~5741192322";
    FirebaseAdMob.instance.initialize(appId: appId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admob Example',
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(color: Colors.orange),
                  alignment: Alignment.center,
                  child: Text(
                    'Banner Ads',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BannerAds();
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(color: Colors.orangeAccent),
                  alignment: Alignment.center,
                  child: Text(
                    'Interstitial Ads',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InterstitialAds();
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return RewardedAds();
                    }
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                  alignment: Alignment.center,
                  child: Text(
                    'Reward Ads',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.deepOrange),
                alignment: Alignment.center,
                child: Text(
                  'Native Ads',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fx_prj_test_flutter_app/home/easy_shar_test.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:social_share/social_share.dart';
import 'package:social_share_plugin/social_share_plugin.dart';

class ShareSocialPage extends StatefulWidget {
  @override
  _ShareSocialPageState createState() => _ShareSocialPageState();
}
class _ShareSocialPageState extends State<ShareSocialPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Share Testing'),),
        body: SingleChildScrollView(
          child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=> ShareLibraryTest() )
                    );
                  },
                  child: Text('Share   Library'),
                ),

                RaisedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> EasyShareTest()));
                  },
                  child: Text('Easy Share Library'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Status : Test Failed for below 2 libraries ',
                  style: TextStyle(color: Colors.red),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> SocialSharePluginTest()));
                  },
                  child: Text('Social Share plugin Library'),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> SocialShareTest()));
                  },
                  child: Text('Social Share Library'),
                ),
              ],
            ),
          )
        )

      );
  }
}
class ShareLibraryTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Share Intent"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Share Image to Social App",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: MaterialButton(
              elevation: 5.0,
              height: 50.0,
              minWidth: 150,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Icon(Icons.share),
              onPressed: () async{
               /* final response = await get('https://cf.bstatic.com/images/hotel/max1024x768/107/107527439.jpg');
                final bytes = response.bodyBytes;
                final Directory temp = await getTemporaryDirectory();
                final File imageFile = File('${temp.path}/tempImage');
                imageFile.writeAsBytesSync(response.bodyBytes);
                Share.shareFiles(['${temp.path}/tempImage'], text: 'text to share',);*/
                File file = await ImagePicker.pickImage(source: ImageSource.gallery);
                await Share.shareFiles([file.path], text: 'Great picture',subject: "This is testing for image share on social");
              }
            ),
          ),

          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text(
              "Share url to Social Media",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
            ),
          ),
          Center(
            child: MaterialButton(
              elevation: 5.0,
              height: 50.0,
              minWidth: 150,
              color: Colors.green,
              textColor: Colors.white,
              child: Icon(Icons.share),
              onPressed: () {
                Share.share(
                    'https://cf.bstatic.com/images/hotel/max1024x768/107/107527439.jpg',
                    subject: 'Sharing on Email');
              },
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text(
              "Share text to Social App",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
            ),
          ),
          Center(
            child: MaterialButton(
              elevation: 5.0,
              height: 50.0,
              minWidth: 150,
              color: Colors.orange,
              textColor: Colors.white,
              child: Icon(Icons.share),
              onPressed: () {
               /* Share.share(
                    'Look so good and look so sweet , looking good enough to eat',
                    subject: 'Sharing on Email');*/
              },
            ),
          ),
        ],
      ),
    );
  }

}

class SocialSharePluginTest extends StatefulWidget {
  @override
  _SocialSharePluginTestState createState() => _SocialSharePluginTestState();
}

class _SocialSharePluginTestState extends State<SocialSharePluginTest> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SocialSharePlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            RaisedButton(
              child: Text('Share to Instagram'),
              onPressed: () async {
                File file = await ImagePicker.pickImage(source: ImageSource.gallery);
                await SocialSharePlugin.shareToFeedInstagram(path: file.path);
              },
            ),
            RaisedButton(
              child: Text('Share to Facebook'),
              onPressed: () async {
                File file = await ImagePicker.pickImage(source: ImageSource.gallery);
                await SocialSharePlugin.shareToFeedFacebook(
                    path: file.path,
                    onSuccess: (_) {
                      print('FACEBOOK SUCCESS');
                      return;
                    },
                    onCancel: () {
                      print('FACEBOOK CANCELLED');
                      return;
                    },
                    onError: (error) {
                      print('FACEBOOK ERROR $error');
                      return;
                    });
              },
            ),
            RaisedButton(
              child: Text('Share to Facebook Link'),
              onPressed: () async {
                String url = 'https://flutter.dev/';
                final quote =
                    'Flutter is Google’s portable UI toolkit for building beautiful, natively-compiled applications for mobile, web, and desktop from a single codebase.';
                final result = await SocialSharePlugin.shareToFeedFacebookLink(
                  quote: quote,
                  url: url,
                  onSuccess: (_) {
                    print('FACEBOOK SUCCESS');
                    return;
                  },
                  onCancel: () {
                    print('FACEBOOK CANCELLED');
                    return;
                  },
                  onError: (error) {
                    print('FACEBOOK ERROR $error');
                    return;
                  },
                );

                print(result);
              },
            ),
            RaisedButton(
              child: Text('Share to Twitter'),
              onPressed: () async {
                String url = 'https://flutter.dev/';
                final text =
                    'Flutter is Google’s portable UI toolkit for building beautiful, natively-compiled applications for mobile, web, and desktop from a single codebase.';
                final result = await SocialSharePlugin.shareToTwitterLink(
                    text: text,
                    url: url,
                    onSuccess: (_) {
                      print('TWITTER SUCCESS');
                      return;
                    },
                    onCancel: () {
                      print('TWITTER CANCELLED');
                      return;
                    });
                print(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SocialShareTest extends StatefulWidget {
  @override
  _SocialShareTestState createState() => _SocialShareTestState();
}

class _SocialShareTestState extends State<SocialShareTest> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Screenshot(
          controller: screenshotController,
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Running on: $_platformVersion\n',
                  textAlign: TextAlign.center,
                ),
                RaisedButton(
                  onPressed: () async {
                    File file = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    SocialShare.shareInstagramStory(file.path, "#ffffff",
                        "#000000", "https://deep-link-url")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share On Instagram Story"),
                ),

                RaisedButton(
                  onPressed: () async {
                    await screenshotController.capture().then((image) async {
                      //facebook appId is mandatory for andorid or else share won't work
                      Platform.isAndroid
                          ? SocialShare.shareFacebookStory(image.path,
                          "#ffffff", "#000000", "https://google.com",
                          appId: "xxxxxxxxxxxxx")
                          .then((data) {
                        print(data);
                      })
                          : SocialShare.shareFacebookStory(image.path,
                          "#ffffff", "#000000", "https://google.com")
                          .then((data) {
                        print(data);
                      });
                    });
                  },
                  child: Text("Share On Facebook Story"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.copyToClipboard(
                      "This is Social Share plugin",
                    ).then((data) {
                      print(data);
                    });
                  },
                  child: Text("Copy to clipboard"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareTwitter(
                        "This is Social Share twitter example",
                        hashtags: ["hello", "world", "foo", "bar"],
                        url: "https://google.com/#/hello",
                        trailingText: "\nhello")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on twitter"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareSms("This is Social Share Sms example",
                        url: "\nhttps://google.com/",
                        trailingText: "\nhello")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on Sms"),
                ),
                RaisedButton(
                  onPressed: () async {
                    await screenshotController.capture().then((image) async {
                      SocialShare.shareOptions("Hello world").then((data) {
                        print(data);
                      });
                    });
                  },
                  child: Text("Share Options"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareWhatsapp(
                        "Hello World \n https://google.com")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on Whatsapp"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareTelegram(
                        "Hello World \n https://google.com")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on Telegram"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.checkInstalledAppsForShare().then((data) {
                      print(data.toString());
                    });
                  },
                  child: Text("Get all Apps"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
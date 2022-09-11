import 'dart:async';
// @dart=2.9
import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADS KH',

      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Ink.image(image: const NetworkImage('https://i.postimg.cc/XvNQt9n9/ADVKH.png'),fit: BoxFit.cover,height: 40,width: 100,),
        backgroundColor: Colors.black45,
        elevation: 8,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('សូមរងចាំ 5វិនាទី / Wait 5s'),
                      SizedBox(height: 10,),
                      AsyncButtonBuilder(
                        child: const Text('ចុចត្រង់នេះរួចសូមរងចាំ 5វិនាទី៊ / Click here and wait 5s'),
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 5));
                          _launchURL();
                        },
                        builder: (context, child, callback, _) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            onPressed: callback,
                            child: child
                          );
                        },
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network('https://i.postimg.cc/XNPsRpJm/Untitled-2.png'),
                        SizedBox(height: 5,),
                        ElevatedButton(onPressed: (){
                          _launchURLbuynow();
                        },
                          child: Text("BUY NOW"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),),

                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(child: Image.network('https://i.postimg.cc/LsBYvpMs/label-promotiin.png')),
                        SizedBox(height: 5,),
                        ElevatedButton(onPressed: (){
                          _launchURLbuynow();
                        },
                          child: Text("BUY NOW"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),),
                      ],
                    )
                ),
                // Padding(
                //     padding: EdgeInsets.only(top: 50),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Image.network('https://i.postimg.cc/LsBYvpMs/label-promotiin.png')
                //       ],
                //     )
                // )
              ],
            )
          ),
        )
      ),
    );
  }
}
_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURLbuynow() async {
  const url = 'https://www.facebook.com/smallstorekh/';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: true);
  } else {
    throw 'Could not launch $url';
  }
}
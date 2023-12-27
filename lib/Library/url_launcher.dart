import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart' as launcher;
class UrlLauncherExample extends StatefulWidget {
  const UrlLauncherExample({super.key});

  @override
  State<UrlLauncherExample> createState() => _UrlLauncherExampleState();
}

class _UrlLauncherExampleState extends State<UrlLauncherExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Url Launcher Page'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            launchButton(
                title: 'Launch Phone Icon',
                icon: Icons.phone,
                onPressed: () async {
                  Uri uri = Uri.parse('tel: +880-15170-53529');
                  if(!await launcher.launch(uri.toString())){
                    debugPrint(
                      "Could Not Launch The Uri"
                    );
                  }

            }
            ),
            Gap(10),
            launchButton(
                title: "Launch Website/Url",
                icon: Icons.language,
                onPressed: (){
                  launcher.launchUrl(Uri.parse('https://flutter.dev'),
                    mode: launcher.LaunchMode.externalApplication,
                  );
                }),
            Gap(10),
            launchButton(
                title: 'Launch SMs /Message ',
                icon: Icons.message,
                onPressed: () => launcher.launchUrl(Uri.parse(
                    'sms:555010123${Platform.isAndroid ? '?' : '&'}body=Message from flutter app',),
                ),
            ),
            Gap(10),
            launchButton(
                title: 'Launch Email',
                icon: Icons.email,
                onPressed: () async{
                  Uri uri = Uri.parse(
                    'mailto:sharifdu44@gmail.com?sub=Flutter Uri Launcher&body= Hi, Flutter Developer'
                  );
                  if(!await launcher.launchUrl(uri)){
                    debugPrint("Could Not Launch the Uri");
                  }
                }),
            Gap(10),
            Container(
              height: 50,
              child: BottomNavigationExample(),
            ),

          ],
        ),
      ),

    );
  }
  Widget launchButton ({
    required String title,
    required IconData icon,
    required Function () onPressed,

}){
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: 20,),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              )

            ],

          ),
      ),
    );
  }
}

import 'dart:io';

import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
class DeviceInfoExample extends StatefulWidget {
  const DeviceInfoExample({super.key});


  @override
  State<DeviceInfoExample> createState() => _DeviceInfoExampleState();
}
final deviceInfoPlugin = DeviceInfoPlugin();

class _DeviceInfoExampleState extends State<DeviceInfoExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Information Page'),
      ),
      body: Platform.isAndroid?
          showAndroidInfo():
          Platform.isIOS?
              showIOSInfo()
              :Container(),



    );
  }
  showAndroidInfo(){
    return FutureBuilder(future: deviceInfoPlugin.androidInfo,
        builder: (context, snapshot){
      if(snapshot.hasError){
        return Center(
          child: Text(snapshot.error.toString()),
        );

      }
      else if(snapshot.hasData){
        AndroidDeviceInfo info = snapshot.data!;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              item('Android Model', info.model),
              item('Android Brand', info.brand),
              item('Android Device', info.device),
              item('Android Hardware', info.hardware),
              item('Android Host', info.host),
              item('Android Id', info.id),
              item('Android Is Physical', info.isPhysicalDevice.toString()),
              item('Android SDK Int', info.version.sdkInt.toString()),
              Container(
                height: 50,
                child: BottomNavigationExample(),
              )
            ],
          ),

        );
      }
      else{
        return const CircularProgressIndicator();
      }

        }
        );
  }
  showIOSInfo(){
    return FutureBuilder(future: deviceInfoPlugin.iosInfo,
        builder: (context, snapshot){
      if(snapshot.hasError){
        return Center(
          child: Text(snapshot.error.toString()),
        );

      }
      else if(snapshot.hasData){
        IosDeviceInfo info = snapshot.data!;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              item('Device Model', info.model),
              item('Device Name', info.name),
              item('System Name', info.systemName),
              item('System Version', info.systemVersion),
              item('Device is Physical', info.isPhysicalDevice.toString()),
              Container(
                height: 50,
                child: BottomNavigationExample(),
              )
            ],
          ),
        );
      }
      else{
        return const CircularProgressIndicator();
      }

        }
        );

  }
  item(String name, String value){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

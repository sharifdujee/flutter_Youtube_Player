import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
class ConnectivityCheckExample extends StatefulWidget {
  const ConnectivityCheckExample({super.key});

  @override
  State<ConnectivityCheckExample> createState() => _ConnectivityCheckExampleState();
}

class _ConnectivityCheckExampleState extends State<ConnectivityCheckExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity Check '),
      ),
      body:Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot){
            print(snapshot.toString());
            if(snapshot.hasData){
              ConnectivityResult? result = snapshot.data;
              if(result == ConnectivityResult.mobile){
                return connection('Mobile');
              }
              else if(result==ConnectivityResult.wifi){
                return connection('Wifi');

              }
              else{
                return noInternet();
              }
            }
            else{
              return loading();
            }

          },

        ),

      ),
    );
  }
  Widget loading(){
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  Widget connection(String type){
    return Center(
      child: Text(
        "$type connected",
        style: TextStyle(
          color: Colors.green,
          fontSize: 20
        ),
      )

    );
  }

  Widget noInternet(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('images/img_3.png'),
          color: Colors.red,
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text('No Internet Connection',
            style: TextStyle(
              fontSize: 22
            ),
          ),
          
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text('Check Your Connection, then Refresh The Page'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
            onPressed: () async{
            ConnectivityResult result = await Connectivity().checkConnectivity();
            print(result);
            }, child: const Text('Refresh'))
      ],
    );
  }

}

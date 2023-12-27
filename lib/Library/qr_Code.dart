import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGeneratorExample extends StatefulWidget {
  const QrCodeGeneratorExample({Key? key}) : super(key: key);

  @override
  State<QrCodeGeneratorExample> createState() => _QrCodeGeneratorExampleState();
}

class _QrCodeGeneratorExampleState extends State<QrCodeGeneratorExample> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => data = value),
              decoration: const InputDecoration(labelText: 'Type Your Data'),
            ),
            const SizedBox(
              height: 20,
            ),
            QrImageView(
              data: '123456',
              version: QrVersions.auto,
              size: 200,
            ),
            const SizedBox(
              height: 5,
            ),
            data != null
                ? QrImageView(
                    data: data.toString(),
                    padding: EdgeInsets.all(0),
                    embeddedImage: const AssetImage('images/img_1.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: const Size(50, 50),
                    ),
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: BottomNavigationExample(),

            ),
            Row(
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [

                      ],
                    ),

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

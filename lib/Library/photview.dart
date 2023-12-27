
import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewExample extends StatefulWidget {
  const PhotoViewExample({super.key});

  @override
  State<PhotoViewExample> createState() => _PhotoViewExampleState();
}

class _PhotoViewExampleState extends State<PhotoViewExample> {
  final imageList = [
    'images/img.png',
    'images/img_1.png',
    'images/img_2.png',
    'images/img_3.png',
    'images/img_4.png',
    'images/img_5.png',
    'images/img_6.png',
    'images/img_7.png',
    'images/img_8.png',
    'images/img_9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo View'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 250,
                child: PhotoView(
                  enableRotation: true,
                  imageProvider: NetworkImage(
                    'https://scontent.fdac20-1.fna.fbcdn.net/v/t39.30808-6/365196886_1436748287157226_7173779355715945466_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a73e89&_nc_ohc=R63vxDCfCusAX_vkKsX&_nc_ht=scontent.fdac20-1.fna&oh=00_AfBs-ECm6EKucJqdnC5BJw9K7glQkYh-IS8E4fetzPjcew&oe=657FE3DE',
                  ),
                ),
              ),
              Gap(10),
              Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: PhotoViewGallery.builder(
                  itemCount: imageList.length,
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                        filterQuality: FilterQuality.medium,
                        disableGestures: true,
                        basePosition: Alignment.centerRight,
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                        imageProvider: AssetImage(imageList[index]),
                        minScale: PhotoViewComputedScale.contained * 0.08,
                        maxScale: PhotoViewComputedScale.contained * 2);

                  },
                  scrollPhysics: const BouncingScrollPhysics(
                  ),
                  gaplessPlayback: true,
                  reverse: true,
                  allowImplicitScrolling: true,


                  backgroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Theme.of(context).canvasColor,
                  ),
                  enableRotation: true,

                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.orange,
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                event.cumulativeBytesLoaded,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(10),
              Container(
                height: 50,
                child: BottomNavigationExample(),
              ),
              Gap(10),
              Container(
                height: 10,
                child: FloatingActionButton(
                    onPressed: (){}
                ),

              ),
            ],
          ),
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget{
  final String title;
  final String subTitle;
  const TopTitle({
    super.key,
    required this.title,
    required this.subTitle,
});
  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(subTitle,
            style: TextStyle(
                fontSize: 10,
                color: Colors.grey
            ),
          )

        ],
      ),
    );
  }
}

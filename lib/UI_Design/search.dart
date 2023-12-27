
import 'package:Flutter_Library/UI_Design/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    bool _isSearching = false;
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : Text('My App'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
            icon: Icon(_isSearching ? Icons.close : Icons.search),
          ),
        ],
      ),
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/29/53/e5/2953e5690dd90cbc50d546352aa25371.jpg'),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tulsi Planet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text('${12.50}'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.favorite)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.00),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.mygardenbd.com/wp-content/uploads/2019/12/Cactus-Succulents-MGCS5022.jpg'),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cactus",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text('15'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/29/53/e5/2953e5690dd90cbc50d546352aa25371.jpg'),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tulsi Planet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text('${12.50}'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.favorite)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/29/53/e5/2953e5690dd90cbc50d546352aa25371.jpg'),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tulsi Planet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text('${12.50}'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.favorite)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/29/53/e5/2953e5690dd90cbc50d546352aa25371.jpg'),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tulsi Planet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text('${12.50}'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.favorite)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/29/53/e5/2953e5690dd90cbc50d546352aa25371.jpg'),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,

                        ),

                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tulsi Planet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text('${12.50}'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.favorite
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails()));

                            }, child: Text('Details')
                            ),

                          ],

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            NeoPopButton(
                onTapUp: () {},
                animationDuration: Duration(microseconds: 500),
                onTapDown: () => HapticFeedback.vibrate(),
                parentColor: Colors.yellow,
                buttonPosition: Position.center,
                shadowColor: Colors.red,
                border: Border.fromBorderSide(
                    BorderSide(color: Colors.deepOrange, width: 5)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Go To Pay ")],
                  ),
                ),
                color: Colors.white70),
          ],
        ),
      ),
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //
      //               SizedBox(height: 8.0),
      //               Text(
      //                 'Price',
      //                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(height: 8.0),
      //               Icon(
      //                 Icons.star,
      //                 color: Colors.yellow,
      //                 size: 30.0,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        autofocus: true,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

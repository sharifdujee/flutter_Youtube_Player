import 'package:flutter/material.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
             Column(
               children: [
                 Image(image: NetworkImage('https://i.pinimg.com/736x/29/53/e5/2953e5690dd90cbc50d546352aa25371.jpg'),
                   height: 100,
                   width: 100,
                   fit: BoxFit.cover,
                 ),
                 Text('Lucky-Jade-Planet'),
                 Text("Planet Make Your Life with minimal and Happy , Love The Planet More and Enjoy Life"),
               ],
             ),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.height),
                            Text('Height'),
                            Text('30-35 MM')
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.height),
                            Text('Height'),
                            Text('30-35 MM')
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.height),
                            Text('Height'),
                            Text('30-35 MM')
                          ],
                        ),
                        Row(
                          children: [
                            Text('Total Price'),
                            FloatingActionButton(onPressed: (){

                              Text('Add to Cart');
                            }

                            ),
                          ],
                        ),
                      ],

                    ),
                  )
                ],

              ),
            ],
          ),
        ),
      ),
    );

  }
}

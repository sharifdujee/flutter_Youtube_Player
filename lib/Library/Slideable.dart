import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableExample extends StatefulWidget {
  const SlidableExample({super.key});

  @override
  State<SlidableExample> createState() => _SlidableExampleState();
}

class _SlidableExampleState extends State<SlidableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slideble Example'),
      ),
      body: ListView(
        children: [
          Slidable(
            key: const ValueKey(0),
              startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),

                  children: const [
                    SlidableAction(
                        onPressed: doNothing,
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',

                    ),
                    SlidableAction(onPressed: doNothing,
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                    ),
                    SlidableAction(onPressed: doNothing,
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archieves',
                    ),
                    SlidableAction(onPressed: doNothing,
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'share',
                    ),




                  ]),
              child: const ListTile(
                title: Text("Slide Me"),
              ),

          ),
          Slidable(
            key: const ValueKey(1),
              startActionPane: const ActionPane(
                  motion: DrawerMotion(),
                  children:  const [
                    SlidableAction(onPressed: doNothing,
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white,
                    icon: Icons.add,
                    label: 'Add',)
                    
                  ]),
              child: const ListTile(
                title: Text('Slide Me Again'),
              )
          ),
          Slidable(
              key: const ValueKey(1),
              startActionPane: const ActionPane(
                  motion: BehindMotion(),
                  children:  const [
                    SlidableAction(onPressed: doNothing,
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.white,
                      icon: Icons.add,
                      label: 'Add',)

                  ]),
              child: const ListTile(
                title: Text('Slide Me Again'),
              )
          ),
          Slidable(
              key: const ValueKey(1),
              startActionPane: const ActionPane(
                  motion: StretchMotion(),
                  children:  const [
                    SlidableAction(onPressed: doNothing,

                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.white,
                      icon: Icons.add,
                      label: 'Add',

                    ),


                  ]),
              child: const ListTile(
                title: Text('Slide Me Again'),
              )
          ),

        ],

      ),

    );
  }
}
void doNothing(BuildContext context) {}

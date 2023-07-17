import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Orientation Demo';

    return MaterialApp(
      title: appTitle,
      home: OrientationList(
        title: appTitle,
        key: Key('OrientationList'),
      ),
    );
  }
}

class OrientationList extends StatelessWidget {
  final String title;

  OrientationList({required Key key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
            children: List.generate(10, (index) {
              return myWidget();
            }),
          );
        },
      ),
    );
  }
}

Widget myWidget() {
  return Container(
    margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(10.0),
    decoration: myBoxDecoration(), //             <--- BoxDecoration here
    child: Center(
      child: Text(
        "text",
        style: TextStyle(fontSize: 20.0),
      ),
    ),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
  );
}

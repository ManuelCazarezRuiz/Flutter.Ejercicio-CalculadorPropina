import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.red,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              new Container(
                margin: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 1,
                  children: List.generate(30, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  }),
                ),
              ),
              new Row(
                children: <Widget>[
                  const FlutterLogo(),
                  const Expanded(
                    child: const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
                  ),
                  const Icon(Icons.sentiment_very_satisfied),
                ],
              ),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
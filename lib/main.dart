import 'package:flutter/material.dart';

void main() {
  runApp(const ContactProfilePage());
}

class ContactProfilePage extends StatelessWidget {
  const ContactProfilePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(icon: const Icon(Icons.arrow_back,), onPressed: () {  },),
          actions: [
            IconButton(icon: const Icon(Icons.star_border), onPressed: () => print('Contact is starred'),),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Image.network(
                  'https://avatars.githubusercontent.com/u/47828494?v=4',
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '7yrionLannister',
                        style: TextStyle(fontSize: 30,),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButtonWithTextBelow('Call', Icons.call, () {}),
                      _buildButtonWithTextBelow('Text', Icons.message, () {}),
                      _buildButtonWithTextBelow('Video', Icons.video_call, () {}),
                      _buildButtonWithTextBelow('Email', Icons.email, () {}),
                      _buildButtonWithTextBelow('Directions', Icons.directions, () {}),
                      _buildButtonWithTextBelow('Pay', Icons.attach_money, () {}),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                _buildListTile(Icons.smartphone, 'mobile', '3123456789', Icons.message),
                _buildListTile(Icons.phone, 'other', '3127893456', Icons.message),
                const Divider(
                  color: Colors.grey,
                ),
                _buildListTile(Icons.email, 'work', 'pepe@example.com', Icons.alternate_email),
                const Divider(
                  color: Colors.grey,
                ),
                _buildListTile(Icons.location_on, 'home', '10880 Malibu Point, 90265', Icons.directions),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  Widget _buildButtonWithTextBelow(String title, IconData icon, Null Function() onPressed) => Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: Colors.indigo.shade800,
        ),
        Text(title),
      ],
    );

  Widget _buildListTile(IconData cueIcon, String title, String number, IconData actionIcon) => ListTile(
    leading: Icon(cueIcon),
    title: Text(number),
    subtitle: Text(title),
    trailing: IconButton(
      icon: Icon(actionIcon),
      color: Colors.indigo.shade500,
      onPressed: () {},
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

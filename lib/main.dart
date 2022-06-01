import 'package:contacts/my_app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactProfilePage());
}

class ContactProfilePage extends StatefulWidget {
  const ContactProfilePage({Key? key}) : super(key: key);

  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  var currentTheme = APP_THEME.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      // GLOBAL THEME
      theme: currentTheme == APP_THEME.dark ? MyAppThemes.appThemeDark() : MyAppThemes.appThemeLight(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildMainScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentTheme = currentTheme == APP_THEME.dark ? APP_THEME.light : APP_THEME.dark;
            });
          },
          child: const Icon(Icons.threesixty),
        ),
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  AppBar _buildAppBar() => AppBar(
    leading: IconButton(icon: const Icon(Icons.arrow_back,), onPressed: () {  },),
    actions: [
      IconButton(icon: const Icon(Icons.star_border), onPressed: () => print('Contact is starred'),),
    ],
  );

  Widget _buildMainScreen() => ListView(
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
  );

  Widget _buildButtonWithTextBelow(String title, IconData icon, Null Function() onPressed) => Column(
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
      Text(title),
    ],
  );

  Widget _buildListTile(IconData cueIcon, String title, String number, IconData actionIcon) => ListTile(
    leading: Icon(cueIcon),
    title: Text(number),
    subtitle: Text(title),
    // LOCAL THEME
    trailing: Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
            color: Colors.purple.shade900
        ),
      ),
      child: IconButton(
        icon: Icon(actionIcon),
        onPressed: () {},
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:mad/util/route_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isKhmer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 1,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Guest"),
            subtitle: Text("Username"),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.mode),
            title: Text("Light"),
            subtitle: Text("Mode"),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.flag),
              title: Text("${isKhmer ? "Khmer" : "English"}"),
              subtitle: Text("Language"),
              trailing: Icon(Icons.navigate_next),
            ),
            onTap: (){
              _onNavigateToLanguageScreen();
            },
          ),
          Divider(),

        ],
      ),
    );
  }

  void _onNavigateToLanguageScreen() async {
    final _isKhmer = await Navigator.pushNamed(context, RouteManager.languageScreen, arguments: isKhmer);
    print("IsKhmer : $_isKhmer");
    setState(() {
      isKhmer = _isKhmer as bool;
    });
  }
}

import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {

   LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  bool _isKhmer = true;

  @override
  Widget build(BuildContext context) {

    final isKhmer = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      _isKhmer = isKhmer as bool;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
        elevation: 1,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.flag),
            title: Text("Khmer"),
            subtitle: Text("Language"),
            trailing: Checkbox(value: _isKhmer, onChanged: (v){
              setState(() {
                _isKhmer = true;
              });
              Navigator.pop(context, _isKhmer);
            })
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text("English"),
            subtitle: Text("Language"),
            trailing: Checkbox(value: !_isKhmer, onChanged: (v){
              setState(() {
                _isKhmer = false;
              });
              Navigator.pop(context, _isKhmer);
            })
          ),
          Divider(),
        ],
      ),
    );
  }
}

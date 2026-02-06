import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        elevation: 0.5,
      ),
      body: Center(
        child: _isFavorite ? GestureDetector(
          child: Icon(Icons.favorite, size: 50,color: Colors.red,) ,
          onTap: _onIconClick,
        ): GestureDetector(
          child: Icon(Icons.favorite, size: 50,) ,
          onTap: _onIconClick
        ),
      ),
    );
  }

  void _onIconClick(){
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }



}

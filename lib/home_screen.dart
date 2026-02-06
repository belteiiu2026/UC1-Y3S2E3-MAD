import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {





  @override
  Widget build(BuildContext context) {

    List<Widget> items = List.generate(50, (i){
      // return ListTile(
      //   title: Text("Item $i"),
      //   subtitle: Text("2\$"),
      //   leading: Icon(Icons.favorite),
      // );

      return SizedBox(
        // width: 100,
        // height: 100,
        child: Icon(Icons.favorite),
      );
    }).toList();


    final _menuRowTitleWidget = Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Categories", style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
    ),),
        Text("See All", style: TextStyle(fontSize: 18),)
      ],
    ),);

    List<Widget> _menuItemsWidget = List.generate(10, (i){
        return SizedBox(
          height: 100,
          child: Card(
            child: Column(
              children: [
                Icon(Icons.favorite, color: Colors.pink,),
                Text("Mountains")
              ],
            ),
          ),
        );
    }).toList();

    final _menuItemsRowWidget = SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _menuItemsWidget,
      ),
    );

    final _recomRowTitleWidget = Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Recommend", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
          Text("See All", style: TextStyle(fontSize: 18),)
        ],
      ),);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, Chivon"),
        centerTitle: false,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          _menuRowTitleWidget,
          _menuItemsRowWidget,
          _recomRowTitleWidget
        ],
      )
    );
  }
}

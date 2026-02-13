import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


    Future<List<String>> _loadProductFromServer() async {
      await Future.delayed(Duration(seconds: 3));
      // throw("Internal Server Error");
      List<String> products = List.generate(10, (i) => "Product $i").toList();
      return products;
    }


    Widget get _listRecomProductWidget {
      Widget productsList = FutureBuilder(
          future: _loadProductFromServer(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

              // Uncompleted
              if(snapshot.connectionState != ConnectionState.done){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }

              // Completed
              // Error
              if(snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }

              // Success
              List<String> products = snapshot.data;

              List<Widget> items =  products.map((p) {
                return Card(
                  child: Row(
                    children: [
                      Image.asset("assets/images/uc1.jpg", fit: BoxFit.cover, width: 100,height: 100,),
                      // Text("$p"),
                    ],
                  ),
                );
              }).toList();

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items,
                ),
              );


              // return ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     itemCount: products.length,
              //     itemBuilder: (BuildContext context, int index){
              //       String product = products[index];
              //       return ListTile(
              //         leading: Image.asset("assets/images/uc1.jpg"),
              //         title: Text("$product"),
              //       );
              //     });

          });
      return productsList;
    }


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
          _recomRowTitleWidget,
          _listRecomProductWidget
        ],
      )
    );
  }
}

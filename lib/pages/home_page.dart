import 'dart:convert';
import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/wigets/home_widget/catalog_header.dart';
import 'package:catalog/wigets/home_widget/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/6066b7d20ff4a63dc827720a/2";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.theme.cardColor,
          child: Icon(
            CupertinoIcons.cart,
            color: context.theme.backgroundColor,
          ),
        ).badge(
            size: 20.0,
            count: _cart.items.length,
            textStyle: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

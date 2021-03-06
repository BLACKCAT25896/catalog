import 'package:catalog/models/catalog.dart';
import 'package:catalog/wigets/home_widget/add_to_cart.dart';
import 'package:catalog/wigets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsPage extends StatelessWidget {
  final Item catalog;

  const DetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$ ${catalog.price}".text.bold.xl4.red800.make(),
              AddToCart(catalog: catalog),
            ],
          ).p16(),
        ),
        body: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(MyTheme.darkBlueshColor)
                          .make(),
                      catalog.description.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

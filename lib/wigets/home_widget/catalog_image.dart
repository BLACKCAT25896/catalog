import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogIMage extends StatelessWidget {
  final String image;

  const CatalogIMage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.theme.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}

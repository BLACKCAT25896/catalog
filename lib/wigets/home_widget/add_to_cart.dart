import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/wigets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueshColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          ),
        ),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}

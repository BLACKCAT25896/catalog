import 'package:catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  CatalogModel _catalog;

  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  //add items

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

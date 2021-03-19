class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Iphone 6",
        description: "Iphone 6 256 GD ROM 8 GB RAM",
        price: 999,
        color: "#1c1c1c",
        image:
            "https://www.mobiledokan.com/wp-content/uploads/2019/03/Apple-iPhone-8-Black.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.color,
      this.image});
}

class MenuItem {
  int id = -1;
  String name = "";
  String type = "";
  double price = 0.0;

  MenuItem(
      {required this.id,
      required this.name,
      required this.type,
      required this.price});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: json['price'].toDouble(),
    );
  }
}

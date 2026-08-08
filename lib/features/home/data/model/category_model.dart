class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final int? itemsCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.itemsCount
  });

  factory CategoryModel.fromJson(
      Map<String, dynamic> json,
      String id,
      ) {
    return CategoryModel(
      id: id,
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      itemsCount: json['itemsCount'],
    );
  }}
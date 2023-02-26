class Promotion {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final String validity;
  final String location;

  Promotion({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.validity,
    required this.location,
  });
}

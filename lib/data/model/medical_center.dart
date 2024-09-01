class MedicalCenter {
  late int id;
  late String name;
  late String type;
  late List<String> servicesProvided;
  late String sector;
  late String location;
  late Uri mapLocation;
  late String filterType;

  MedicalCenter({
    required this.id,
    required this.name,
    required this.type,
    required this.sector,
    required this.servicesProvided,
    required this.location,
    required this.mapLocation,
    required this.filterType,
  });

  factory MedicalCenter.fromJson(Map<String, dynamic> json) {
    List<String> list = [];
    for (var element in json['servicesProvided']) {
      list.add(element);
    }
    return MedicalCenter(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        sector: json['sector'],
        servicesProvided: list,
        location: json['location'],
        mapLocation: Uri.parse(json['mapLocation']),
        filterType: json['filterType']);
  }
}

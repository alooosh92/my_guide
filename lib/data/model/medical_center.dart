class ContactInformation {
  late String type;
  late String value;

  ContactInformation({
    required this.type,
    required this.value,
  });
  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      type: json['type'],
      value: json['value'],
    );
  }
  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class MedicalCenter {
  late int id;
  late String name;
  late String filterType;
  late String type;
  late String sector;
  late String location;
  late String mapLocation;
  late List<String> servicesProvided;
  late List<String> workingHours;
  late List<ContactInformation> contactInformation;

  MedicalCenter({
    required this.id,
    required this.name,
    required this.filterType,
    required this.type,
    required this.sector,
    required this.location,
    required this.mapLocation,
    required this.servicesProvided,
    required this.workingHours,
    required this.contactInformation,
  });

  factory MedicalCenter.fromJson(Map<String, dynamic> json) {
    List<ContactInformation> conInf = [];
    List<String> serPro = [];
    List<String> worHou = [];
    for (var element in json['contactInformation']) {
      conInf.add(ContactInformation.fromJson(element));
    }
    for (var element in json['servicesProvided']) {
      serPro.add(element);
    }
    for (var element in json['workingHours']) {
      worHou.add(element);
    }
    return MedicalCenter(
      id: json['id'],
      name: json['name'],
      filterType: json['filterType'],
      type: json['type'],
      sector: json['sector'],
      location: json['location'],
      mapLocation: json['mapLocation'],
      servicesProvided: serPro,
      workingHours: worHou,
      contactInformation: conInf,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> conInf = [];
    for (var element in contactInformation) {
      conInf.add(element.toJson());
    }

    return {
      "id": id,
      "name": name,
      "filterType": filterType,
      "type": type,
      "sector": sector,
      "location": location,
      "mapLocation": mapLocation,
      "servicesProvided": servicesProvided,
      "workingHours": workingHours,
      "contactInformation": conInf,
    };
  }
}



// class MedicalCenter {
//   late int id;
//   late String name;
//   late String type;
//   late List<String> servicesProvided;
//   late String sector;
//   late String location;
//   late Uri mapLocation;
//   late String filterType;

//   MedicalCenter({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.sector,
//     required this.servicesProvided,
//     required this.location,
//     required this.mapLocation,
//     required this.filterType,
//   });

//   factory MedicalCenter.fromJson(Map<String, dynamic> json) {
//     List<String> list = [];
//     for (var element in json['servicesProvided']) {
//       list.add(element);
//     }
//     return MedicalCenter(
//         id: json['id'],
//         name: json['name'],
//         type: json['type'],
//         sector: json['sector'],
//         servicesProvided: list,
//         location: json['location'],
//         mapLocation: Uri.parse(json['mapLocation']),
//         filterType: json['filterType']);
//   }
// }

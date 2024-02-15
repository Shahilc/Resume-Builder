class ModelClass {
  ModelClass({
    required this.imageUrl,
    required this.profileData,
    required this.summery,
    required this.experienceData,
    required this.educationData,
    required this.skills,
    required this.hobbies,
  });

  final String? imageUrl;
  final ProfileData? profileData;
  final String? summery;
  final List<ExperienceDatum> experienceData;
  final List<EducationDatum> educationData;
  final List<Hobby> skills;
  final List<Hobby> hobbies;

  factory ModelClass.fromJson(Map<String, dynamic> json){
    return ModelClass(
      imageUrl: json["imageUrl"],
      profileData: json["profileData"] == null ? null : ProfileData.fromJson(json["profileData"]),
      summery: json["summery"],
      experienceData: json["experienceData"] == null ? [] : List<ExperienceDatum>.from(json["experienceData"]!.map((x) => ExperienceDatum.fromJson(x))),
      educationData: json["educationData"] == null ? [] : List<EducationDatum>.from(json["educationData"]!.map((x) => EducationDatum.fromJson(x))),
      skills: json["skills"] == null ? [] : List<Hobby>.from(json["skills"]!.map((x) => Hobby.fromJson(x))),
      hobbies: json["hobbies"] == null ? [] : List<Hobby>.from(json["hobbies"]!.map((x) => Hobby.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "profileData": profileData?.toJson(),
    "summery": summery,
    "experienceData": experienceData.map((x) => x.toJson()).toList(),
    "educationData": educationData.map((x) => x.toJson()).toList(),
    "skills": skills.map((x) => x.toJson()).toList(),
    "hobbies": hobbies.map((x) => x.toJson()).toList(),
  };

}

class EducationDatum {
  EducationDatum({
    required this.universityName,
    required this.courseName,
  });

  final String? universityName;
  final String? courseName;

  factory EducationDatum.fromJson(Map<String, dynamic> json){
    return EducationDatum(
      universityName: json["universityName"],
      courseName: json["courseName"],
    );
  }

  Map<String, dynamic> toJson() => {
    "universityName": universityName,
    "courseName": courseName,
  };

}

class ExperienceDatum {
  ExperienceDatum({
    required this.companyName,
    required this.position,
  });

  final String? companyName;
  final String? position;

  factory ExperienceDatum.fromJson(Map<String, dynamic> json){
    return ExperienceDatum(
      companyName: json["companyName"],
      position: json["position"],
    );
  }

  Map<String, dynamic> toJson() => {
    "companyName": companyName,
    "position": position,
  };

}

class Hobby {
  Hobby({
    required this.name,
  });

  final String? name;

  factory Hobby.fromJson(Map<String, dynamic> json){
    return Hobby(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
  };

}

class ProfileData {
  ProfileData({
    required this.header,
    required this.name,
    required this.contactNo,
    required this.emailId,
    required this.address,
  });

  final String? header;
  final String? name;
  final String? contactNo;
  final String? emailId;
  final String? address;

  factory ProfileData.fromJson(Map<String, dynamic> json){
    print(json);
    return ProfileData(
      header: json["header"],
      name: json["name"],
      contactNo: json["contactNo"],
      emailId: json["emailId"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() => {
    "header": header,
    "name": name,
    "contactNo": contactNo,
    "emailId": emailId,
    "address": address,
  };

}

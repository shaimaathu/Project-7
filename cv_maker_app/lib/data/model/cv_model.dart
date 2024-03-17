class CVModel {
  CVModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.objective,
    required this.education,
    this.experience,
    required this.skills,
    required this.userId,
    required this.dateOfBirth,
    this.image,
  });
  late final String id;
  late final String fullName;
  late final String email;
  late final String phoneNumber;
  late final String address;
  late final String objective;
  late final String education;
  String? experience;
  late final String skills;
  late final String userId;
  late final String dateOfBirth;
  String? image;
  
  CVModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    objective = json['objective'];
    education = json['education'];
    experience = json['experience'] ?? "";
    skills = json['skills'];
    userId = json['userId'];
    dateOfBirth = json['date_of_birth'];
    image = json['image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['full_name'] = fullName;
    _data['email'] = email;
    _data['phone_number'] = phoneNumber;
    _data['address'] = address;
    _data['objective'] = objective;
    _data['education'] = education;
    _data['experience'] = experience ?? "";
    _data['skills'] = skills;
    _data['userId'] = userId;
    _data['date_of_birth'] = dateOfBirth;
    _data['image'] = image ?? "";
    return _data;
  }
}
class EducationModel {
  EducationModel({
    required this.universityName,
    required this.startDate,
    required this.endDate,
    required this.degree,
    required this.specialization,
  });
  late final String universityName;
  late final String startDate;
  late final String endDate;
  late final String degree;
  late final String specialization;
  
  EducationModel.fromJson(Map<String, dynamic> json){
    universityName = json['university_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    degree = json['degree'];
    specialization = json['specialization'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['university_name'] = universityName;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['degree'] = degree;
    _data['specialization'] = specialization;
    return _data;
  }
}
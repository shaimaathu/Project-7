class ExperienceModel {
  ExperienceModel({
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
  });
  late final String company;
  late final String position;
  late final String startDate;
  late final String endDate;

  ExperienceModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    position = json['position'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['company'] = company;
    data['position'] = position;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

import 'package:cv_maker_app/data/model/cv_model.dart';
import 'package:cv_maker_app/data/model/education_model.dart';
import 'package:cv_maker_app/data/model/experience_model.dart';
import 'package:get_storage/get_storage.dart';

class AllData {
  final box = GetStorage();
  String token = '';
  String id = '';
  String name = '';
  String email = '';
  String phone = '';
  String address = '';
  String dateOfBirth = '';
  String skills = '';
  String objective = '';
  late CVModel userCv;
  List<EducationModel> educationList = []; // List to store education entries
  List<ExperienceModel> experienceList = []; // List to store education entries

  AllData() {
    getToken();
  }

  addToken() async {
    if (token.isNotEmpty) {
      await box.write("token", token);
    }
    box.save();
  }

  getToken() {
    if (box.hasData("token")) {
      if (token.isEmpty) {
        token = box.read("token");
      }
    }
  }

  signOut() {
    token = '';
    name = '';
    email = '';
    phone = '';
    address = '';
    dateOfBirth = '';
    skills = '';
    objective = '';
    educationList = []; // List to store education entries
    experienceList = [];
    token = '';
    box.remove("token");
  }

  delete() {
    token = '';
    name = '';
    email = '';
    phone = '';
    address = '';
    dateOfBirth = '';
    skills = '';
    objective = '';
    educationList = []; // List to store education entries
    experienceList = [];
  }
}

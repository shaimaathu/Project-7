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
  CVModel userCv = CVModel(
      address: "",
      dateOfBirth: "",
      education: "",
      email: "",
      fullName: "",
      id: "",
      objective: "",
      phoneNumber: "",
      skills: "",
      userId: "",
      experience: "",
      image: "");
  List<EducationModel> educationList = []; 
  List<ExperienceModel> experienceList = []; 

  AllData() {
    getToken();
    getId();
  }

  addToken() async {
    if (token.isNotEmpty) {
      await box.write("token", token);
    }
    box.save();
  }

  addId() async {
    if (id.isNotEmpty) {
      await box.write("Id", id);
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

  getId() {
    if (box.hasData("Id")) {
      if (token.isEmpty) {
        id = box.read("Id");
      }
    }
  }

  signOut() {
    token = '';
    id = '';
    name = '';
    email = '';
    phone = '';
    address = '';
    dateOfBirth = '';
    skills = '';
    objective = '';
    educationList = []; 
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
    educationList = []; 
    experienceList = [];
  }
}

// import 'dart:io';

import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/data/model/cv_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;
  final locator = GetIt.I.get<AllData>();

  Future fetchCV() async {
    final notsData = await supabase.from('cv_data').select('*');
    List<CVModel> cvs = [];
    for (var element in notsData) {
      cvs.add(CVModel.fromJson(element));
    }
    return cvs;
  }

  Future fetchUserCv() async {
    print(" in the fetch by ${locator.id}");
    print(" in the fetch by ${locator.token}");
    final cvData = await supabase
        .from('cv_data')
        .select('*')
        .match({'userId': locator.id});
    print(" in the fetch${cvData.length}");
    final List<CVModel> cv = [];
    cv.add(CVModel.fromJson(cvData[0]));
    return cv;
  }

  //   Future fetchUserNots({required String id}) async {
  //   final notsData =
  //       await supabase.from('notes').select('*').match({'userId': id});
  //   List<NotsModel> nots = [];
  //   for (var element in notsData) {
  //     nots.add(NotsModel.fromJson(element));
  //   }
  //   return nots;
  // }

  // Future<String> _uploadImageToStorage(File imageFile) async {
  //   final storage = supabase.storage.from('buckets');

  //   final response = await storage.upload(
  //     'images/${DateTime.now().millisecondsSinceEpoch}.jpg',
  //     imageFile.readAsBytes() as File,
  //   );

  //   if (response.error != null) {
  //     throw Exception('Error uploading image: ${response.error!.message}');
  //   }

  //   return response.data!.url;
  // }

  Future addUser({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    await supabase.auth.signUp(email: email, password: password!);
  }

  Future logIn({
    required String? email,
    required String? password,
  }) async {
    await supabase.auth.signInWithPassword(email: email, password: password!);
    locator.token = supabase.auth.currentSession!.accessToken;
    locator.id = supabase.auth.currentSession!.user.id;
    locator.addToken();
    locator.addId();
  }

  Future signout() async {
    await supabase.auth.signOut();
    locator.signOut();
  }

  // Future getUserByToken() async {
  //   final userResponse = await supabase.auth.getUser(locator.token);
  //   locator.id = userResponse.user!.id;
  //   return userResponse.user!.id;
  // }

  Future addCV() async {
    await supabase.from('cv_data').insert({
      "full_name": locator.name,
      "email": locator.email,
      "phone_number": locator.phone,
      "address": locator.address,
      "objective": locator.objective,
      "education": locator.educationList[0],
      "experience":
          locator.experienceList.isEmpty ? '' : locator.experienceList[0],
      "skills": locator.skills,
      "userId": locator.id,
      "date_of_birth": locator.dateOfBirth,
      "image": ""
    });
  }

  Future editCv() async {
    await supabase.from('notes').update({
      "full_name": locator.name,
      "email": locator.email,
      "phone_number": locator.phone,
      "address": locator.address,
      "objective": locator.objective,
      "education": locator.educationList[0],
      "experience":
          locator.experienceList.isEmpty ? '' : locator.experienceList[0],
      "skills": locator.skills,
      "userId": locator.id,
      "date_of_birth": locator.dateOfBirth,
      "image": ""
    }).match({'userId': locator.id});
  }

  Future deleteCv({required id}) async {
    await supabase.from('cv_data').delete().match({'id': id});
  }
}

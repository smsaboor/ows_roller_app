import 'package:flutter/foundation.dart';
import 'package:ows_roller_app/model/local/local_data.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesVM extends ChangeNotifier {
  LocalData localData;
  SharedPreferencesVM({required this.localData});

  late String userLanguage;
  late AppUser userDetails;
  late int userType;
  late int freelancerUserType;
  late bool userLoginStatus;
  late List<String> userRecentSearches;
  late List<String> jobMatchList;
  late SharedPreferences sharedPreferences;
  late String mobile;

  String get getUserMobile =>localData.userMobile;


  SharedPreferences getSharedPreference() {
    sharedPreferences = localData.getLocalDataInstance();
    return sharedPreferences;
  }

  Future<void> setJobMatchList(List<String> list) async {
    await localData.addMatchList(list);
  }

  Future<List<String>> getJobMatchList() async {
    jobMatchList = await localData.fetchMatchList();
    return jobMatchList;
  }

  Future<void> removeJobMatchList() async {
    await localData.deleteMatchList();
  }

  Future<void> setRecentSearches(String searchText) async {
    await localData.addRecentSearchesText(searchText);
  }

  Future<List<String>> getRecentSearches() async {
    userRecentSearches = await localData.fetchRecentSearches();
    return userRecentSearches;
  }

  Future<void> removeRecentSearches() async {
    await localData.deleteRecentSearches();
  }

  Future<void> setSkillsSearches(String searchText) async {
    await localData.addSkillsSearchesText(searchText);
  }

  Future<List<String>> getSkillsSearches() async {
    userRecentSearches = await localData.fetchSkillsSearches();
    return userRecentSearches;
  }

  Future<void> removeSkillsSearches() async {
    await localData.deleteSkillsSearches();
  }

  Future<void> removeSkillsSearchesValue(String value) async {
    print('-removeSkillsSearchesValue---------------${value}');
    await localData.deleteSkillsSearchesValue(value);
  }

  Future<void> setUserDetails(AppUser userDetails) async {
    await localData.saveUserSession(userDetails);
    getUserDetails();
  }

  Future<AppUser> getUserDetails() async {
    userDetails = await localData.loadUserSession();
    notifyListeners();
    return userDetails;
  }



  Future<void> setUserLanguage(String newUserLanguage) async {
    await localData.addUserLanguage(newUserLanguage);
    userLanguage = newUserLanguage;
  }

  Future<String> getUserLanguage() async {
    userLanguage = await localData.fetchUserLanguage();
    return userLanguage;
  }

  Future<void> setLoginStatus(bool status) async {
    await localData.addLoginStatus(status);
  }

  Future<bool> getLoginStatus() async {
    userLoginStatus = await localData.fetchLoginStatus();
    return userLoginStatus;
  }

  Future<void> setUserType(int type) async {
    await localData.addUserType(type);
    userType = type;
  }

  Future<int> getUserType() async {
    userType = await localData.fetchUserType();
    return userType;
  }

}

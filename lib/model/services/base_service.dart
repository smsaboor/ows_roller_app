import 'package:dio/dio.dart';

abstract class BaseService {
  final String baseUrl = "https://mdmedico.com/blackbull/api/";
  final String apiFreelancerUrl = "freelancers_api.php";
  final String apiProjectUrl = "freelancers_api.php";
  final String apiJobUrl = "freelancers_api.php";
  final String apiSearchFreelancerUrl = "search_freelancers_api.php";
  Future<dynamic> post(String url, var body);
  Future<dynamic> uploadImage(String url, FormData data);
  Future<dynamic> get(String url);
}
import 'dart:convert';

List<ModelBetResponse> modelBetResponseFromJson(String str) => List<ModelBetResponse>.from(json.decode(str).map((x) => ModelBetResponse.fromJson(x)));

String modelBetResponseToJson(List<ModelBetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBetResponse {
  ModelBetResponse({
    this.response,
    this.message,
  });

  String? response;
  String? message;

  factory ModelBetResponse.fromJson(Map<String, dynamic> json) => ModelBetResponse(
    response: json["response"],
    message: json["message"],
  );
  ModelBetResponse fromJson(Map<String, dynamic> json) => ModelBetResponse(
    response: json["response"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "message": message,
  };
}

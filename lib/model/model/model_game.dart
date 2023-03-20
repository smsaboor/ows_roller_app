// To parse this JSON data, do
//
//     final modelGame = modelGameFromJson(jsonString);

import 'dart:convert';

List<ModelGame> modelGameFromJson(String str) => List<ModelGame>.from(json.decode(str).map((x) => ModelGame.fromJson(x)));

String modelGameToJson(List<ModelGame> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelGame {
  ModelGame({
    this.response,
    this.slotId,
    this.result,
    this.timeInterval,
  });

  int? response;
  String? slotId;
  String? result;
  Map<String, int>? timeInterval;

  factory ModelGame.fromJson(Map<String, dynamic> json) => ModelGame(
    response: json["response"],
    slotId: json["slot_id"],
    result: json["result"],
    timeInterval: Map.from(json["time_interval"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  ModelGame fromJson(Map<String, dynamic> json) => ModelGame(
    response: json["response"],
    slotId: json["slot_id"],
    result: json["result"],
    timeInterval: Map.from(json["time_interval"]).map((k, v) => MapEntry<String, int>(k, v)),
  );


  Map<String, dynamic> toJson() => {
    "response": response,
    "slot_id": slotId,
    "result": result,
    "time_interval": Map.from(timeInterval!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

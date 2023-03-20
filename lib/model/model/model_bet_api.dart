// To parse this JSON data, do
//
//     final modelGame = modelGameFromJson(jsonString);

import 'dart:convert';

List<ModelBetApi> modelGameFromJson(String str) => List<ModelBetApi>.from(json.decode(str).map((x) => ModelBetApi.fromJson(x)));

String modelGameToJson(List<ModelBetApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBetApi {
  ModelBetApi({
    this.user_id,
    this.slot_id,
    this.ball1_o_e,
    this.ball1_l_s,
    this.ball1_o_e_bet,
    this.ball1_l_s_bet,
    this.ball2_o_e,
    this.ball2_l_s,
    this.ball2_o_e_bet,
    this.ball2_l_s_bet,
    this.ball3_o_e,
    this.ball3_l_s,
    this.ball3_o_e_bet,
    this.ball3_l_s_bet,
    this.ball4_o_e,
    this.ball4_l_s,
    this.ball4_o_e_bet,
    this.ball4_l_s_bet,
    this.ball5_o_e,
    this.ball5_l_s,
    this.ball5_o_e_bet,
    this.ball5_l_s_bet
  });

  String? user_id;
  String?  slot_id;
  String? ball1_o_e;
  String? ball1_l_s;
  String? ball1_o_e_bet;
  String? ball1_l_s_bet;
  String? ball2_o_e;
  String? ball2_l_s;
  String? ball2_o_e_bet;
  String? ball2_l_s_bet;
  String? ball3_o_e;
  String? ball3_l_s;
  String? ball3_o_e_bet;
  String? ball3_l_s_bet;
  String? ball4_o_e;
  String? ball4_l_s;
  String? ball4_o_e_bet;
  String? ball4_l_s_bet;
  String? ball5_o_e;
  String? ball5_l_s;
  String? ball5_o_e_bet;
  String? ball5_l_s_bet;


  int? response;
  String? slotId;
  String? result;
  Map<String, int>? timeInterval;

  factory ModelBetApi.fromJson(Map<String, dynamic> json) => ModelBetApi(
    user_id: json["user_id"],
    slot_id: json["slot_id"],
    ball1_o_e: json["ball1_o_e"],
    ball1_l_s: json["ball1_l_s"],
    ball1_o_e_bet: json["ball1_o_e_bet"],
    ball1_l_s_bet: json["ball1_l_s_bet"],
    ball2_o_e: json["ball2_o_e"],
    ball2_l_s: json["ball2_l_s"],
    ball2_o_e_bet: json["ball2_o_e_bet"],
    ball2_l_s_bet: json["ball2_l_s_bet"],
    ball3_o_e: json["ball3_o_e"],
    ball3_l_s: json["ball3_l_s"],
    ball3_o_e_bet: json["ball3_o_e_bet"],
    ball3_l_s_bet: json["ball3_l_s_bet"],
    ball4_o_e: json["ball4_o_e"],
    ball4_l_s: json["ball4_l_s"],
    ball4_o_e_bet: json["ball4_o_e_bet"],
    ball4_l_s_bet: json["ball4_l_s_bet"],
    ball5_o_e: json["ball5_o_e"],
    ball5_l_s: json["ball5_l_s"],
    ball5_o_e_bet: json["ball5_o_e_bet"],
    ball5_l_s_bet: json["ball5_l_s_bet"],
  );

  ModelBetApi fromJson(Map<String, dynamic> json) => ModelBetApi(
    user_id: json["user_id"],
    slot_id: json["slot_id"],
    ball1_o_e: json["ball1_o_e"],
    ball1_l_s: json["ball1_l_s"],
    ball1_o_e_bet: json["ball1_o_e_bet"],
    ball1_l_s_bet: json["ball1_l_s_bet"],
    ball2_o_e: json["ball2_o_e"],
    ball2_l_s: json["ball2_l_s"],
    ball2_o_e_bet: json["ball2_o_e_bet"],
    ball2_l_s_bet: json["ball2_l_s_bet"],
    ball3_o_e: json["ball3_o_e"],
    ball3_l_s: json["ball3_l_s"],
    ball3_o_e_bet: json["ball3_o_e_bet"],
    ball3_l_s_bet: json["ball3_l_s_bet"],
    ball4_o_e: json["ball4_o_e"],
    ball4_l_s: json["ball4_l_s"],
    ball4_o_e_bet: json["ball4_o_e_bet"],
    ball4_l_s_bet: json["ball4_l_s_bet"],
    ball5_o_e: json["ball5_o_e"],
    ball5_l_s: json["ball5_l_s"],
    ball5_o_e_bet: json["ball5_o_e_bet"],
    ball5_l_s_bet: json["ball5_l_s_bet"],
  );


  Map<String, dynamic> toJson() => {
    "user_id": user_id,
    "slot_id": slot_id,
    "ball1_o_e": ball1_o_e,
    "ball1_l_s": ball1_l_s,
    "ball1_o_e_bet": ball1_o_e_bet,
    "ball1_l_s_bet": ball1_l_s_bet,
    "ball2_o_e": ball2_o_e,
    "ball2_l_s": ball2_l_s,
    "ball2_o_e_bet": ball2_o_e_bet,
    "ball2_l_s_bet": ball2_l_s_bet,
    "ball3_o_e": ball3_o_e,
    "ball3_l_s": ball3_l_s,
    "ball3_o_e_bet": ball3_o_e_bet,
    "ball3_l_s_bet": ball3_l_s_bet,
    "ball4_o_e": ball4_o_e,
    "ball4_l_s": ball4_l_s,
    "ball4_o_e_bet": ball4_o_e_bet,
    "ball4_l_s_bet": ball4_l_s_bet,
    "ball5_o_e": ball5_o_e,
    "ball5_l_s": ball5_l_s,
    "ball5_o_e_bet": ball5_o_e_bet,
    "ball5_l_s_bet": ball5_l_s_bet,
  };
}

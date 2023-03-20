// To parse this JSON data, do
//
//     final modelCheckBetResponse = modelCheckBetResponseFromJson(jsonString);

import 'dart:convert';

// List<ModelCheckBetResponse> modelCheckBetResponseFromJson(String str) => List<ModelCheckBetResponse>.from(json.decode(str).map((x) => ModelCheckBetResponse.fromJson(x)));

String modelCheckBetResponseToJson(List<ModelCheckBetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCheckBetResponse {
  ModelCheckBetResponse({
    this.ball1OE,
    this.ball1LS,
    this.ball1OEBet,
    this.ball1LSBet,
    this.ball2OE,
    this.ball2LS,
    this.ball2OEBet,
    this.ball2LSBet,
    this.ball3OE,
    this.ball3LS,
    this.ball3OEBet,
    this.ball3LSBet,
    this.ball4OE,
    this.ball4LS,
    this.ball4OEBet,
    this.ball4LSBet,
    this.ball5OE,
    this.ball5LS,
    this.ball5OEBet,
    this.ball5LSBet,
    this.result,
    this.response,
  });

  String? ball1OE;
  String? ball1LS;
  String? ball1OEBet;
  String? ball1LSBet;
  String? ball2OE;
  String? ball2LS;
  String? ball2OEBet;
  String? ball2LSBet;
  String? ball3OE;
  String? ball3LS;
  String? ball3OEBet;
  String? ball3LSBet;
  String? ball4OE;
  String? ball4LS;
  String? ball4OEBet;
  String? ball4LSBet;
  String? ball5OE;
  String? ball5LS;
  String? ball5OEBet;
  String? ball5LSBet;
  String? result;
  String? response;

  // factory ModelCheckBetResponse.fromJson(Map<String, dynamic> json) => ModelCheckBetResponse(
  //   ball1OE: json["ball1_o_e"],
  //   ball1LS: json["ball1_l_s"],
  //   ball1OEBet: json["ball1_o_e_bet"],
  //   ball1LSBet: json["ball1_l_s_bet"],
  //   ball2OE: json["ball2_o_e"],
  //   ball2LS: json["ball2_l_s"],
  //   ball2OEBet: json["ball2_o_e_bet"],
  //   ball2LSBet: json["ball2_l_s_bet"],
  //   ball3OE: json["ball3_o_e"],
  //   ball3LS: json["ball3_l_s"],
  //   ball3OEBet: json["ball3_o_e_bet"],
  //   ball3LSBet: json["ball3_l_s_bet"],
  //   ball4OE: json["ball4_o_e"],
  //   ball4LS: json["ball4_l_s"],
  //   ball4OEBet: json["ball4_o_e_bet"],
  //   ball4LSBet: json["ball4_l_s_bet"],
  //   ball5OE: json["ball5_o_e"],
  //   ball5LS: json["ball5_l_s"],
  //   ball5OEBet: json["ball5_o_e_bet"],
  //   ball5LSBet: json["ball5_l_s_bet"],
  //   result: json["result"],
  //   response: json["response"],
  // );
  ModelCheckBetResponse fromJson(Map<String, dynamic> json) => ModelCheckBetResponse(
    ball1OE: json["ball1_o_e"],
    ball1LS: json["ball1_l_s"],
    ball1OEBet: json["ball1_o_e_bet"],
    ball1LSBet: json["ball1_l_s_bet"],
    ball2OE: json["ball2_o_e"],
    ball2LS: json["ball2_l_s"],
    ball2OEBet: json["ball2_o_e_bet"],
    ball2LSBet: json["ball2_l_s_bet"],
    ball3OE: json["ball3_o_e"],
    ball3LS: json["ball3_l_s"],
    ball3OEBet: json["ball3_o_e_bet"],
    ball3LSBet: json["ball3_l_s_bet"],
    ball4OE: json["ball4_o_e"],
    ball4LS: json["ball4_l_s"],
    ball4OEBet: json["ball4_o_e_bet"],
    ball4LSBet: json["ball4_l_s_bet"],
    ball5OE: json["ball5_o_e"],
    ball5LS: json["ball5_l_s"],
    ball5OEBet: json["ball5_o_e_bet"],
    ball5LSBet: json["ball5_l_s_bet"],
    result: json["result"],
    response: json["response"],
  );
  Map<String, dynamic> toJson() => {
    "ball1_o_e": ball1OE,
    "ball1_l_s": ball1LS,
    "ball1_o_e_bet": ball1OEBet,
    "ball1_l_s_bet": ball1LSBet,
    "ball2_o_e": ball2OE,
    "ball2_l_s": ball2LS,
    "ball2_o_e_bet": ball2OEBet,
    "ball2_l_s_bet": ball2LSBet,
    "ball3_o_e": ball3OE,
    "ball3_l_s": ball3LS,
    "ball3_o_e_bet": ball3OEBet,
    "ball3_l_s_bet": ball3LSBet,
    "ball4_o_e": ball4OE,
    "ball4_l_s": ball4LS,
    "ball4_o_e_bet": ball4OEBet,
    "ball4_l_s_bet": ball4LSBet,
    "ball5_o_e": ball5OE,
    "ball5_l_s": ball5LS,
    "ball5_o_e_bet": ball5OEBet,
    "ball5_l_s_bet": ball5LSBet,
    "result": result,
    "response": response,
  };
}

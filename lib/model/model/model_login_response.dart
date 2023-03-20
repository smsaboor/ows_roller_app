class LoginResponse {
  LoginResponse(
      {required this.otp,
        required this.response,
        required this.id,
        required this.mobile});

  int otp;
  String response;
  String id;
  String mobile;
}
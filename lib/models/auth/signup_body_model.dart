// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpBodyModel {
  String name;
  String phone;
  String email;
  String password;
  SignUpBodyModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  // SignUpBodyModel.fromJson(Map<String, dynamic> json) {
  //   name = json["name"];

  //   phone = json["phone"];

  //   email = json["email"];
  //   password = json["password"];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['f_name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    

    return data;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/models/auth/signup_body_model.dart';
import 'package:food_delivery/models/response/response_model.dart';
import 'package:get/get.dart';

import 'package:food_delivery/data/repository/auth/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBodyModel signUpBodyModel) async {
    _isLoading = true;
    update();

    Response response = await authRepo.registration(signUpBodyModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

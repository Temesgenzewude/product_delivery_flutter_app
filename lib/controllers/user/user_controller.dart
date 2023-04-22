// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/models/user/user_model.dart';
import 'package:get/get.dart';

import 'package:food_delivery/data/repository/user/user_repo.dart';
import 'package:food_delivery/models/response/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;

  late UserModel _userModel;

  UserModel get useModel => _userModel;

  bool get isLoading => _isLoading;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfully loaded user info");
    } else {
      print(response.body['message']);
      print("Error loading user info");
      responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return responseModel;
  }
}

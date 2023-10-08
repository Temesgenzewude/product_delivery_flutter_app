import 'package:get/get.dart';

import '../../data/repository/user/user_repo.dart';
import '../../models/response/response_model.dart';
import '../../models/user/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;

  late UserModel _userModel;

  UserModel get userModel => _userModel;


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

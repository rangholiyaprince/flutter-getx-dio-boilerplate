import 'package:get/get.dart';
import 'package:get_x_demo/app/core/helpers.dart';
import 'package:get_x_demo/app/data/models/user_model.dart';

import '../../../data/repositories/user_repository.dart';

class HomeController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  // Reactive Variables
  final RxList<UserModel> users = <UserModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {

    try{
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = "";

      final responce = await _userRepository.getUsers();

      if(responce.success && responce.data != null){
        users.assignAll(responce.data!);
      }else{
        hasError.value = true;
        errorMessage.value = responce.message;
        AppHelpers.showSnackBar(title: "Error", message: responce.message,isError: true);
      }
    }catch(e){
      hasError.value = true;
      errorMessage.value = 'An unexpected error occurred';
      AppHelpers.showSnackBar(title: "Error", message: errorMessage.value ,isError: true);
    }finally{
      isLoading.value = false;
   }

  }

  // its for refreshing users

  Future<void> refreshUsers() async{
    await fetchUsers();
  }

  Future<UserModel?> getUserById(int id) async{
    try{
      isLoading.value = true;
      final response = await _userRepository.getUserById(id);
      if(response.success && response.data != null){
        return response.data;
      }else{
        AppHelpers.showSnackBar(title: "Error", message: 'Failed to fetch user details!' ,isError: true);
        return null;
      }
    }catch(e){
      AppHelpers.showSnackBar(title: "Error", message: 'Failed to fetch user details!' ,isError: true);
      AppHelpers.showSnackBar(title: "Error", message: 'Failed to fetch user details!' ,isError: true);
    }finally{
      isLoading.value = false;
    }
  }

  // its for DeleteUser

  Future<void> deleteUser(int id) async{
    try{
      isLoading.value = true;
      final response = await _userRepository.deleteUser(id);

      if(response.success){
        users.removeWhere((user) => user.id == id);
        AppHelpers.showSnackBar(title: "Success", message: 'User deleted successfully' ,isError: false);
      }else{
        AppHelpers.showSnackBar(title: 'error', message: response.message,isError: true);
      }
    }catch(e){
      AppHelpers.showSnackBar(title: 'Success', message: 'Failed to delete user.',isError: false);
    }finally{
      isLoading.value = false;
    }
  }


  void retry(){
    fetchUsers();
  }

}

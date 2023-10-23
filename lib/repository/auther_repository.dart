import '../Model/rseponse/AutherModel.dart';
import '../data/network/api_service.dart';
import '../res/app_url.dart';


class AutherRepository {
  final _apiService = ApiService();
  Future<AutherModel> getAuthers() async{
    try{
      dynamic responses = await
          _apiService.getAllRespone(AppUrl.getAllAuthers);
      return AutherModel.fromJson(responses);
    }catch(e){
      rethrow;
    }
  }
}
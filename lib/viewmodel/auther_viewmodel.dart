import 'package:flutter/cupertino.dart';
import 'package:project/repository/auther_repository.dart';

import '../data/response/api_respone.dart';


class AutherViewModel extends ChangeNotifier{
  final _autherRepo = AutherRepository();
  dynamic response = ApiResponse.loading();
  dynamic removeRespone = ApiResponse();

  setAutherList(respone){
    this.response = respone;
    notifyListeners();
  }

  Future<AutherViewModel?> getAllAuther() async{
    await _autherRepo.getAuthers()
        .then((auther) {
          setAutherList(ApiResponse.completed(auther));} )
        .onError((error, stackTrace) => setAutherList(ApiResponse.error(stackTrace.toString())));
  }
}
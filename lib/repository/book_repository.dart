import 'package:project/Model/request/book_request.dart';
import 'package:project/data/network/api_service.dart';
import 'package:project/res/app_url.dart';

import '../Model/BookRespone/BookModel.dart';

class BookRepository {
  final _apiService = ApiService();
  Future<BookResponse> getBooks() async{
    print('?????????????');
    try{
      dynamic responses = await
          _apiService.getAllRespone(AppUrl.getAllBooks);
      print('response in model ${BookResponse.fromJson(responses)}');
      return BookResponse.fromJson(responses);
    }catch(e){
      rethrow;
    }
  }
  Future postBook(object) async {
    try{
      print('asdasd: $object');
      var response = await _apiService.postApi(AppUrl.postBook, object);
      // សង response
      return response = BookResponse.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future putBook(requstBody, id) async{
    print('kkkkkkkkkkkk');
    try{
      var book = BookRequest(data: requstBody);
      print('this is :  ${AppUrl.postBook}/$id');
      var response = await
      _apiService.putApi('${AppUrl.postBook}/$id', book.toJson());
      return response = BookResponse.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

}
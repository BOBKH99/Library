import 'package:flutter/material.dart';
import 'package:project/data/response/api_respone.dart';
import 'package:project/repository/book_repository.dart';

import '../Model/BookRespone/BookModel.dart';

class BookViewModel extends ChangeNotifier{
  final _bookRepo = BookRepository();
  dynamic response = ApiResponse.loading();
  dynamic removeRespone = ApiResponse();
  ApiResponse<BookResponse> bookResponse = ApiResponse.loading();

  setBookList(respone){
    this.response = respone;
    notifyListeners();
  }
  setBookResponse(ApiResponse<BookResponse> response){
    bookResponse = response;
    notifyListeners();
  }
  Future<dynamic?> postBook(object) async{
    await _bookRepo.postBook(object)
        .then((books) {
      print('respone in viewmodel !!!!!! ${books.data!.length}');
      setBookList(ApiResponse.completed(books));})
        .onError((error, stackTrace) => setBookList(ApiResponse.error(stackTrace.toString())));
  }
  Future putBook(requestBody,id) async{
    await _bookRepo.putBook(requestBody,id).then((books) {
       print('respone in viewmodel ${books.data!.length}');
      setBookResponse(ApiResponse.completed(books));})
        .onError((error, stackTrace) =>
        setBookList(ApiResponse.error(stackTrace.toString())));
  }
    Future<BookViewModel?> getAllBook() async{
    await _bookRepo.getBooks()
        .then((books) {
          setBookList(ApiResponse.completed(books));
    })
        .onError((error, stackTrace) => setBookList(ApiResponse.error(stackTrace.toString())));
  }
}
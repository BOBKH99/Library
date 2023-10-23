import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/BookRespone/BookModel.dart';
import '../Model/request/book_request.dart';
import '../data/response/status.dart';
import '../viewmodel/book_viewmodel.dart';
class AddBook extends StatefulWidget {

  AddBook({this.isUpdate, this.book});
  var isUpdate;
  Attributes? auther;
  Datum? book;
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

  var titleController = TextEditingController();
  var codeController  = TextEditingController();
  var descriptionController = TextEditingController();
  var bookViewModel = BookViewModel();
  var priceCintroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if(widget.isUpdate == true){
      print('the update is succese');
      titleController.text = widget.book!.attributes!.title!;
      codeController.text = widget.book!.attributes!.code!;
      descriptionController.text = widget.book!.attributes!.description!;
      priceCintroller.text = widget.book!.attributes!.price!.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('the update: ${widget.isUpdate} ');
    print('hello this is the next screens');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.photo)
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
              fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 10,),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: 'Title',
                    label: Text('Title'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 3,color: Colors.blue))
                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller: codeController,
                decoration: InputDecoration(
                    hintText: 'Code',
                    label: Text('Code'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 3,color: Colors.blue))
                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Description',
                    label: Text('Description'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 3,color: Colors.blue))
                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller: priceCintroller,
                decoration: InputDecoration(
                    hintText: 'Price',
                    label: Text('Price'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 3,color: Colors.blue))
                ),
              ),
              SizedBox(height: 5,),
              ElevatedButton(
                  onPressed: (){
                    print('clicked save');
                    var object = BookRequest (
                        data: Datarequest(
                            title: titleController.text,
                            code: codeController.text,
                            description: descriptionController.text,
                            price: int.parse(priceCintroller.text),
                        )
                    );
                    print('point!!!!${titleController.text}');
                    //print('Request body before encoding: ${requestBody.toJson()}');
                    bookViewModel.postBook(object);
                  },
                  child: ChangeNotifierProvider(
                      create: (context) => BookViewModel(),
                      child: Consumer<BookViewModel>(
                        builder: (context, viewModel, child) {
                          if(viewModel!.response!.status == Status.COMPLETED){
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Operation Success'))
                              );
                            });
                          }
                          return Text(widget.isUpdate!? 'Edit': 'Save');
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

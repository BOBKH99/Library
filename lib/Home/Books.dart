import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Home/addBook.dart';
import 'package:project/viewmodel/book_viewmodel.dart';

import '../Model/BookRespone/BookModel.dart';

class Books extends StatelessWidget {

  Datum? book;
  bool? isUpdate;
  var bookViewModel = BookViewModel();
  bool isRemoving = false;
  Books({
   this.book
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => AddBook(isUpdate: true,book: book,),));
      },
      child: Container(
        height: 200,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/the_node_js.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .75,
                      height: 170,
                      ),
                  Positioned(
                      top: 10,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15))
                        ),
                        child: Text('Title:  ${book!.attributes!.title!}',style: TextStyle(color: Colors.white),),
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Text('Code: ${book!.attributes!.code!}',style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(book!.attributes!.description!,style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),
            Text('Price: ${book!.attributes!.price}  \$',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Home/Books.dart';
import 'package:project/Home/addBook.dart';
import 'package:project/Home/appBar.dart';
import 'package:project/Home/search.dart';
import 'package:project/Model/BookRespone/BookModel.dart';
import 'package:project/data/response/status.dart';
import 'package:project/viewmodel/auther_viewmodel.dart';
import 'package:project/viewmodel/book_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _BookViewModel = BookViewModel();
  final _autherViewModel = AutherViewModel();


  @override
  void initState(){
    super.initState();
    _BookViewModel.getAllBook();
    _autherViewModel.getAllAuther();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:[SystemUiOverlay.top]);
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
       // color: Colors.black87.withBlue(50),
        padding: const EdgeInsets.only(top: 50, left: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) =>
                  IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(Icons.menu,size: 35, color: Colors.white,)),
                ),
                SizedBox(width: 20),
                Icon(Icons.notifications,size: 35, color: Colors.white,),


              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,  // Border color
                  width: 3,            // Border width
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/sokhen.png', fit: BoxFit.cover, width: 60, height: 60),
              ),
            ),
            SizedBox(height: 10,),
            Text('Hello SoKhen!',style: TextStyle(fontFamily: 'DMSans-Black',fontSize: 20,color: Colors.white),),
            SizedBox(height: 20,),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => searchScreen(),)),
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.only(left: 30, top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2,color: Colors.grey.withOpacity(0.3)),
                  color: Colors.grey.withOpacity(0.2),

                ),
                child: Text('Search by Book title, Author',style: TextStyle(color: Colors.grey),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
                child: const Text('Recommended for you',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                    color: Colors.white
                  ),
                )
            ),
            Container(
              height: 220,
              margin: const EdgeInsets.only(
               right: 10, top: 15,
              ),
              child: ChangeNotifierProvider(
                create: (context) => _BookViewModel,
                child: Consumer<BookViewModel>(
                  builder: (context, viewModel, _) {
                    print('result ${viewModel.response.status}');
                    switch(viewModel.response.status){
                      case Status.COMPLETED:
                        BookResponse? bookModel = viewModel.response.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bookModel?.data!.length,
                          itemBuilder: (context, index) {
                            print('ID : $index, ${bookModel?.data![index]}');
                            print('Data: ${bookModel!.data.length}');
                            return Books(book: bookModel.data[index],);
                          },
                        );
                      case Status.ERROR:
                        return Text('Hello this is a Error ');
                      default: return Text('Default');
                    }
                  },

                ),
              ),
            )
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddBook(isUpdate: false,)));},
    child: const Icon(Icons.add),
    ),
    );
  }
}

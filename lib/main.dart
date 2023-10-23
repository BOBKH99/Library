import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:project/Home/Home.dart';
import 'package:project/data/response/status.dart';
import 'package:project/home/search.dart';
import 'package:project/viewmodel/auther_viewmodel.dart';
import 'package:provider/provider.dart';

import 'Model/rseponse/AutherModel.dart';
import 'Model/rseponse/response.dart';
//
// void main(){
//   runApp(const MyApp());
// }

void main(){
  runApp( const Directionality(
    textDirection: TextDirection.ltr,
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp()),
  ),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blueGrey
      )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libraey',
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.grey,
    ),

        ),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          // useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey.shade100,
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Poppins',)
      ),
      home: const MyHomePage(title: 'Flutter Demo Home '),
    );
  }

}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{
  final _autherViewModel = AutherViewModel();
  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _autherViewModel.getAllAuther();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat();
  }
  @override
  Widget build(BuildContext context) {
   return HomeScreen();
  }

}
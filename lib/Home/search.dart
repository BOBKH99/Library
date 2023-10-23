import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Home/auther.dart';
import 'package:project/viewmodel/auther_viewmodel.dart';
import 'package:provider/provider.dart';

import '../Model/rseponse/AutherModel.dart';
import '../data/response/status.dart';


class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> with SingleTickerProviderStateMixin {
  final _autherViewModel = AutherViewModel();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late final AnimationController animationController;

  late final List<AuData> autherDataList;
  late Future<AutherModel> futureAuthors;
  void initState() {
    super.initState();
    _autherViewModel.getAllAuther();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat();
  }
  @override
  Widget build(BuildContext context) {

  print('Name : asdasd asdasdadasdsadsadas');
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
      ),
      body: Container(
        child: ChangeNotifierProvider(
          create: (context) => _autherViewModel,
          child: Consumer<AutherViewModel>(
            builder: (context, viewModel, _) {
              print('result ${viewModel.response.status}');
              switch(viewModel.response.status){
                case Status.COMPLETED:
                  AutherModel? autherModel = viewModel.response.data;
                  print('data count: ${autherModel?.data!.length}');
                  return ListView.builder(
                    itemCount: autherModel?.data!.length,
                    itemBuilder: (context, index) {
                      print('Index = $index, ${autherModel?.data![index]}');
                      print('total: ${autherModel?.data!.length}');
                      return Autherdata(auther: autherModel?.data![index],);
                    },
                  );
                case Status.ERROR:
                  return Text('Hello this is a Error ');
                default: return Text('Default');
              }
            },
          ),
        ),
      ),
    );
  }
}

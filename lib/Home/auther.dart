import 'package:flutter/material.dart';

import '../Model/BookRespone/BookModel.dart';
import '../Model/rseponse/AutherModel.dart';
import '../viewmodel/auther_viewmodel.dart';

class Autherdata extends StatelessWidget {
  AuData? auther;
  var autherViewModel = AutherViewModel();
  Autherdata({
    this.auther
  });
 // var authorViewModel = AutherViewModel();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Author Name: ${auther!.attributes!.name}'),
      subtitle: Text('Bio: ${auther!.attributes!.shortBiography}'),
    );
  }
}

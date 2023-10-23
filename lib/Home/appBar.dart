import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  get currentAccountPictureSize => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .85,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/sokhen.png',fit: BoxFit.fill,),
                  ),
              currentAccountPictureSize: const Size.square(65),
              accountName: null,
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Khorn SoKhen'),
                      Text('Personal Account')
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(onPressed: (){}, child: const Text('Switch')))
                ],
              )),

          const ListTile(title: Text('Home'), leading: Icon(Icons.home)),
          const ListTile(title: Text('Option 1'), leading: Icon(Icons.home)),
          const ListTile(title: Text('Option 1'), leading: Icon(Icons.home)),
          const ListTile(title: Text('Option 1'), leading: Icon(Icons.home)),
          const ListTile(title: Text('Option 1'), leading: Icon(Icons.home)),
          const ListTile(title: Text('Option 1'), leading: Icon(Icons.home)),
        ],
      ),
    );
  }
}

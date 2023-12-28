import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 184, 130, 211),
          //   ),
          //   child: Text(
          //     'Drawer Header',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.face),
            accountName: Text('Rachata Jaroensrisakunchai'),
            accountEmail: Text('test@gmail.com'),
            otherAccountsPictures: [
              Icon(Icons.bookmark_border),
            ],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/city.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            trailing: Icon(Icons.arrow_right),
            selected: ModalRoute.of(context)?.settings.name == '/homestack/home'
                ? true
                : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/homestack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.all_out),
            title: Text('Product'),
            trailing: Icon(Icons.arrow_right),
            selected: ModalRoute.of(context)?.settings.name == '/productstack/product'
                ? true
                : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/productstack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('News'),
            trailing: Icon(Icons.arrow_right),
            selected: ModalRoute.of(context)?.settings.name == 'newsstack/news'
                ? true
                : false,
            onTap: () {
              Navigator.of(context,rootNavigator: true)
                  .pushNamedAndRemoveUntil('/newsstack', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bggg.jpg'), fit: BoxFit.fill)),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,'homestack/company');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.business, size: 80, color: Colors.orangeAccent),
                    Text(
                      'Company',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.teal[100],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homestack/map');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined,
                        size: 80, color: Colors.orangeAccent),
                    Text(
                      'Map',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.teal[100],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homestack/camera');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined,
                        size: 80, color: Colors.orangeAccent),
                    Text(
                      'Camera',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.teal[100],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homestack/about', arguments: {
                  'email': 'pitaza2222@gmail.com',
                  'phone': '0988955376'
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 80, color: Colors.orangeAccent),
                    Text(
                      'About me',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.teal[100],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homestack/team');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sports_soccer,
                        size: 80, color: Colors.orangeAccent),
                    Text(
                      'Premier League Teams',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.teal[100],
              ),
            ),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

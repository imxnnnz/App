import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    Map <String, String> company = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('About Me'),
      ),
      body: Center(
          child: Column(
            children: [
              Text('About Page'),
              Text('Email : ${company['email']}'),
              Text('Telphone : ${company['phone']}'),
              Divider(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home Page')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'homestack/contact');
                  },
                  child: Text('Contact Page')),
            ],
          ),
      ),
    );
  }
}

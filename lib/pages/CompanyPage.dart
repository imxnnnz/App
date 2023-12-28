import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Company'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/city.jpg'),
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rachata.Dev',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.'),
                        Divider(),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.phone_android,
                                  color: Colors.pinkAccent,
                                )
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [Text('Rachata')],
                                ),
                                Row(
                                  children: [Text('0988955376')],
                                )
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Wrap(
                          spacing: 8,
                          children: List.generate(
                            9,
                            (int index) => Chip(
                              label: Text('Label'),
                              avatar: Icon(Icons.star),
                              backgroundColor: Colors.pink[300],
                            ),
                          ),
                        ),
                        Divider(),
                        BuilderRowFootter(),
                      ])))
        ],
      )),
    );
  }

  Row BuilderRowFootter() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/dragon.jpg'),
                            radius: 40,
                          ),
                          SizedBox(
                            width: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.access_alarm),
                                Icon(Icons.accessibility),
                                Icon(Icons.account_balance),
                              ],
                            ),
                          )
                        ],
                      );
  }
}

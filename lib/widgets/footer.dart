import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String footerName = 'ComSCI@SiamU';
  void _changeFooterName() {
    setState(() {
      footerName = 'Rachata';
    });
  }

  @override
  void initState() {
    super.initState();
    print('This is init state');
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$footerName'),
        ElevatedButton(onPressed: _changeFooterName, child: Text('Press once')
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Course>? course = [];
  bool isLoading = true;
  Future<void> _getData() async {
    var url = Uri.parse("https://noraphat.dev/web_api/get_product/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      final Product product =
          Product.fromJson(convert.jsonDecode(response.body));
      setState(() {
        course = product.course;
        isLoading = false;
      });
    } else {
      print('error from backed ${response.statusCode}');
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Product Page'),
      ),
      body: isLoading == true
          ? Center(
            child: CircularProgressIndicator(),
          )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(course![index].images!),
                            fit: BoxFit.cover)),
                  ),
                  title: Text('${course![index].pdName}'),
                  subtitle: Text('Price : ${course![index].price} .-'),
                  trailing: Icon(Icons.arrow_right),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: course!.length),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

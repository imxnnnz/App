import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic>? articles = [];
  int totalResults = 0;
  bool isLoading = true;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;
  int pageSize = 5;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
        articles!.clear();
        page = 1;
      });
    _getData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) {
      setState(() {
        page = ++page;
      });
      _getData();
    }
    _refreshController.loadComplete();
  }

  Future<void> _getData() async {
    try {
      var url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=th&apiKey=9313531249824e9b87bf5aab558c457b&page=$page&pageSize=$pageSize");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        //print(response.body);
        final Map<String, dynamic> news = convert.jsonDecode(response.body);
        print('totalResults is : ${news['totalResults']}');
        setState(() {
          totalResults = news['totalResults'];
          articles!.addAll(news['articles']);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('error from backed ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
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
            title: totalResults > 0 ? Text('News $totalResults Topics') : null),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("release to load more");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'newsstack/webview',
                                  arguments: {
                                    'url': articles![index]['url'],
                                    'name': articles![index]['source']['name'],
                                    'title': articles![index]['title']
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: articles![index]['urlToImage'] !=
                                                null
                                            ? Ink.image(
                                                image: NetworkImage(
                                                    articles![index]
                                                        ['urlToImage']),
                                                fit: BoxFit.cover)
                                            : Ink.image(
                                                image: NetworkImage(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png'),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Positioned(
                                          top: 16,
                                          bottom: 16,
                                          left: 16,
                                          right: 16,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              articles![index]['source']
                                                  ['name'],
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(articles![index]['title']),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            articles![index]['author'] != null
                                                ? Chip(
                                                    avatar:
                                                        Icon(Icons.person_pin),
                                                    label: articles![index]
                                                                    ['author']
                                                                .length <
                                                            20
                                                        ? Text(articles![index]
                                                            ['author'])
                                                        : Text(articles![index]
                                                                ['author']
                                                            .substring(0, 20)),
                                                  )
                                                : Text(''),
                                            Text(DateFormat.yMMMEd()
                                                .add_Hms()
                                                .format(DateTime.parse(
                                                    articles![index]
                                                        ['publishedAt'])))
                                          ])
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: articles!.length),
              ));
  }
}

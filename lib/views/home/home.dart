import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/dashed_line.dart';
import '../../components/star_rating.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu, size: 30,),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            }
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Center(
          child: Text('endDrawer'),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 8,
                  color: Color(0xffeeeeee),
                )
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 205, 144),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    'No.${index + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 131, 95, 36),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network('https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2640611704.webp', width: 100, height: 148,),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.play_circle_outline, color: Colors.redAccent,),
                                  ),
                                  TextSpan(
                                    text: '速度与激情9',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(
                                    text: '(2021)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                    )
                                  )
                                ]
                              )
                            ),
                            SizedBox(height: 3,),
                            Row(
                              children: <Widget>[
                                StarRating(
                                  rating: 9.7,
                                  size: 18,
                                ),
                                Text('9.7')
                              ],
                            ),
                            SizedBox(height: 3,),
                            Text(
                              '动作 犯罪 / 林诣彬 /  范·迪塞尔 / 约翰·塞纳 / 米歇尔·罗德里格兹 / 乔丹娜·布鲁斯特 / 泰瑞斯·吉布森',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: DashedLine(
                        axis: Axis.vertical,
                        dashedLineWidth: .5,
                        dashedLineHeight: 6,
                        color: Color(0xffcccccc),
                      ),
                    ),
                    Container(
                      width: 60,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Image.asset('assets/images/home/wish.png', width: 30,),
                          Text(
                            '想看',
                            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
                  decoration: BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    'F9: The Fast Saga',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }
}

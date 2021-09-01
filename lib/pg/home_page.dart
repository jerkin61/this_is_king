//main page
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'test.dart';
import 'video_player.dart';
import 'silverapp.dart';

const _kPages = <String, IconData>{
  'My Record': Icons.settings_voice,
  'Ready': Icons.accessibility,
  'Home': Icons.home,
  'Job Post': Icons.work,
  'Chat': Icons.message,
};

class ConvexAppExample extends StatefulWidget {
  const ConvexAppExample({key}) : super(key: key);

  @override
  _ConvexAppExampleState createState() => _ConvexAppExampleState();
}

class _ConvexAppExampleState extends State<ConvexAppExample> {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
        body: Column(
          children: [
            const Divider(),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(children: [
                    //First screen
                    Column(
                      children: [
                        Container(
                            child: new MaterialApp(
                          home: SliverAppBar(),
                        ))
                      ],
                    ),
                  ]),
                  Container(
                    child: Card(
                      child: Image.asset('assets/humanresources.gif'),
                    ),
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Text(
                        'Let\'s \n ACE your \n  interview.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: null,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: TextButton.icon(
                          label: Text(
                            "Watch our introduction video",
                          ),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue[400],
                              textStyle: TextStyle(
                                fontSize: 10,
                              )),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VideoPlayerExample())),
                          icon: Icon(Icons.youtube_searched_for),
                        )),
                    Card(
                      child: Image.asset('assets/humanresources.gif'),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                        child: TextButton.icon(
                          label: Text(
                            "Get Started",
                          ),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue[400],
                              textStyle: TextStyle(
                                fontSize: 16,
                              )),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Nav2App())),
                          icon: Icon(Icons.arrow_right),
                        ))
                  ]),
                  Container(
                    child: Card(
                      child: Image.asset('assets/humanresources.gif'),
                    ),
                  ),
                  Container(
                    child: Card(
                      child: Image.asset('assets/humanresources.gif'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          // Optional badge argument: keys are tab indices, values can be
          // String, IconData, Color or Widget.
          /*badge=*/ const <int, dynamic>{3: ''},
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}

class TargetScreen extends StatelessWidget {
  const TargetScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Target Screen")),
    );
  }
}

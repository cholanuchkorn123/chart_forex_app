import 'package:chart_projects/main.dart';
import 'package:chart_projects/src/ui/screen/detial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(backgroundColor: Colors.transparent, actions: [
        TextButton(
            onPressed: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )),
        Expanded(child: Container())
      ]),
      body: SafeArea(child: _buildbody(context)),
    );
  }

  Widget _buildbody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          color: Colors.red,
          child: Column(children: [
            Text('testdata'),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                )),
            Container(
              color: Colors.blueGrey,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text('5m'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text('10m'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text('15m'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text('30m'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text('1m'),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text('4m'),
                ),
              ]),
            )
          ]),
        )),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              'Top 10 instruments',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CircleAvatar(
                                        child: Icon(Icons.flag),
                                      ),
                                    ),
                                    Expanded(
                                      child: CircleAvatar(
                                        child: Icon(Icons.flag),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Eur-usd')
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('testdata'),
                                    Text('testdata')
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('testdata'),
                                    Text('testdata')
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Detialscreen()));
                                },
                                child: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ]),
        ))
      ],
    );
  }
}

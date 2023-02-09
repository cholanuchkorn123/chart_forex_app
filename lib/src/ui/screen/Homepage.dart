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
  int showborder = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff400E32),
      appBar:
          AppBar(elevation: 0, backgroundColor: Color(0xff400E32), actions: [
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
          padding: EdgeInsets.only(bottom: 30),
          color: Color(0xff400E32),
          child: Column(children: [
            Text(
              'Euro/Us .Dollar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(flex: 2, child: Container(color: Colors.grey)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontime(
                  showborder: showborder,
                  numberindex: 1,
                  word: '10m',
                  onpress: () {
                    setState(() {
                      showborder = 1;
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Buttontime(
                  showborder: showborder,
                  numberindex: 2,
                  word: '10m',
                  onpress: () {
                    setState(() {
                      showborder = 2;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Buttontime(
                  showborder: showborder,
                  numberindex: 3,
                  word: '10m',
                  onpress: () {
                    setState(() {
                      showborder = 3;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Buttontime(
                  showborder: showborder,
                  numberindex: 4,
                  word: '10m',
                  onpress: () {
                    setState(() {
                      showborder = 4;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Buttontime(
                  showborder: showborder,
                  numberindex: 5,
                  word: '10m',
                  onpress: () {
                    setState(() {
                      showborder = 5;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Buttontime(
                  showborder: showborder,
                  numberindex: 6,
                  word: '10m',
                  onpress: () {
                    setState(() {
                      showborder = 6;
                    });
                  },
                ),
              ]),
            )
          ]),
        )),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Color(0xffEDDBC7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Top 10 instruments'.toUpperCase(),
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detialscreen()));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff400E32),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CircleAvatar(
                                              radius: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/images/usflagtst.jpg')),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: CircleAvatar(
                                              radius: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/images/eurflagtest.png')),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Eur-usd'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Bid:1.0211',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Ask:1.0211',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'spreads'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '0.12%',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Detialscreen()));
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

class Buttontime extends StatelessWidget {
  Buttontime(
      {required this.word,
      this.onpress,
      required this.numberindex,
      required this.showborder});
  final String word;
  final int numberindex;
  final VoidCallback? onpress;
  final int showborder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          color: numberindex == showborder ? Color(0xff400E32) : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 7),
        child: Text(
          word,
          style: TextStyle(
              color: numberindex == showborder
                  ? Colors.white
                  : Colors.grey.shade500),
        ),
      ),
    );
  }
}

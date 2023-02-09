import 'package:flutter/material.dart';

import 'Homepage.dart';

class Detialscreen extends StatefulWidget {
  const Detialscreen({super.key});

  @override
  State<Detialscreen> createState() => _DetialscreenState();
}

class _DetialscreenState extends State<Detialscreen> {
  int showborder = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff400E32),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [],
        title: Text('Usd/Thb'.toUpperCase()),
      ),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text(
                'Instrument USD/THB',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                'Spread 0.010',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Color(0xffA7727D),
                borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height * 0.10,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date 2021-03-31 06:35:37',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      Text('CloseOut Bid :1.345',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700))
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tradable :True',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      Text('CloseOut Ask :1.345',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700))
                    ],
                  )
                ],
              ),
            )),
        SizedBox(
          height: 25,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Color(
                        0xffEDDBC7,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Follow'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ))),
              Expanded(child: Container()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Color(
                      0xffEDDBC7,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {},
                    child: Text('trade now'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700))),
              )
            ],
          ),
        )
      ]),
    );
  }
}

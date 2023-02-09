import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../modals/chartdata.dart';
import '../../modals/data.dart';
import 'Homepage.dart';

class Detialscreen extends StatefulWidget {
  Detialscreen({required this.datalist, required this.index});
  final int index;
  final List<Data> datalist;
  @override
  State<Detialscreen> createState() => _DetialscreenState();
}

class _DetialscreenState extends State<Detialscreen> {
  int showborder = 0;

  @override
  Widget build(BuildContext context) {
    Data info = widget.datalist[widget.index];
    return Scaffold(
      backgroundColor: Color(0xff400E32),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [],
        title: Text(info.name.toUpperCase()),
      ),
      body: _buildbody(context, widget.index, widget.datalist),
    );
  }

  Widget _buildbody(BuildContext context, index, datalist) {
    Data info = datalist[index];
    var data = [
      Chartdata(value: info.quote.usd.percentChange30D, year: '30D'),
      Chartdata(value: info.quote.usd.percentChange7D, year: '7D'),
      Chartdata(value: info.quote.usd.percentChange24H, year: '24H'),
      Chartdata(value: info.quote.usd.percentChange1H, year: '1h'),
    ];
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
              word: '1 H',
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
              word: '24H',
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
              word: '7 D',
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
              word: '30D',
              onpress: () {
                setState(() {
                  showborder = 4;
                });
              },
            ),
            SizedBox(
              width: 10,
            ),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            legend: Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<Chartdata, String>>[
              SplineSeries(
                  dataSource: data,
                  xValueMapper: (Chartdata sales, _) => sales.year.toString(),
                  yValueMapper: (Chartdata sales, _) => sales.value,
                  animationDuration: 3000)
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text(
                'Instrument ${info.name}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                'Pricechange 24H ${info.quote.usd.percentChange24H}',
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
                        'Date ${info.lastUpdated}'.substring(0, 24),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Marketcap: ${info.quote.usd.marketCap.toStringAsFixed(0)}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700))
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Volume Change 24H',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${info.quote.usd.volumeChange24H}',
                          textAlign: TextAlign.center,
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

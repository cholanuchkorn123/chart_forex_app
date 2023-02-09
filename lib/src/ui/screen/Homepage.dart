import 'package:cached_network_image/cached_network_image.dart';
import 'package:chart_projects/main.dart';
import 'package:chart_projects/src/bloc/bloc/data_bloc.dart';
import 'package:chart_projects/src/modals/chartdata.dart';
import 'package:chart_projects/src/modals/data.dart';
import 'package:chart_projects/src/services/service.dart';
import 'package:chart_projects/src/ui/screen/detial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final service = Service();
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
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => DataBloc()..add(Dataeventstart()),
            )
          ],
          child: SafeArea(child: BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              if (state is Dataloading) {
                return Center(
                  child: Text('loading'),
                );
              } else if (state is Dataloaded) {
                List<Data> datalist = state.datalist;
                return _buildbody(context, datalist);
              } else {
                return Center(
                  child: Text('Failed'),
                );
              }
            },
          ))),
    );
  }

  Widget _buildbody(BuildContext context, List<Data> datalist) {
    List<Chartdata> chartdata = [];
    Data info = datalist[0];
    var data = [
      Chartdata(value: info.quote.usd.percentChange30D, year: '30D'),
      Chartdata(value: info.quote.usd.percentChange7D, year: '7D'),
      Chartdata(value: info.quote.usd.percentChange24H, year: '24H'),
      Chartdata(value: info.quote.usd.percentChange1H, year: '1h'),
    ];
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.only(bottom: 30),
          color: Color(0xff400E32),
          child: Column(children: [
            Text(
              info.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(isVisible: true),
                    primaryYAxis: CategoryAxis(isVisible: true),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<Chartdata, String>>[
                      SplineSeries(
                          dataSource: data,
                          xValueMapper: (Chartdata sales, _) =>
                              sales.year.toString(),
                          yValueMapper: (Chartdata sales, _) => sales.value,
                          animationDuration: 3000)
                    ],
                  ),
                )),
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
                    service.getcoinprice();
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
                  itemCount: datalist.length,
                  itemBuilder: (context, index) {
                    Data item = datalist[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detialscreen(
                                      index: index,
                                      datalist: datalist,
                                    )));
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
                                          // Expanded(
                                          //   child: CircleAvatar(
                                          //     radius: 10,
                                          //     child: ClipRRect(
                                          //       borderRadius:
                                          //           BorderRadius.circular(50),
                                          //       child: CachedNetworkImage(
                                          //           imageUrl: item.symbol,
                                          //           progressIndicatorBuilder:
                                          //               (context, url,
                                          //                   progress) {
                                          //             return LoadingAnimationWidget
                                          //                 .threeRotatingDots(
                                          //                     color:
                                          //                         Colors.white,
                                          //                     size: 30);
                                          //           },
                                          //           errorWidget:
                                          //               (context, url, error) =>
                                          //                   Icon(Icons.error)),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   child: CircleAvatar(
                                          //     radius: 10,
                                          //     child: ClipRRect(
                                          //       borderRadius:
                                          //           BorderRadius.circular(50),
                                          //       child: Image(
                                          //           image: AssetImage(
                                          //               'assets/images/eurflagtest.png')),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item.name.toUpperCase(),
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
                                        'Price Now ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${item.quote.usd.price.toStringAsFixed(2)}',
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
                                        'Volumn 24H'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item.quote.usd.volume24H
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
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
                                            builder: (context) => Detialscreen(
                                                  index: index,
                                                  datalist: datalist,
                                                )));
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

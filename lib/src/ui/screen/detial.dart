import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detialscreen extends StatefulWidget {
  const Detialscreen({super.key});

  @override
  State<Detialscreen> createState() => _DetialscreenState();
}

class _DetialscreenState extends State<Detialscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [],
        title: Text('Usd-Thb'),
      ),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
        ),
        Text('detail assets'),
        Container(
          padding: EdgeInsets.all(15),
          color: Colors.black,
          child: Column(children: [
            Row(),
            Row(),
          ]),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: Text('button')),
            TextButton(onPressed: () {}, child: Text('button'))
          ],
        )
      ]),
    );
  }
}

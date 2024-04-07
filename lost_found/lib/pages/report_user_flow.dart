import 'package:flutter/material.dart';
import 'package:lost_found/widgets/item_found.dart';
import 'package:lost_found/widgets/item_lost.dart';

class ReportUserFlow extends StatelessWidget {
  const ReportUserFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
                width: double.infinity,
              ),
              Text(
                'What do you want to report?',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50.0,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ItemLost(),
                  ItemFound(),
                ],
              ),
              Expanded(child: SizedBox.shrink()), // To take up remaining space
            ],
          ),
        ),
      ),
    );
  }
}

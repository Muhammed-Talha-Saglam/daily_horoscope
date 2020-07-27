import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'horoscope_details.dart';

class HoroscopeDaily extends StatefulWidget {
  final String name;
  final String imgPath;
  final String date;

  const HoroscopeDaily({Key key, this.name, this.imgPath, this.date})
      : super(key: key);
  @override
  _HoroscopeDailyState createState() => _HoroscopeDailyState();
}

class _HoroscopeDailyState extends State<HoroscopeDaily> {
  var date = DateTime.now()
      .toString()
      .substring(0, DateTime.now().toString().indexOf(' ', 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.purple,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 0),
                child: SvgPicture.asset(
                  widget.imgPath,
                  height: 75,
                  width: 75,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 40,
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox(height: 20),
          StreamBuilder(
            stream: Firestore.instance.collection('daily').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data.documents.length == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Make Sure You Are Connected To The Internet!'),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(5, 10),
                          blurRadius: 2,
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        snapshot.data.documents[0][widget.name],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HoroscopeDetail(
                    name: widget.name,
                    imgPath: widget.imgPath,
                    date: widget.date,
                  ),
                ));
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'See Details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';

class HoroscopeDetail extends StatefulWidget {
  final String name;
  final String date;
  final String imgPath;

  HoroscopeDetail({this.name, this.date, this.imgPath});

  @override
  _HoroscopeDetailState createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCardColor,
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
              style: TextStyle(fontSize: 40, color: Colors.purple),
            ),
          ),
          SizedBox(height: 20),
          StreamBuilder(
              stream:
                  Firestore.instance.collection('${widget.name}').snapshots(),
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
                            Text(
                                'Make Sure You Are Connected To The Internet!'),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  if (snapshot.data.documents[0]['Element'] == null) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Make Sure You Are Connected To The Internet!'),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HoroscopeCharacteristics(
                            item: 'Element',
                            desc: snapshot.data.documents[0]['Element']),
                        HoroscopeCharacteristics(
                            item: 'Quality',
                            desc: snapshot.data.documents[0]['Quality']),
                        HoroscopeCharacteristics(
                            item: 'Color',
                            desc: snapshot.data.documents[0]['Color']),
                        HoroscopeCharacteristics(
                            item: 'Ruler',
                            desc: snapshot.data.documents[0]['Ruler']),
                        HoroscopeCharacteristics(
                            item: 'Greatest Overall Compatibility',
                            desc: snapshot.data.documents[0]
                                ['Greatest Overall Compatibility']),
                        HoroscopeCharacteristics(
                            item: 'Lucky Numbers',
                            desc: snapshot.data.documents[0]['Lucky Numbers']),
                        HoroscopeCharacteristics(
                            item: 'Date range',
                            desc: snapshot.data.documents[0]['Date range']),
                        HoroscopeCharacteristics(
                            item: 'Strengths',
                            desc: snapshot.data.documents[0]['Strengths']),
                        HoroscopeCharacteristics(
                            item: 'Weaknesses',
                            desc: snapshot.data.documents[0]['Weaknesses']),
                        HoroscopeCharacteristics(
                            item: 'Likes',
                            desc: snapshot.data.documents[0]['Likes']),
                        HoroscopeCharacteristics(
                            item: 'Dislikes',
                            desc: snapshot.data.documents[0]['Dislikes']),
                      ],
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}

class HoroscopeCharacteristics extends StatelessWidget {
  final String item;
  final String desc;

  const HoroscopeCharacteristics({
    Key key,
    this.item,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(16),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$item:  ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTextColor1,
                ),
              ),
              TextSpan(
                text: desc,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:daily_horoscope/screens/horoscope_daily.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class HoroscopeCard extends StatelessWidget {
  final String name;
  final String date;
  final String imgPath;

  const HoroscopeCard({
    Key key,
    this.name,
    this.date,
    this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HoroscopeDaily(
              name: this.name,
              imgPath: this.imgPath,
              date: this.date,
            ),
          ),
        );
      },
      child: Container(
        height: orientation == Orientation.portrait
            ? size.height * 0.15
            : size.height * 0.20,
        width: size.width * 0.30,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 5),
              blurRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 2),
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                imgPath,
                height: size.height * 0.05,
                width: size.width * 0.11,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                date,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

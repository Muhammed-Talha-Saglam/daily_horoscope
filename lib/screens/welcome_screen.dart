import 'package:daily_horoscope/widgets/horoscope_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25),
              const Text(
                'Daily Horoscope',
                style: const TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 40,
                  color: kTitleColor,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  HoroscopeCard(
                    name: 'ARIES',
                    date: 'Mar 21-Apr 19',
                    imgPath: 'assets/icons/aries.svg',
                  ),
                  HoroscopeCard(
                    name: 'TAURUS',
                    date: 'Apr 20-May 20',
                    imgPath: 'assets/icons/taurus.svg',
                  ),
                  HoroscopeCard(
                    name: 'GEMINI',
                    date: 'May 21-Jun 20',
                    imgPath: 'assets/icons/gemini.svg',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  HoroscopeCard(
                    name: 'CANCER',
                    date: 'Jun 21-Jul 22',
                    imgPath: 'assets/icons/cancer.svg',
                  ),
                  HoroscopeCard(
                    name: 'LEO',
                    date: 'Jul 23-Aug 22',
                    imgPath: 'assets/icons/lion.svg',
                  ),
                  HoroscopeCard(
                    name: 'VIRGO',
                    date: 'Aug 23-Sep 22',
                    imgPath: 'assets/icons/virgo.svg',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  HoroscopeCard(
                    name: 'LIBRA',
                    date: 'Sep 23-Oct 22',
                    imgPath: 'assets/icons/libra.svg',
                  ),
                  HoroscopeCard(
                    name: 'SCORPIO',
                    date: 'Oct 23-Nov 21',
                    imgPath: 'assets/icons/scorpio.svg',
                  ),
                  HoroscopeCard(
                    name: 'SAGITTARIUS',
                    date: 'Nov 22-Dec 21',
                    imgPath: 'assets/icons/sagittarius.svg',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  HoroscopeCard(
                    name: 'CAPRICORN',
                    date: 'Dec 22-Jan 19',
                    imgPath: 'assets/icons/capricorn.svg',
                  ),
                  HoroscopeCard(
                    name: 'AQUARIUS',
                    date: 'Jan 20-Feb 18',
                    imgPath: 'assets/icons/aquarius.svg',
                  ),
                  HoroscopeCard(
                    name: 'PISCES',
                    date: 'Feb 19-Mar 20',
                    imgPath: 'assets/icons/virgo.svg',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Select your horoscope',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

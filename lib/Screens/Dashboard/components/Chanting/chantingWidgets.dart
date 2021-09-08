import 'dart:async';

import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class ChantingWidget extends StatefulWidget {
  const ChantingWidget({
    Key key,
    this.backgroundColor,
    this.text,
    this.textColor,
    @required this.receivedDataModel,
    @required this.shouldTriggerChange,
  }) : super(key: key);

  final DataModel receivedDataModel;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Stream shouldTriggerChange;

  @override
  _ChantingWidgetState createState() => _ChantingWidgetState(
        localDataModel: receivedDataModel,
      );
}

class _ChantingWidgetState extends State<ChantingWidget> {
  StreamSubscription streamSubscription;
  _ChantingWidgetState({
    this.localDataModel,
  });

  @override
  void initState() {
    super.initState();
    getSadhanaCardRecored();
    streamSubscription = widget.shouldTriggerChange.listen((_) => {
          getSadhanaCardRecored(),
        });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  final DataModel localDataModel;
  SadhanaCardColumnNames sadhanaCardTable = SadhanaCardColumnNames();

  //To save Total of the each time
  final int sliderValueTotal = 0;

  int sliderValueBefore8 = 0;
  int sliderValueBetween8To6 = 0;
  int sliderValueAfter6 = 0;
  double earnedPoint = 0;

  int minRounds0 = 0;
  int maxRounds32 = 32;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: -0.0,
              blurRadius: 0,
              offset: Offset(0,
                  00), // changes position of shadow offset: Offset(5, 05), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.white.withOpacity(1.0),
              spreadRadius: -0.0,
              blurRadius: 0,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: kBackgroundColorOrange,
                borderRadius: BorderRadius.circular(29),
                border: Border.all(),
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: (size.width * 0.6),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          (sliderValueBefore8 +
                                      sliderValueBetween8To6 +
                                      sliderValueAfter6) <
                                  10
                              ? "0" +
                                  (sliderValueBefore8 +
                                          sliderValueBetween8To6 +
                                          sliderValueAfter6)
                                      .toString()
                              : (sliderValueBefore8 +
                                      sliderValueBetween8To6 +
                                      sliderValueAfter6)
                                  .toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          " $lableRounds",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        //00:00 to 08:00AM START
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              lableFrom00To08,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kBackgroundColorOrange,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                minRounds0.toString() + "0",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Slider(
                                min: minRounds0.toDouble(),
                                max: maxRounds32.toDouble(),
                                value: sliderValueBefore8.toDouble(),
                                onChanged: (double newValue) => {
                                  setState(() => {
                                        sliderValueBefore8 = newValue.round(),
                                        earnedPoint = getEarnedPoint(
                                            sliderValueBefore8,
                                            sliderValueBetween8To6,
                                            sliderValueAfter6),
                                      }),
                                },
                                onChangeEnd: (double value) => {
                                  updateSadhanaCardofDate(),
                                },
                                activeColor: Colors.orange,
                                inactiveColor: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: kBackgroundColorOrange,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Text(
                                    maxRounds32.toString(),
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //00:00 to 08:00AM END
                        //08:00 to 06:00PM START
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              lableFrom08To06,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kBackgroundColorOrange,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                minRounds0.toString() + "0",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Slider(
                                min: minRounds0.toDouble(),
                                max: maxRounds32.toDouble(),
                                value: sliderValueBetween8To6.toDouble(),
                                onChanged: (double newValue) => {
                                  setState(
                                    () => {
                                      sliderValueBetween8To6 = newValue.round(),
                                      earnedPoint = getEarnedPoint(
                                          sliderValueBefore8,
                                          sliderValueBetween8To6,
                                          sliderValueAfter6),
                                    },
                                  ),
                                },
                                onChangeEnd: (double value) => {
                                  updateSadhanaCardofDate(),
                                },
                                activeColor: Colors.orange,
                                inactiveColor: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: kBackgroundColorOrange,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Text(
                                    maxRounds32.toString(),
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //08:00 to 06:00PM END
                        //06:00 PM to 11:59 PM START
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              lableFrom06To00,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        //Done
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kBackgroundColorOrange,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                minRounds0.toString() + "0",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Slider(
                                min: minRounds0.toDouble(),
                                max: maxRounds32.toDouble(),
                                value: sliderValueAfter6.toDouble(),
                                onChanged: (double newValue) => {
                                  setState(() => {
                                        sliderValueAfter6 = newValue.round(),
                                        earnedPoint = getEarnedPoint(
                                            sliderValueBefore8,
                                            sliderValueBetween8To6,
                                            sliderValueAfter6),
                                      }),
                                },
                                onChangeEnd: (double value) => {
                                  updateSadhanaCardofDate(),
                                },
                                activeColor: Colors.orange,
                                inactiveColor: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: kBackgroundColorOrange,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Text(
                                    maxRounds32.toString(),
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kForeColorLightOrange,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(),
                          ),
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: (size.width * 0.8),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "$lableEarnedPoints : ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      (earnedPoint) < 10
                                          ? (earnedPoint)
                                              .toString()
                                              .substring(0, 3)
                                          : (earnedPoint)
                                              .toString()
                                              .substring(0, 4),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateSadhanaCardofDate() async {
    Map<String, dynamic> row = {
      DatabaseHelper.colSCsadhanaDate: localDataModel.colSCsadhanaDate,
      DatabaseHelper.colSCchantingBefore8: sliderValueBefore8.toString(),
      DatabaseHelper.colSCchantingBetween8To6:
          sliderValueBetween8To6.toString(),
      DatabaseHelper.colSCchantingAfter6: sliderValueAfter6.toString(),
      DatabaseHelper.colSCearnedChantingPoints: earnedPoint.toString(),
    };
    await dbHelper.updateTableSadhanaCardChanting(row);
  }

  Future<void> getSadhanaCardRecored() async {
    List<Map<dynamic, dynamic>> allRows = await dbHelper
        .getRecoredFromSadhanaCard(date: localDataModel.colSCsadhanaDate);
    if (allRows.length > 0) {
      allRows.forEach((element) {
        if (this.mounted) {
          setState(
            () {
              sliderValueBefore8 =
                  int.parse(element.entries.elementAt(2).value.toString());
              sliderValueBetween8To6 =
                  int.parse(element.entries.elementAt(3).value.toString());
              sliderValueAfter6 =
                  int.parse(element.entries.elementAt(4).value.toString());
              earnedPoint =
                  double.parse(element.entries.elementAt(5).value.toString());
            },
          );
        }
      });
    } else {
      if (this.mounted) {
        setState(
          () {
            sliderValueBefore8 = 0;
            sliderValueBetween8To6 = 0;
            sliderValueAfter6 = 0;
            earnedPoint = double.parse("0");
          },
        );
      }
    }
  }

//Calculate Total Earning point
  double getEarnedPoint(int _sliderValueBefore8, int _sliderValueBetween8To6,
      int _sliderValueAfter6) {
    double before8Points = 4.5;
    double between8to6Points = 3.0;
    double after6Points = 1.5;
    double finalScore = 0;
    double tempTotalScore = ((_sliderValueBefore8 * before8Points) +
        (_sliderValueBetween8To6 * between8to6Points) +
        (_sliderValueAfter6 * after6Points));

    if (tempTotalScore >= 72) {
      finalScore = 72;
    } else {
      finalScore = tempTotalScore;
    }
    return finalScore;
  }
}

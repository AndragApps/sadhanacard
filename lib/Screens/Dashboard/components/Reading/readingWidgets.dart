import 'dart:async';

import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_inputText.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class ReadingWidget extends StatefulWidget {
  const ReadingWidget({
    Key key,
    this.backgroundColor,
    this.text,
    this.textColor,
    @required this.receivedDataModel,
    @required this.shouldTriggerChange,
  }) : super(key: key);

  final Color backgroundColor;
  final String text;
  final Color textColor;
  final DataModel receivedDataModel;
  final Stream shouldTriggerChange;
  @override
  _ReadingWidgetState createState() =>
      _ReadingWidgetState(localDataModel: receivedDataModel);
}

class _ReadingWidgetState extends State<ReadingWidget> {
  StreamSubscription streamSubscription;
  _ReadingWidgetState({
    this.localDataModel,
  });

  @override
  void initState() {
    super.initState();
    getSadhanaCardRecored();
    streamSubscription = widget.shouldTriggerChange.listen((_) => {
          updateHearingTimer(),
          getSadhanaCardRecored(),
        });
  }

  @override
  void dispose() {
    txtBookEditingController.dispose();
    streamSubscription.cancel();
    super.dispose();
  }

  int _hearingHours = 0;
  int _hearingMinutes = 0;
  DataModel localDataModel;
  GlobalFunction _globalFunction = GlobalFunction();
  final dbHelper = DatabaseHelper.instance;
  bool messageVisiblity = true;

  int hoursSliderValue = 0;
  int hourMinSliderValue = 0;
  int hourMaxSliderValue = 23;

  int minutesSliderValue = 0;
  int minutesMinSliderValue = 0;
  int minutesMaxSliderValue = 59;

  String txtBook = "";
  TextEditingController txtBookEditingController = TextEditingController();
  int earnedPoint = 0;
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
            //HOUR:MINUTES BANNER
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          hoursSliderValue < 10
                              ? "0" + hoursSliderValue.toString()
                              : hoursSliderValue.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          lableHours,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          " : ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          minutesSliderValue < 10
                              ? "0" + minutesSliderValue.toString()
                              : minutesSliderValue.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          lableMinutes,
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
            //MINUTES
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    lableMin,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Slider(
                    min: minutesMinSliderValue.toDouble(),
                    max: minutesMaxSliderValue.toDouble(),
                    value: minutesSliderValue.toDouble(),
                    onChanged: (double newValue) => {
                      setState(() => {
                            minutesSliderValue = newValue.round(),
                          }),
                    },
                    onChangeEnd: (double value) => {
                      updateSadhanaCardofDate(),
                    },
                    activeColor: Colors.orange,
                    inactiveColor: Colors.grey,
                  ),
                ),
              ],
            ),
            //HOUR
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child:
                      // TEXT : HOUR
                      Text(
                    lableHour,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Slider(
                    min: hourMinSliderValue.toDouble(),
                    max: hourMaxSliderValue.toDouble(),
                    value: hoursSliderValue.toDouble(),
                    onChanged: (double newValue) => {
                      setState(() => {hoursSliderValue = newValue.round()}),
                    },
                    onChangeEnd: (double value) => {
                      updateSadhanaCardofDate(),
                    },
                    activeColor: Colors.orange,
                    inactiveColor: Colors.grey,
                  ),
                ),
              ],
            ),
            //GET INPUT FROM THE USER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child:
                      // TEXT : HOUR
                      Text(
                    "$lableBook : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Expanded(
                  flex: 7,
                  child: RoundedInputField(
                    textEditingController: txtBookEditingController,
                    onChanged: (value) {
                      txtBook = value;
                      updateSadhanaCardofDate();
                    },
                    icon: Icons.library_books,
                    hintText: txtEnterHere,
                    hintColor: Colors.grey.shade600,
                    iconColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
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
                          txtPointsavailableinHearing,
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
    );
  }

  //Delay in message...start
  startTimer({int delaySecond}) async {
    var duration = Duration(seconds: delaySecond);
    return Timer(duration, setMessageVisiblity);
  }

  updateHearingTimer() async {
    var duration = Duration(milliseconds: 100);
    return Timer(duration, setHearingLastUpdate);
  }

  void setMessageVisiblity() {
    messageVisiblity = true;
  }

//Delay in message...ends
  Future<void> updateSadhanaCardofDate() async {
    localDataModel.colSCreadingMinutes = minutesSliderValue.toString();
    localDataModel.colSCreadingHours = hoursSliderValue.toString();
    localDataModel.colSCreadingTopic = txtBook;
    earnedPoint = _globalFunction.getReadingAndHearingEarnedPoint(
        readingHours: int.parse(localDataModel.colSCreadingHours),
        readingMinutes: int.parse(localDataModel.colSCreadingMinutes),
        hearingHours: _hearingHours,
        hearingMinutes: _hearingMinutes);
    localDataModel.colSCearnedReadingAndHearingPoints = earnedPoint.toString();

    Map<String, dynamic> row = {
      DatabaseHelper.colSCsadhanaDate: localDataModel.colSCsadhanaDate,
      DatabaseHelper.colSCreadingMinutes: localDataModel.colSCreadingMinutes,
      DatabaseHelper.colSCreadingHours: localDataModel.colSCreadingHours,
      DatabaseHelper.colSCreadingTopic: localDataModel.colSCreadingTopic,
      DatabaseHelper.colSCearnedReadingAndHearingPoints:
          localDataModel.colSCearnedReadingAndHearingPoints,
    };

    List<Map<String, dynamic>> allRows =
        await dbHelper.updateTableSadhanaCardReadingAndHearing(row);
    _globalFunction.printSeprator();
    allRows.forEach((element) {
      print(element.entries.elementAt(0).toString());
      print(element.entries.elementAt(1).toString());
      print(element.entries.elementAt(6).toString());
      print(element.entries.elementAt(7).toString());
      print(element.entries.elementAt(9).toString());
      print(element.entries.elementAt(10).toString());
      print(element.entries.elementAt(11).toString());
      print(element.entries.elementAt(12).toString());
    });
    _globalFunction.printSeprator();
  }

//Do not Change now it's done.
//Get Recored from Sadhana Card Table, and set to the slider and text box.
  Future<void> getSadhanaCardRecored() async {
    List<Map<dynamic, dynamic>> allRows = await dbHelper
        .getRecoredFromSadhanaCard(date: localDataModel.colSCsadhanaDate);
    if (allRows.length > 0) {
      if (this.mounted) {
        setState(() {
          allRows.forEach((element) {
            minutesSliderValue =
                int.parse(element.entries.elementAt(6).value.toString());
            hoursSliderValue =
                int.parse(element.entries.elementAt(7).value.toString());
            txtBook = element.entries.elementAt(8).value.toString();
            txtBookEditingController.text = txtBook;
            _hearingMinutes =
                int.parse(element.entries.elementAt(9).value.toString());
            _hearingHours =
                int.parse(element.entries.elementAt(10).value.toString());
            earnedPoint =
                int.parse(element.entries.elementAt(12).value.toString());
          });
        });
      } else {
        minutesSliderValue = 0;
        hoursSliderValue = 0;
        txtBook = "";
        txtBookEditingController.text = txtBook;
        _hearingMinutes = 0;
        _hearingHours = 0;
        earnedPoint = 0;
      }
    }
  }

  Future<void> setHearingLastUpdate() async {
    List<Map<dynamic, dynamic>> allRows = await dbHelper
        .getRecoredFromSadhanaCard(date: localDataModel.colSCsadhanaDate);
    if (allRows.length > 0) {
      allRows.forEach((element) {
        _hearingHours =
            int.parse(element.entries.elementAt(10).value.toString());
        _hearingMinutes =
            int.parse(element.entries.elementAt(9).value.toString());
      });
    } else {
      _hearingHours = 0;
      _hearingMinutes = 0;
    }
    updateHearingTimer();
  }
}

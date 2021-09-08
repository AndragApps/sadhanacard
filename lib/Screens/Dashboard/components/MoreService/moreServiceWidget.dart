import 'dart:async';

import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_inputText.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class MoreServiceWidget extends StatefulWidget {
  const MoreServiceWidget({
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
  _MoreServiceWidgetState createState() => _MoreServiceWidgetState(
        localDataModel: receivedDataModel,
      );
}

class _MoreServiceWidgetState extends State<MoreServiceWidget> {
  StreamSubscription streamSubscription;
  _MoreServiceWidgetState({
    this.localDataModel,
  });

  @override
  void initState() {
    super.initState();
    getSadhanaCardRecored();
    updateServiceTimer();
    streamSubscription = widget.shouldTriggerChange.listen((_) => {
          getSadhanaCardRecored(),
        });
  }

  @override
  void dispose() {
    txtMoreServiceEditingController.dispose();
    streamSubscription.cancel();
    super.dispose();
  }

  final dbHelper = DatabaseHelper.instance;
  final DataModel localDataModel;
  GlobalFunction _globalFunction = GlobalFunction();
  int hoursSliderValue = 0;
  int hourMinSliderValue = 0;
  int hourMaxSliderValue = 23;

  int minutesSliderValue = 0;
  int minutesMinSliderValue = 0;
  int minutesMaxSliderValue = 59;
  int earnedPoint = 0;

  int _serviceHours = 0;
  int _serviceMinutes = 0;
  String txtMoreService = "";
  TextEditingController txtMoreServiceEditingController =
      TextEditingController();
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
              offset: Offset(0, 00),
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
                            earnedPoint = _globalFunction
                                .getServiceAndMoreServiceEarnedPoint(
                                    serviceHours: _serviceHours,
                                    serviceMinutes: _serviceMinutes,
                                    moreServiceHours: hoursSliderValue,
                                    moreServiceMinutes: minutesSliderValue),
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
                      setState(() => {
                            hoursSliderValue = newValue.round(),
                            earnedPoint = _globalFunction
                                .getServiceAndMoreServiceEarnedPoint(
                                    serviceHours: _serviceHours,
                                    serviceMinutes: _serviceMinutes,
                                    moreServiceHours: hoursSliderValue,
                                    moreServiceMinutes: minutesSliderValue),
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
            //GET INPUT FROM THE USER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child:
                      // TEXT : HOUR
                      Text(
                    "$lableService : ",
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
                    textEditingController: txtMoreServiceEditingController,
                    icon: Icons.room_service,
                    hintText: txtEnterHere,
                    hintColor: Colors.grey.shade600,
                    onChanged: (value) {
                      txtMoreService = value;
                      updateSadhanaCardofDate();
                    },
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
                          "$txtServiceAndMoreServiceEP : ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                        Text(
                          (earnedPoint) < 10
                              ? (earnedPoint).toString()
                              : (earnedPoint).toString(),
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

  void updateSadhanaCardofDate() async {
    localDataModel.colSCmoreServiceMinutes = minutesSliderValue.toString();
    localDataModel.colSCmoreServiceHours = hoursSliderValue.toString();
    localDataModel.colSCmoreServiceTopic = txtMoreService.toString();
    localDataModel.colSCearnedServiceAndMoreServicePoints =
        earnedPoint.toString();

    Map<String, dynamic> row = {
      DatabaseHelper.colSCsadhanaDate: localDataModel.colSCsadhanaDate,
      DatabaseHelper.colSCmoreServiceMinutes:
          localDataModel.colSCmoreServiceMinutes,
      DatabaseHelper.colSCmoreServiceHours:
          localDataModel.colSCmoreServiceHours,
      DatabaseHelper.colSCmoreServiceTopic:
          localDataModel.colSCmoreServiceTopic,
      DatabaseHelper.colSCearnedServiceAndMoreServicePoints:
          localDataModel.colSCearnedServiceAndMoreServicePoints,
    };

    List<Map<String, dynamic>> allRows =
        await dbHelper.updateTableSadhanaCardServiceAndMoreService(row);
    _globalFunction.printSeprator();
    allRows.forEach((element) {
      print(element.entries.elementAt(0).toString());
      print(element.entries.elementAt(1).toString());
      print(element.entries.elementAt(13).toString());
      print(element.entries.elementAt(14).toString());
      print(element.entries.elementAt(15).toString());
      print(element.entries.elementAt(16).toString());
      print(element.entries.elementAt(17).toString());
      print(element.entries.elementAt(18).toString());
      print(element.entries.elementAt(19).toString());
    });
    _globalFunction.printSeprator();
  }

  Future<void> getSadhanaCardRecored() async {
    List<Map<dynamic, dynamic>> allRows = await dbHelper
        .getRecoredFromSadhanaCard(date: localDataModel.colSCsadhanaDate);

    if (allRows.length > 0) {
      if (this.mounted) {
        setState(() {
          allRows.forEach((element) {
            _serviceMinutes =
                int.parse(element.entries.elementAt(13).value.toString());
            _serviceHours =
                int.parse(element.entries.elementAt(14).value.toString());
            minutesSliderValue =
                int.parse(element.entries.elementAt(16).value.toString());
            hoursSliderValue =
                int.parse(element.entries.elementAt(17).value.toString());
            txtMoreService = element.entries.elementAt(18).value.toString();
            txtMoreServiceEditingController.text = txtMoreService;
            earnedPoint =
                int.parse(element.entries.elementAt(19).value.toString());
          });
        });
      }
    } else {
      if (this.mounted) {
        setState(() {
          _serviceMinutes = 0;
          _serviceHours = 0;
          minutesSliderValue = 0;
          hoursSliderValue = 0;
          txtMoreService = "";
          txtMoreServiceEditingController.text = txtMoreService;
          earnedPoint = 0;
        });
      }
    }
  }

  Future<void> setMoreServiceLastUpdate() async {
    List<Map<dynamic, dynamic>> allRows = await dbHelper
        .getRecoredFromSadhanaCard(date: localDataModel.colSCsadhanaDate);
    if (allRows.length > 0) {
      allRows.forEach((element) {
        if (this.mounted) {
          setState(() {
            _serviceMinutes =
                int.parse(element.entries.elementAt(13).value.toString());
            _serviceHours =
                int.parse(element.entries.elementAt(14).value.toString());
            earnedPoint =
                int.parse(element.entries.elementAt(19).value.toString());
          });
        }
      });
    } else {
      if (this.mounted) {
        setState(() {
          _serviceMinutes = 0;
          _serviceHours = 0;
          earnedPoint = 0;
        });
      }
    }
    updateServiceTimer();
  }

  updateServiceTimer() async {
    var duration = Duration(milliseconds: 0);
    return Timer(duration, setMoreServiceLastUpdate);
  }
}

import 'dart:async';

import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_inputText.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({
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
  _ServiceWidgetState createState() => _ServiceWidgetState(
        localDataModel: receivedDataModel,
      );
}

class _ServiceWidgetState extends State<ServiceWidget> {
  StreamSubscription streamSubscription;
  _ServiceWidgetState({
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

  updateHearingTimer() async {
    var duration = Duration(milliseconds: 100);
    return Timer(duration, setMoreServiceLastUpdate);
  }

  @override
  void dispose() {
    txtServiceEditingController.dispose();
    streamSubscription.cancel();
    super.dispose();
  }

  final DataModel localDataModel;
  GlobalFunction _globalFunction = GlobalFunction();
  final dbHelper = DatabaseHelper.instance;
  int hoursSliderValue = 0;
  int hourMinSliderValue = 0;
  int hourMaxSliderValue = 23;

  int minutesSliderValue = 0;
  int minutesMinSliderValue = 0;
  int minutesMaxSliderValue = 59;

  int _moreServiceHours = 0;
  int _moreServiceMinutes = 0;
  String txtService = "";
  int earnedPoint = 0;
  TextEditingController txtServiceEditingController = TextEditingController();
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
                      setState(() => {
                            hoursSliderValue = newValue.round(),
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
                    textEditingController: txtServiceEditingController,
                    icon: Icons.room_service,
                    hintText: txtEnterHere,
                    hintColor: Colors.grey.shade600,
                    onChanged: (value) {
                      txtService = value;
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
                          txtPointsavailableinMoreService,
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
    localDataModel.colSCserviceMinutes = minutesSliderValue.toString();
    localDataModel.colSCserviceHours = hoursSliderValue.toString();
    localDataModel.colSCserviceTopic = txtService;
    earnedPoint = _globalFunction.getServiceAndMoreServiceEarnedPoint(
        serviceHours: int.parse(localDataModel.colSCserviceHours),
        serviceMinutes: int.parse(localDataModel.colSCserviceMinutes),
        moreServiceHours: _moreServiceHours,
        moreServiceMinutes: _moreServiceMinutes);
    localDataModel.colSCearnedServiceAndMoreServicePoints =
        earnedPoint.toString();

    Map<String, dynamic> row = {
      DatabaseHelper.colSCsadhanaDate: localDataModel.colSCsadhanaDate,
      DatabaseHelper.colSCserviceMinutes: localDataModel.colSCserviceMinutes,
      DatabaseHelper.colSCserviceHours: localDataModel.colSCserviceHours,
      DatabaseHelper.colSCserviceTopic: localDataModel.colSCserviceTopic,
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
      print(element.entries.elementAt(19).toString());
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
                int.parse(element.entries.elementAt(13).value.toString());
            hoursSliderValue =
                int.parse(element.entries.elementAt(14).value.toString());
            txtService = element.entries.elementAt(15).value.toString();
            txtServiceEditingController.text = txtService;
            _moreServiceMinutes =
                int.parse(element.entries.elementAt(16).value.toString());
            _moreServiceHours =
                int.parse(element.entries.elementAt(17).value.toString());
            earnedPoint =
                int.parse(element.entries.elementAt(19).value.toString());
          });
        });
      }
    } else {
      setState(() {
        minutesSliderValue = 0;
        hoursSliderValue = 0;
        txtService = "";
        txtServiceEditingController.text = txtService;
        _moreServiceMinutes = 0;
        _moreServiceHours = 0;
        earnedPoint = 0;
      });
    }
  }

  Future<void> setMoreServiceLastUpdate() async {
    List<Map<dynamic, dynamic>> allRows = await dbHelper
        .getRecoredFromSadhanaCard(date: localDataModel.colSCsadhanaDate);
    if (allRows.length > 0) {
      allRows.forEach((element) {
        _moreServiceMinutes =
            int.parse(element.entries.elementAt(16).value.toString());
        _moreServiceHours =
            int.parse(element.entries.elementAt(17).value.toString());
      });
    } else {
      _moreServiceMinutes = 0;
      _moreServiceHours = 0;
    }

    updateHearingTimer();
  }
}

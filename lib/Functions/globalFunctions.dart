import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalFunction {
  DateFormat dateFormater = new DateFormat.yMMMd();
  DateTime now = DateTime.now();

  String parseDateToyMMMd(DateTime _dateTime) {
    return dateFormater.format(_dateTime);
  }

  String parseDateForDatabase(DateTime _dateTime) {
    return _dateTime.toString().substring(0, 10);
  }

  void msgBox(BuildContext context, String _message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          _message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void printMsg(String msg) {
    print("\n >> Message : " + msg);
  }

  void printMsgWithNumber(int msgNumber, String msg) {
    print("\n >> MSG - " + msgNumber.toString() + " : " + msg);
  }

  void printSeprator() {
    print("====================================================");
  }

  //To Navigate Screen.
  route(BuildContext context, Widget navigateTo) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
  }

  //Calculate Total Earning point
  int getReadingAndHearingEarnedPoint({
    int readingHours,
    int readingMinutes,
    int hearingHours,
    int hearingMinutes,
  }) {
    int pointForActivity = 18;
    int finalScore = 0;
    int tempTotalScore = (((readingMinutes +
                    hearingMinutes +
                    ((readingHours + hearingHours) * 60)) /
                60) *
            pointForActivity)
        .round();
    int tempTotalMinutes =
        (readingMinutes + hearingMinutes + ((readingHours + hearingHours) * 60))
            .round();

    if (tempTotalMinutes < 15) {
      finalScore = -20;
    } else if (tempTotalScore > pointForActivity) {
      finalScore = pointForActivity;
    } else {
      finalScore = tempTotalScore;
    }
    return finalScore;
  }

  //Calculate Total Earning point
  int getServiceAndMoreServiceEarnedPoint({
    int serviceHours,
    int serviceMinutes,
    int moreServiceHours,
    int moreServiceMinutes,
  }) {
    int pointForActivity = 10;
    int finalScore = 0;
    int tempTotalScore = (((serviceMinutes +
                    moreServiceMinutes +
                    ((serviceHours + moreServiceHours) * 60)) /
                30) *
            pointForActivity)
        .round();
    int tempTotalMinutes = (serviceMinutes +
            moreServiceMinutes +
            ((serviceHours + moreServiceHours) * 60))
        .round();

    if (tempTotalMinutes < 15) {
      finalScore = 0;
    } else if (tempTotalScore > pointForActivity) {
      finalScore = pointForActivity;
    } else {
      print(
          "Service and More Service tempTotalScore.round() => $tempTotalScore");
      finalScore = tempTotalScore;
    }
    return finalScore;
  }
}

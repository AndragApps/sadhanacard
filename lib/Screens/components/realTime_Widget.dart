import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String _timeString;
  Timer _timer;
  DateFormat timeFromDate = new DateFormat.jm();

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
     _timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  //Cancle the time which update live time.
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return timeFromDate.format(dateTime);
  }
}

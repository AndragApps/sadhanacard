import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<bool> isNewDateSelected;

  DatePickerWidget({
    Key key,
    this.onDateChanged,
    this.isNewDateSelected,
  });
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  GlobalFunction _globalFunction = GlobalFunction();
  DateTime _selectedDate = DateTime.now();
  DateTime _lastSelectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _isRecoredExist(_globalFunction.parseDateForDatabase(_selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        showDatePicker(
          context: context, //asd
          initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        ).then(
          (date) {
            setState(
              () {
                _selectedDate = date;
                if (_selectedDate == null) {
                  _selectedDate = _lastSelectedDate;
                }
                _isRecoredExist(
                    _globalFunction.parseDateForDatabase(_selectedDate));
                widget.onDateChanged(_selectedDate);
                _lastSelectedDate = _selectedDate;
              },
            );
          },
        );
      },
      child: Text(
        _globalFunction.parseDateToyMMMd(_selectedDate),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }

  void _isRecoredExist(String date) async {
    String localDate = date;
    if (await dbHelper.isRecoredInsertedForDate(selectedDate: localDate) > 0) {
      widget.isNewDateSelected(false);
      _globalFunction.msgBox(
          context,
          "$lableUpdateSadhanaCard - " +
              _globalFunction.parseDateToyMMMd(_selectedDate));
    } else {
      widget.isNewDateSelected(true);
      _globalFunction.msgBox(
          context,
          "$lableUpdateNewSadhanaCard - " +
              _globalFunction.parseDateToyMMMd(_selectedDate));
      _insertNewSadhanaCard(selectedDate: localDate);
    }
  }

  void _insertNewSadhanaCard({String selectedDate}) async {
    Map<String, dynamic> row = {
      DatabaseHelper.colSCsadhanaDate: selectedDate,
      DatabaseHelper.colSCpointCardId: "1",
      DatabaseHelper.colSCchantingBefore8: "0",
      DatabaseHelper.colSCchantingBetween8To6: "0",
      DatabaseHelper.colSCchantingAfter6: "0",
      DatabaseHelper.colSCearnedChantingPoints: "0",
      DatabaseHelper.colSCreadingMinutes: "0",
      DatabaseHelper.colSCreadingHours: "0",
      DatabaseHelper.colSCreadingTopic: ("").toString().trim(),
      DatabaseHelper.colSChearingMinutes: "0",
      DatabaseHelper.colSChearingHours: "0",
      DatabaseHelper.colSChearingTopic: ("").toString().trim(),
      DatabaseHelper.colSCearnedReadingAndHearingPoints: "0",
      DatabaseHelper.colSCserviceMinutes: "0",
      DatabaseHelper.colSCserviceHours: "0",
      DatabaseHelper.colSCserviceTopic: ("").toString().trim(),
      DatabaseHelper.colSCmoreServiceMinutes: "0",
      DatabaseHelper.colSCmoreServiceHours: "0",
      DatabaseHelper.colSCmoreServiceTopic: ("").toString().trim(),
      DatabaseHelper.colSCearnedServiceAndMoreServicePoints: "0",
    };
    final id = await dbHelper.insertIntoTableSadhanaCard(row);
    _globalFunction.printMsg('Function called inserted row id: $id');
  }

  void _insertNewPointCard(String selectedDate) async {
    Map<String, dynamic> row = {
      DatabaseHelper.colPCentryDate: selectedDate,
      DatabaseHelper.colPCchantingBefore8: 4.5,
      DatabaseHelper.colPCchantingBetween8To6: 3.0,
      DatabaseHelper.colPCchantingAfter6: 1.5,
      DatabaseHelper.colPCchantingMaxScore: 72,
      DatabaseHelper.colPCchantingMinScore: 0,
      DatabaseHelper.colPCreadingAndhearingMaxScore: 18,
      DatabaseHelper.colPCreadingAndhearingMinScore: -20,
      DatabaseHelper.colPCserviceAndmoreServiceMaxScore: 10,
      DatabaseHelper.colPCserviceAndmoreServiceMinScore: 0
    };
    final id = await dbHelper.insertIntoTablePointCard(row);
    _globalFunction.printMsg('Function calledinserted row id: $id');
  }
}

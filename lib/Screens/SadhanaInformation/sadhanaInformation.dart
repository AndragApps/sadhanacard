import 'dart:async';

import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Database/modelClass.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/components/customeDrawerWidget.dart';

import 'package:SadhanaCard_1/constants.dart';

import 'package:flutter/material.dart';

class SadhanaInformation extends StatefulWidget {
  @override
  _SadhanaInformationState createState() => _SadhanaInformationState();
}

class _SadhanaInformationState extends State<SadhanaInformation> {
  static DatabaseHelper db = DatabaseHelper();
  GlobalFunction _globalFunction = GlobalFunction();
  Future<List<Employee>> employees;
  List<Employee> employee;
  bool sort;
  @override
  void initState() {
    super.initState();
    sort = false;
    db = DatabaseHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      employees = db.getEmployees();
    });
  }

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        employee.sort((a, b) => a.sadhanaDate.compareTo(b.sadhanaDate));
      } else {
        employee.sort((a, b) => b.sadhanaDate.compareTo(a.sadhanaDate));
      }
    }
  }

  SingleChildScrollView dataTable({List<Employee> employees}) {
    List<DataRow> rows = [];

    employees.forEach((stat) {
      rows.add(
        DataRow(cells: [
          DataCell(
            Text(stat.id.toString()),
          ),
          DataCell(
            Text(stat.sadhanaDate.toString()),
          ),
          DataCell(
            Text(stat.chantingBefore8.toString()),
          ),
          DataCell(
            Text(stat.chantingBetween8To6.toString()),
          ),
          DataCell(
            Text(stat.chantingAfter6.toString()),
          ),
          DataCell(
            Text(stat.earnedChantingPoints.toString()),
          ),
          DataCell(
            Text(stat.readingMinutes.toString()),
          ),
          DataCell(
            Text(stat.readingHours.toString()),
          ),
          DataCell(
            Text(stat.readingTopic.toString()),
          ),
          DataCell(
            Text(stat.hearingMinutes.toString()),
          ),
          DataCell(
            Text(stat.hearingHours.toString()),
          ),
          DataCell(
            Text(stat.hearingTopic.toString()),
          ),
          DataCell(
            Text(stat.earnedReadingAndHearingPoints.toString()),
          ),
          DataCell(
            Text(stat.serviceMinutes.toString()),
          ),
          DataCell(
            Text(stat.serviceHours.toString()),
          ),
          DataCell(
            Text(stat.serviceTopic.toString()),
          ),
          DataCell(
            Text(stat.moreServiceMinutes.toString()),
          ),
          DataCell(
            Text(stat.moreServiceHours.toString()),
          ),
          DataCell(
            Text(stat.moreServiceTopic.toString()),
          ),
          DataCell(
            Text(stat.earnedServiceAndMoreServicePoints.toString()),
          ),
        ]),
      );
    });
    //Temp Ends
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: kForeColorLightOrange,
        ),
        child: DataTable(
          sortAscending: sort,
          sortColumnIndex: 1,
          columns: [
            DataColumn(
              tooltip: toolTipRecordId,
              label: Text("Id"),
            ),
            DataColumn(
              tooltip: toolTipSadhanaDate,
              numeric: false,
              label: Text("Date"),
              onSort: (columnIndex, sortAscending) {
                setState(() {
                  setState(() {
                    sort = !sort;
                  });
                  onSort(columnIndex, sortAscending);
                });
              },
            ),
            DataColumn(
              tooltip: toolTipChantingBefore8,
              label: Text("C-Before8"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipChantingBetween8to6,
              label: Text("C-Between8To6"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipChantingAfter6,
              label: Text("C-After6"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipEarnedPointsofChanting,
              label: Text("C-EP."),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipReadingMinutes,
              label: Text("R-Minutes"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipReadingHours,
              label: Text("R-Hours"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipReadingBook,
              label: Text("R-Topic"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipHearingMinutes,
              label: Text("H-Minutes"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipHearingHours,
              label: Text("H-Hours"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipHearingTopic,
              label: Text("H-Topic"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipEarnedPointofReadingAndHearing,
              label: Text("R & H EP."),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipServiceMinutes,
              label: Text("S-Minutes"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipServiceHours,
              label: Text("S-Hours"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipServiceName,
              label: Text("S-Name"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipMoreServiceMinutes,
              label: Text("MS-Minutes"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipMoreServiceHours,
              label: Text("MS-Hours"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipMoreServiceName,
              label: Text("MS-Topic"),
              numeric: false,
            ),
            DataColumn(
              tooltip: toolTipEarnedPointofServiceAndMoreService,
              label: Text("S & MS EP."),
              numeric: false,
            ),
          ],
          rows: rows,
        ),
      ),
    );
  }

  list() {
    return (Expanded(
      child: FutureBuilder(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(employees: snapshot.data);
          }
          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text(dataNotDound);
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = (size.height * 0.20);
    double _sizedBoxHeight1 = (size.height * 0.05);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: CustomeDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: kForeColorOrange,
          mini: false,
          clipBehavior: Clip.antiAlias,
          onPressed: () {
            refreshList();
          },
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            Container(
              child: SliverAppBar(
                backgroundColor: kBackgroundColorOrange,
                expandedHeight: _height,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(_height), // Space Above Logo
                  child: Container(
                    height: _height,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          image2,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: _sizedBoxHeight1 * 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              txtSadhanaCard,
                              style: TextStyle(
                                fontFamily: "TrajanProBold",
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    list(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

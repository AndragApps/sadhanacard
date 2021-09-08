import 'dart:async';

import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/Chanting/chantingWidgets.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/Hearing/hearingWidget.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/MoreService/moreServiceWidget.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/Reading/readingWidgets.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/Service/serviceWidget.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/custom_sliver_header.dart';
import 'package:SadhanaCard_1/Screens/components/customeDrawerWidget.dart';
import 'package:SadhanaCard_1/Screens/components/datepicker_Widget.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class   Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _BodyState();

  final changeNotifier = new StreamController.broadcast();
  @override
  void dispose() {
    changeNotifier.close();
    super.dispose();
  }

  static DataModel _dataModel = DataModel();
  final dbHelper = DatabaseHelper.instance;
  GlobalFunction _globalFunction = GlobalFunction();

  @override
  void initState() {
    super.initState();
    _dataModel.colSCsadhanaDate =
        _globalFunction.parseDateForDatabase(DateTime.now());
  }

  final GlobalKey _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    double _itemExtent = 500;
    Size size = MediaQuery.of(context).size;
    double _height = (size.height * 0.20);
    double _sizedBoxHeight1 = (size.height * 0.05);
    Color _barBackgroundColor = Colors.white;
    Color _barFontColor = Colors.orangeAccent;

    //Date Time
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.import_export),
        backgroundColor: kForeColorOrange,
        mini: false,
        clipBehavior: Clip.antiAlias,
        onPressed: () {
          changeNotifier.sink.add(null);
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              // txtDate

                              Container(
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    color: kBackgroundColorOrange,
                                    border: Border.all(color: Colors.black)),
                                child: DatePickerWidget(
                                  onDateChanged: (newDateTime) {
                                    setState(() {
                                      _dataModel.colSCsadhanaDate =
                                          _globalFunction.parseDateForDatabase(
                                              newDateTime);

                                      changeNotifier.sink.add(null);
                                    });
                                  },
                                  isNewDateSelected: (checkDate) {
                                    _dataModel.isNewDateSetect = false;
                                    _dataModel.isNewDateSetect = checkDate;
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
          //CHANTING Widget_Start

          CustomeSliverHeader(
            _barBackgroundColor,
            chantingWidgetBarLable,
            _barFontColor,
            chantingWidgetImage1,
            size,
          ),

          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              [
                ChantingWidget(
                  shouldTriggerChange: changeNotifier.stream,
                  backgroundColor: chantingWidgeLableBackgroundColor,
                  text: chantingWidgetBarLable,
                  textColor: chantingWidgeLableTextColor,
                  receivedDataModel: _dataModel,
                ),
              ],
            ),
            itemExtent: _itemExtent,
          ),
          //CHANTING Widget_End

          //READING Widget_Start
          CustomeSliverHeader(
            _barBackgroundColor,
            readingWidgetBarLable,
            _barFontColor,
            readingWidgetImage2,
            size,
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              [
                ReadingWidget(
                  shouldTriggerChange: changeNotifier.stream,
                  backgroundColor: readingWidgetLableBackgroundColor,
                  text: readingWidgetBarLable,
                  textColor: readingWidgetLableTextColor,
                  receivedDataModel: _dataModel,
                ),
              ],
            ),
            itemExtent: _itemExtent,
          ),
          //READING Widget_End
          //Hearing Widget_Start
          CustomeSliverHeader(
            _barBackgroundColor,
            hearingWidgetBarLable,
            _barFontColor,
            hearingWidgetImage3,
            size,
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              [
                HearingWidget(
                  shouldTriggerChange: changeNotifier.stream,
                  backgroundColor: hearingWidgetLableBackgroundColor,
                  text: hearingWidgetBarLable,
                  textColor: hearingWidgetLableTextColor,
                  receivedDataModel: _dataModel,
                ),
              ],
            ),
            itemExtent: _itemExtent,
          ),
          //LISTENING Widget_End
          //SERVICE Widget_Start
          CustomeSliverHeader(
            _barBackgroundColor,
            serviceWidgetBarLable,
            _barFontColor,
            serviceWidgetImage4,
            size,
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              [
                ServiceWidget(
                  shouldTriggerChange: changeNotifier.stream,
                  backgroundColor: serviceWidgetLableBackgroundColor,
                  text: serviceWidgetBarLable,
                  textColor: serviceWidgetLableTextColor,
                  receivedDataModel: _dataModel,
                ),
              ],
            ),
            itemExtent: _itemExtent,
          ),
          //SERVICE Widget_End
          //More Service Widget_Start
          CustomeSliverHeader(
            _barBackgroundColor,
            moreServiceWidgetBarLable,
            _barFontColor,
            moreServiceWidgetImage5,
            size,
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              [
                MoreServiceWidget(
                  shouldTriggerChange: changeNotifier.stream,
                  backgroundColor: moreServiceWidgetLableBackgroundColor,
                  text: moreServiceWidgetBarLable,
                  textColor: moreServiceWidgetLableTextColor,
                  receivedDataModel: _dataModel,
                ),
              ],
            ),
            itemExtent: _itemExtent,
          ),
          //More Service Widget_End
        ],
      ),
      drawer: CustomeDrawer(),
    );
  }
}

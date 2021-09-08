import 'dart:async';
import 'dart:io';

import 'package:SadhanaCard_1/Database/modelClass.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper();
  static final _databaseName = "DB_SadhanaCard.db";
  static final _databaseVersion = 1;
  GlobalFunction gblFun = GlobalFunction();
  // Database Tables...Start

  List<Map> result;

  // 1-loginCredentials Table....Start Sort Code - LC
  static final tableLoginCredentials = 'loginCredentials';

  // Column Information
  static final colLCid = 'id';
  static final colLCname = 'name';
  static final colLCmobile = 'mobile';
  static final colLCpassword = "password";
  static final colLCregDate = "regDate";
  static final colLCisLogin = "isLogin";
  // loginCredentials Table....End

  // 2-pointCard Table....Start Sort Code - PC
  static final tablePointCard = 'pointCard';

  // Column Information
  static final colPCid = 'id';
  static final colPCentryDate = 'entryDate';

  static final colPCchantingBefore8 = 'chantingBefore8';
  static final colPCchantingBetween8To6 = 'chantingBetween8To6';
  static final colPCchantingAfter6 = 'chantingAfter6';

  static final colPCchantingMaxScore = 'chantingMaxScore';
  static final colPCchantingMinScore = 'chantingMinScore';

  static final colPCreadingAndhearingMaxScore = 'readingAndhearingMaxScore';
  static final colPCreadingAndhearingMinScore = 'readingAndhearingMinScore';

  static final colPCserviceAndmoreServiceMaxScore =
      'serviceAndmoreServiceMaxScore';
  static final colPCserviceAndmoreServiceMinScore =
      'serviceAndmoreServiceMinScore';
  // pointCard Table....End

  // 3-sadhanaCard Table....Start Sort Code - SC
  static final tableSadhanaCard = 'sadhanaCard';

  // Column Information
  static final colSCid = 'id'; //0
  static final colSCsadhanaDate = 'sadhanaDate'; //1
  static final colSCpointCardId = 'pointCardId'; //1
  static final colSCchantingBefore8 = 'chantingBefore8'; //2
  static final colSCchantingBetween8To6 = 'chantingBetween8To6'; //3
  static final colSCchantingAfter6 = 'chantingAfter6'; //4
  static final colSCearnedChantingPoints = 'earnedChantingPoints'; //5
  static final colSCreadingMinutes = 'readingMinutes'; //6
  static final colSCreadingHours = 'readingHours'; //7
  static final colSCreadingTopic = 'readingTopic'; //8
  static final colSChearingMinutes = 'hearingMinutes'; //9
  static final colSChearingHours = 'hearingHours'; //10
  static final colSChearingTopic = 'hearingTopic'; //11
  static final colSCearnedReadingAndHearingPoints =
      'earnedReadingAndHearingPoints'; //12
  static final colSCserviceMinutes = 'serviceMinutes'; //13
  static final colSCserviceHours = 'serviceHours'; //15
  static final colSCserviceTopic = 'serviceTopic'; //16
  static final colSCmoreServiceMinutes = 'moreServiceMinutes'; //17
  static final colSCmoreServiceHours = 'moreServiceHours'; //18
  static final colSCmoreServiceTopic = 'moreServiceTopic'; //19
  static final colSCearnedServiceAndMoreServicePoints =
      'earnedServiceAndMoreServicePoints'; //20
  // loginCredentials Table....End

  // Database Tables...End

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    //1-CREATE loginCredentials TABLE
    batch.execute('''
          CREATE TABLE IF NOT EXISTS $tableLoginCredentials (
            $colLCid INTEGER PRIMARY KEY AUTOINCREMENT,
            $colLCname TEXT NOT NULL,
            $colLCmobile INTEGER NOT NULL,
            $colLCpassword TEXT NOT NULL,
            $colLCregDate INTEGER NOT NULL,
            $colLCisLogin INTEGER NOT NULL
          )
          ''');

    //2-CREATE pointCard TABLE
    batch.execute('''
          CREATE TABLE IF NOT EXISTS $tablePointCard (
            $colPCid INTEGER PRIMARY KEY AUTOINCREMENT,
            $colPCentryDate TEXT NOT NULL,
            $colPCchantingBefore8 INTEGER NOT NULL,
            $colPCchantingBetween8To6 INTEGER NOT NULL,
            $colPCchantingAfter6 INTEGER NOT NULL,
            $colPCchantingMaxScore INTEGER NOT NULL,
            $colPCchantingMinScore INTEGER NOT NULL,
            $colPCreadingAndhearingMaxScore INTEGER NOT NULL,
            $colPCreadingAndhearingMinScore INTEGER NOT NULL,
            $colPCserviceAndmoreServiceMaxScore INTEGER NOT NULL,
            $colPCserviceAndmoreServiceMinScore INTEGER NOT NULL
          )
          ''');

    //3-CREATE sadhanaCard TABLE
    batch.execute('''
          CREATE TABLE IF NOT EXISTS $tableSadhanaCard (
            $colSCid INTEGER PRIMARY KEY AUTOINCREMENT,
            $colSCsadhanaDate TEXT NOT NULL,
            $colSCchantingBefore8 INTEGER NOT NULL,
            $colSCchantingBetween8To6 INTEGER NOT NULL,
            $colSCchantingAfter6 INTEGER NOT NULL,
            $colSCearnedChantingPoints INTEGER NOT NULL,
            $colSCreadingMinutes INTEGER NOT NULL,
            $colSCreadingHours INTEGER NOT NULL,
            $colSCreadingTopic TEXT NOT NULL,
            $colSChearingMinutes INTEGER NOT NULL,
            $colSChearingHours INTEGER NOT NULL,
            $colSChearingTopic TEXT NOT NULL,
            $colSCearnedReadingAndHearingPoints INTEGER NOT NULL,
            $colSCserviceMinutes INTEGER NOT NULL,
            $colSCserviceHours INTEGER NOT NULL,
            $colSCserviceTopic TEXT NOT NULL,
            $colSCmoreServiceMinutes INTEGER NOT NULL,
            $colSCmoreServiceHours INTEGER NOT NULL,
            $colSCmoreServiceTopic TEXT NOT NULL,
            $colSCearnedServiceAndMoreServicePoints INTEGER NOT NULL,
            $colSCpointCardId INTEGER,
            FOREIGN KEY($colSCpointCardId) REFERENCES $tablePointCard($colPCid)
          )
          ''');
    List<dynamic> res = await batch.commit();
    GlobalFunction().printMsg("Database Create Successfully.");
  }

  // Insert Operation...Start

  // Inserts a row into tableLoginCredentials table where each
  // key = column name
  // value = column value.
  Future<int> insertIntoTableLoginCredentials(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableLoginCredentials, row);
  }

  // Inserts a row into tablePointCard table where each
  // key = column name
  // value = column value.
  Future<int> insertIntoTablePointCard(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tablePointCard, row);
  }

  // Inserts a row into tableSadhanaCard table where each
  // key = column name
  // value = column value.
  Future<int> insertIntoTableSadhanaCard(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int rowId = await db.insert(tableSadhanaCard, row);

    String whereString = '${DatabaseHelper.colSCid} = ?';
    List<dynamic> whereArguments = [rowId];
    result = await db.query(DatabaseHelper.tableSadhanaCard,
        where: whereString, whereArgs: whereArguments);

    gblFun.printSeprator();
    gblFun.printMsg(">> From SadhanaCard Table <<");
    gblFun.printSeprator();
    gblFun.printMsg(">> New Recored Information :");
    result.forEach(
        (row) => gblFun.printMsgWithNumber(102, ">> " + row.toString()));
    gblFun.printSeprator();
    return rowId;
  }

  // Insert Operation...End

  // Select Operation...Start

  Future<List<Map<String, dynamic>>>
      queryAllRowsFromTableLoginCredentials() async {
    Database db = await instance.database;
    return await db.query(tableLoginCredentials);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsFromTablePointCard() async {
    Database db = await instance.database;
    result = await db.query(tablePointCard);
    result.forEach(
        (row) => GlobalFunction().printMsgWithNumber(101, row.toString()));
    return result;
  }

  Future<List<Map<String, dynamic>>> queryAllRowsFromTableSadhanaCard() async {
    Database db = await instance.database;
    return await db.query(tableSadhanaCard);
  }

  Future<int> queryGetRowFromTableLoginCredentials(String _userName) async {
    Database db = await instance.database;

    // get single row
    List<String> columnsToSelect = [
      DatabaseHelper.colLCid,
      DatabaseHelper.colLCname,
      DatabaseHelper.colLCmobile,
      DatabaseHelper.colLCpassword,
      DatabaseHelper.colLCisLogin,
      DatabaseHelper.colLCregDate,
    ];
    String whereString = '${DatabaseHelper.colLCname} = ?';
    String userName = _userName;
    List<dynamic> whereArguments = [userName];
    result = await db.query(DatabaseHelper.tableLoginCredentials,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    result.forEach(
        (row) => GlobalFunction().printMsgWithNumber(100, row.toString()));
    int count = result.length;
    return count;
  }

  Future<int> authenticateLoginCredentials(
      {String userName,
      String password,
      String mobileNumber,
      bool isLoginAuthentication = true}) async {
    Database db = await instance.database;

    if (isLoginAuthentication) {
      result = await db.rawQuery("SELECT * FROM " +
          DatabaseHelper.tableLoginCredentials +
          " WHERE " +
          DatabaseHelper.colLCname +
          "='" +
          userName +
          "' AND " +
          DatabaseHelper.colLCpassword +
          "='" +
          password +
          "'");
    } else {
      result = await db.rawQuery("SELECT * FROM " +
          DatabaseHelper.tableLoginCredentials +
          " WHERE " +
          DatabaseHelper.colLCname +
          "='" +
          userName +
          "' AND " +
          DatabaseHelper.colLCmobile +
          "='" +
          mobileNumber +
          "'");
    }

    result.forEach(
        (row) => GlobalFunction().printMsgWithNumber(100, row.toString()));
    int count = result.length;

    return count;
  }

  // To Check Weather the recored exist or not.
  Future<int> isRecoredInsertedForDate({String selectedDate}) async {
    Database db = await instance.database;

    // queryAllRowsFromTablePointCard(); Print all rows from the PointTable
    return Sqflite.firstIntValue(await db.rawQuery(
        "SELECT COUNT(*) FROM $tableSadhanaCard WHERE $colSCsadhanaDate ='$selectedDate'"));
  }

  //Get Recored From Database based on the date.
  Future<List<Map<String, dynamic>>> getRecoredFromSadhanaCard(
      {String date}) async {
    Database db = await instance.database;
    String whereString = '${DatabaseHelper.colSCsadhanaDate} = ?';
    List<dynamic> whereArguments = [date];
    result = await db.query(DatabaseHelper.tableSadhanaCard,
        where: whereString, whereArgs: whereArguments);
    return result;
  }

//Get All Data From the Sadhana Card table.
  Future<List<Employee>> getEmployees() async {
    Database db = await instance.database;
    List<Map> maps = await db.query(tableSadhanaCard);
    List<Employee> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Employee.fromMap(maps[i]));
      }
    }

    return employees;
  }
  // Select Operation...End

  // UPDATE Operation...START

  //FOR tableLoginCredentials

  Future<int> updateTableLoginCredentials(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String _colLCname = row[colLCname];
    return await db.update(tableLoginCredentials, row,
        where: '$colLCname = ?', whereArgs: [_colLCname]);
  }

  //FOR tablePointCard

  Future<int> updateTablePointCard(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[colLCid];
    return await db
        .update(tablePointCard, row, where: '$colPCid = ?', whereArgs: [id]);
  }

  //FOR tableSadhanaCard

  Future<void> updateTableSadhanaCardChanting(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String _colSCsadhanaDate = row[colSCsadhanaDate];

    //Print Row Details.mnb
    await db.update(tableSadhanaCard, row,
        where: '$colSCsadhanaDate = ?', whereArgs: [_colSCsadhanaDate]);

    // get single row
    List<String> colToSelect = [
      DatabaseHelper.colSCid,
      DatabaseHelper.colSCsadhanaDate,
      DatabaseHelper.colSCchantingBefore8,
      DatabaseHelper.colSCchantingBetween8To6,
      DatabaseHelper.colSCchantingAfter6,
      DatabaseHelper.colSCearnedChantingPoints,
    ];

    String whereString = '${DatabaseHelper.colSCsadhanaDate} = ?';
    List<dynamic> whereArguments = [_colSCsadhanaDate];

    gblFun.printSeprator();
    gblFun.printMsg(">> From SadhanaCard Table <<");
    gblFun.printSeprator();
    gblFun.printMsg(">> Before Update :");
    result.forEach((row) =>
        GlobalFunction().printMsgWithNumber(103, ">> " + row.toString()));

    result = await db.query(DatabaseHelper.tableSadhanaCard,
        columns: colToSelect, where: whereString, whereArgs: whereArguments);
    gblFun.printMsg(">> After Update :");
    result.forEach((element) {
      print(
          "\n 103 From DBHelper >>" + element.entries.elementAt(0).toString());
      print(
          "\n 103 From DBHelper >>" + element.entries.elementAt(1).toString());
      print(
          "\n 103 From DBHelper >>" + element.entries.elementAt(2).toString());
      print(
          "\n 103 From DBHelper >>" + element.entries.elementAt(3).toString());
      print(
          "\n 103 From DBHelper >>" + element.entries.elementAt(4).toString());
      print(
          "\n 103 From DBHelper >>" + element.entries.elementAt(5).toString());
    });

    gblFun.printSeprator();
  }

  //FOR tableSadhanaCard uPDATE Reading and Hearing points.
  Future<List<Map<String, dynamic>>> updateTableSadhanaCardReadingAndHearing(
      Map<String, dynamic> row) async {
    Database db = await instance.database;
    String _colSCsadhanaDate = row[colSCsadhanaDate];

    await db.update(tableSadhanaCard, row,
        where: '$colSCsadhanaDate = ?', whereArgs: [_colSCsadhanaDate]);
    // print("colSCsadhanaDate = $_colSCsadhanaDate");

    List<String> columnsToSelect = [
      DatabaseHelper.colSCid,
      DatabaseHelper.colSCsadhanaDate,
      DatabaseHelper.colSCreadingMinutes,
      DatabaseHelper.colSCreadingHours,
      DatabaseHelper.colSCreadingTopic,
      DatabaseHelper.colSCearnedReadingAndHearingPoints,
    ];

    return getSingleRecoredFromSadhanaCardByRowId(
        sadhanaDate: _colSCsadhanaDate, columnsToSelect: columnsToSelect);
  }

  //Get Single Recored of reading from sadhana card.
  Future<List<Map<String, dynamic>>> getSingleRecoredFromSadhanaCardByRowId({
    String sadhanaDate,
    List<String> columnsToSelect,
  }) async {
    Database db = await instance.database;
    List<String> columnsToSelect;
    String whereString = '${DatabaseHelper.colSCsadhanaDate} = ?';
    List<dynamic> whereArguments = [sadhanaDate];

    if (columnsToSelect != null)
      return await db.query(DatabaseHelper.tableSadhanaCard,
          columns: columnsToSelect,
          where: whereString,
          whereArgs: whereArguments);
    else
      return await db.query(DatabaseHelper.tableSadhanaCard,
          where: whereString, whereArgs: whereArguments);
  }

  //FOR tableSadhanaCard
  Future<List<Map<String, dynamic>>>
      updateTableSadhanaCardServiceAndMoreService(
          Map<String, dynamic> row) async {
    Database db = await instance.database;
    String _colSCsadhanaDate = row[colSCsadhanaDate];

    await db.update(tableSadhanaCard, row,
        where: '$colSCsadhanaDate = ?', whereArgs: [_colSCsadhanaDate]);
    // print("colSCsadhanaDate = $_colSCsadhanaDate");

    List<String> columnsToSelect = [
      DatabaseHelper.colSCid,
      DatabaseHelper.colSCsadhanaDate,
      DatabaseHelper.colSCserviceMinutes,
      DatabaseHelper.colSCserviceHours,
      DatabaseHelper.colSCserviceTopic,
      DatabaseHelper.colSCmoreServiceMinutes,
      DatabaseHelper.colSCmoreServiceHours,
      DatabaseHelper.colSCmoreServiceTopic,
      DatabaseHelper.colSCearnedServiceAndMoreServicePoints,
    ];

    return getSingleRecoredFromSadhanaCardByRowId(
        sadhanaDate: _colSCsadhanaDate, columnsToSelect: columnsToSelect);
  }

  // UPDATE Operation...End

//Delete Recored Start
// await deleteDatabase(documentsDirectory.path);
  Future<int> delete() async {
    Database db = await instance.database;
    print("Records deleted successfully.");
    return await db.delete(tableSadhanaCard);
  }
//Delete Recored Ends
}

class DataModel {
  bool isNewDateSetect = true;
//SadhanaCard Table....Start Sort Code - SC
  String colSCid;
  String colSCsadhanaDate;
  String colSCpointCardId;
  String colSCchantingBefore8;
  String colSCchantingBetween8To6;
  String colSCchantingAfter6;
  String colSCearnedChantingPoints;
  String colSCreadingMinutes;
  String colSCreadingHours;
  String colSCreadingTopic;
  String colSChearingMinutes;
  String colSChearingHours;
  String colSChearingTopic;
  String colSCearnedReadingAndHearingPoints;
  String colSCserviceMinutes;
  String colSCserviceHours;
  String colSCserviceTopic;
  String colSCmoreServiceMinutes;
  String colSCmoreServiceHours;
  String colSCmoreServiceTopic;
  String colSCearnedServiceAndMoreServicePoints;
  //SadhanaCard Table....End
}

class LoginCredentialsColumnNames {
  String colLCid = 'id';
  String colLCname = 'name';
  String colLCmobile = 'mobile';
  String colLCpassword = "password";
  String colLCregDate = "regDate";
  String colLCisLogin = "isLogin";
}

class PointCardColumnNames {
  String colPCid = 'id';
  String colPCentryDate = 'entryDate';

  String colPCchantingBefore8 = 'chantingBefore8';
  String colPCchantingBetween8To6 = 'chantingBetween8To6';
  String colPCchantingAfter6 = 'chantingAfter6';

  String colPCchantingMaxScore = 'chantingMaxScore';
  String colPCchantingMinScore = 'chantingMinScore';

  String colPCreadingAndhearingMaxScore = 'readingAndhearingMaxScore';
  String colPCreadingAndhearingMinScore = 'readingAndhearingMinScore';

  String colPCserviceAndmoreServiceMaxScore = 'serviceAndmoreServiceMaxScore';
  String colPCserviceAndmoreServiceMinScore = 'serviceAndmoreServiceMinScore';
}

class SadhanaCardColumnNames {
  String colSCid = 'id';
  String colSCsadhanaDate = 'sadhanaDate';
  String colSCpointCardId = 'pointCardId';
  String colSCchantingBefore8 = 'chantingBefore8';
  String colSCchantingBetween8To6 = 'chantingBetween8To6';
  String colSCchantingAfter6 = 'chantingAfter6';
  String colSCearnedChantingPoints = 'earnedChantingPoints';
  String colSCreadingMinutes = 'readingMinutes';
  String colSCreadingHours = 'readingHours';
  String colSCreadingTopic = 'readingTopic';
  String colSChearingMinutes = 'hearingMinutes';
  String colSChearingHours = 'hearingHours';
  String colSChearingTopic = 'hearingTopic';
  String colSCearnedReadingAndHearingPoints = 'earnedReadingAndHearingPoints';
  String colSCserviceMinutes = 'serviceMinutes';
  String colSCserviceHours = 'serviceHours';
  String colSCserviceTopic = 'serviceTopic';
  String colSCmoreServiceMinutes = 'moreServiceMinutes';
  String colSCmoreServiceHours = 'moreServiceHours';
  String colSCmoreServiceTopic = 'moreServiceTopic';
  String colSCearnedServiceAndMoreServicePoints =
      'earnedServiceAndMoreServicePoints';
}

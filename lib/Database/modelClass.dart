class Employee {
  int id; //
  String sadhanaDate; //
  int pointCardId; //
  int chantingBefore8; //
  int chantingBetween8To6; //
  int chantingAfter6; //
  var earnedChantingPoints; //
  int readingMinutes; //
  int readingHours; //
  String readingTopic; //
  int hearingMinutes; //
  int hearingHours; //
  String hearingTopic; //
  var earnedReadingAndHearingPoints; //
  int serviceMinutes; //
  int serviceHours; //
  String serviceTopic; //
  int moreServiceMinutes; //
  int moreServiceHours; //
  String moreServiceTopic; //
  var earnedServiceAndMoreServicePoints; //
  Employee(
    this.id,
    this.sadhanaDate,
    this.pointCardId,
    this.chantingBefore8,
    this.chantingBetween8To6,
    this.chantingAfter6,
    this.earnedChantingPoints,
    this.readingMinutes,
    this.readingHours,
    this.readingTopic,
    this.hearingMinutes,
    this.hearingHours,
    this.hearingTopic,
    this.earnedReadingAndHearingPoints,
    this.serviceMinutes,
    this.serviceHours,
    this.serviceTopic,
    this.moreServiceMinutes,
    this.moreServiceHours,
    this.moreServiceTopic,
    this.earnedServiceAndMoreServicePoints,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "sadhanaDate": sadhanaDate,
      "chantingBefore8": chantingBefore8,
      "chantingBetween8To6": chantingBetween8To6,
      "chantingAfter6": chantingAfter6,
      "earnedChantingPoints": earnedChantingPoints,
      "readingMinutes": readingMinutes,
      "readingHours": readingHours,
      "readingTopic": readingTopic,
      "hearingMinutes": hearingMinutes,
      "hearingHours": hearingHours,
      "hearingTopic": hearingTopic,
      "earnedReadingAndHearingPoints": earnedReadingAndHearingPoints,
      "serviceMinutes": serviceMinutes,
      "serviceHours": serviceHours,
      "serviceTopic": serviceTopic,
      "moreServiceMinutes": moreServiceMinutes,
      "moreServiceHours": moreServiceHours,
      "moreServiceTopic": moreServiceTopic,
      "earnedServiceAndMoreServicePoints": earnedServiceAndMoreServicePoints,
    };
    return map;
  }

  Employee.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    sadhanaDate = map["sadhanaDate"];
    chantingBefore8 = map["chantingBefore8"];
    chantingBetween8To6 = map["chantingBetween8To6"];
    chantingAfter6 = map["chantingAfter6"];
    earnedChantingPoints = map["earnedChantingPoints"];
    readingMinutes = map["readingMinutes"];
    readingHours = map["readingHours"];
    readingTopic = map["readingTopic"];
    hearingMinutes = map["hearingMinutes"];
    hearingHours = map["hearingHours"];
    hearingTopic = map["hearingTopic"];
    earnedReadingAndHearingPoints = map["earnedReadingAndHearingPoints"];
    serviceMinutes = map["serviceMinutes"];
    serviceHours = map["serviceHours"];
    serviceTopic = map["serviceTopic"];
    moreServiceMinutes = map["moreServiceMinutes"];
    moreServiceHours = map["moreServiceHours"];
    moreServiceTopic = map["moreServiceTopic"];
    earnedServiceAndMoreServicePoints =
        map["earnedServiceAndMoreServicePoints"];
  }
}

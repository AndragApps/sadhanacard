import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//FOR DEVELOPER USE. IF THEY WANT TO REDIRECT DIRECT DASHBOARD AFTER LOGIN SCREEN SET IT 'TRUE'.
const direcLogin = false;
// COLORS VALUES
const kBackgroundColorWhite = Color.fromRGBO(255, 255, 255, 1);
const kBackgroundColorOrange = Color.fromRGBO(249, 117, 7, 1);
const kProgressIndicatorColor = Color.fromRGBO(249, 117, 7, 1);
const kForeColorWhite = Colors.white;
const kForeColorOrange = Color.fromRGBO(249, 117, 7, 1);
const kForeColorLightOrange = Color.fromRGBO(254, 222, 197, 1);
const kButtonBackgroundColor = Color.fromRGBO(249, 117, 7, 1);
const kRegisterButtonBackgroundColor = Color.fromRGBO(254, 222, 197, 1); //USED

// --------------------
// Global Color for COLORS
// --------------------
const kGblHintColor = Color.fromRGBO(249, 117, 7, 1);
const kGblIconColor = Color.fromRGBO(249, 117, 7, 1);
const kGblTextColor = Color.fromRGBO(249, 117, 7, 1);
// --------------------
// // Global String for Image Path....
// TO ADD NEW IMAGE IN THE APPLICATION FOLLOW THE STEPS.
// 1-OPEN pubspec.yaml file.
// 2-UNDER assets: YOU CAN FIND IMAGES FOLDER WHERE NEW IMAGES HAVE TO ADD.
//                 CAN CREATE FOLDER AS WELL. BUT MUST BE INSIDE THE assets/images/.
// 3-DEFINE THE PATH.
// --------------------
const image1 = "assets/images/xd/4_launchScreen/LaunchPage.png";
const image2 = "assets/images/JOSD_Logo.png";
const image3 = "assets/images/xd/4_launchScreen/LaunchPage.png";
const image4 = "assets/images/xd/picture1LeftSide.png";
const image5 = "assets/images/xd/4_launchScreen/Rectangle 3.png";
const image6 = "assets/images/Logo_1_Black2.png"; //LOGO OF THE ISCKON MANDIR PART-1
const image7 = "assets/images/Logo_2.png"; //LOGO OF THE ISCKON MANDIR PART-2

// --------------------
// // Global Variable for Image Path for SlideShow....
// --------------------
// To Add Image in the SlideShow on login page you need to put image in the
// Can Create folder as here is prabhuPicture inside all image are there.
// Once you add image to the folder developer can write pather as below.
const slideShowImage1 = "assets/images/prabhuPicture/picture-5.jpg";
const slideShowImage2 = "assets/images/prabhuPicture/picture-2.jpg";
const slideShowImage3 = "assets/images/prabhuPicture/picture-6.jfif";
const slideShowImage4 = "assets/images/prabhuPicture/picture-7.jfif";
const slideShowImage5 = "assets/images/prabhuPicture/picture-1.jfif";

// --------------------
// Global Variable
// --------------------
//Button, Lable Text
String lableDontHaveAnAccount = "Don't have an Account ? ";
String lableAlreadyHaveAnAccount = "Already have an Account ? ";
String lableForgotPassword = "Forgot password? ";
String lableResetHere = "Reset here!";
String lableHours = "Hours";
String lableMinutes = "Minutes";
String lableMin = "Min.";
String lableHour = "Hour";
String lableService = "Service";
String lableHearing = "Hearing";
String lableBook = "Book";
String lableRounds = "Rounds";
String lableFrom00To08 = "00:01 AM to 08:00 AM";
String lableFrom08To06 = "08:00 AM to 06:00 PM";
String lableFrom06To00 = "06:00 PM to 11:59 PM";
String lableEarnedPoints = "Earned Points";
String txtSignIn = "Sign In";
String txtSignUp = "Sign Up";
String txtSignOut = 'Sign Out';
String txtSignUpPageTitle = "New Member";
String txtResetPassword = "Reset Password";
String txtNext = "Next";
String txtSadhanaCard = "Sadhana Card";
String txtUpdate = "Update";
String txtConfigurePassword = "Configure Password";
String txtServiceAndMoreServiceEP = "Service & MoreService EP.";
String txtReadingAndHearingEP = "Reading & Hearing EP.";
String txtPointsavailableinHearing = "Points available in Hearing.";
String txtPointsavailableinMoreService = "Points available in More Service.";

//Drawer Button, Lable Text
String item1Name = "Sadhana Card";
String item2Name = "Data";
String item3Name = "Chart";
String item4Name = "Delete Sadhana Card Data";

// Hint Text Lables,
String txtEnterHere = "Enter here";
String txtHintTextforName = "Name";
String txtHintTextforMobileNumber = "Mobile Number";
String txtHintTextforConfirmPassword = "Confirm Password";
String txtHintPassword = "Password";

// Error Messages,
String passwordNotMatch =
    "Confirm Password not matching.\nRe-enter and try again.";
String emptyConfirmPassword = "Please Enter Confirm Password.";
String emptyEnterPassword = "Please Enter Password.";
String emptyEnterMobileNumber = "Please Enter Mobile Number.";
String emptyEnterNewZealandMobileNumber = "Please Enter New Zealand Mobile Number.";
String emptyEnterName = "Please Enter Name.";
String invalidUserOrPassword = "Invalid User or Password Entered.";
String userNotFound = "user not found.";
String dataNotDound = "No Data Found.";

// ToolTip
String toolTipRecordId = "Record Id.";
String toolTipSadhanaDate = "Sadhana Date";
String toolTipChantingBefore8 = "Chanting Before 8.00";
String toolTipChantingBetween8to6 = "Chanting Between 8.00 to 6.00";
String toolTipChantingAfter6 = "Chanting After 6.00";
String toolTipEarnedPointsofChanting = "Earned Points of Chanting";
String toolTipReadingMinutes = "Reading Minutes";
String toolTipReadingHours = "Reading Hours";
String toolTipReadingBook = "Reading Book";
String toolTipHearingMinutes = "Hearing Minutes";
String toolTipHearingHours = "Hearing Hours";
String toolTipHearingTopic = "Hearing Topic";
String toolTipEarnedPointofReadingAndHearing =
    "Earned Point of Reading And Hearing.";
String toolTipServiceMinutes = "Service Minutes";
String toolTipServiceHours = "Service Hours";
String toolTipServiceName = "Service Name";
String toolTipMoreServiceMinutes = "More Service Minutes";
String toolTipMoreServiceHours = "More Service Hours";
String toolTipMoreServiceName = "More Service Name";
String toolTipEarnedPointofServiceAndMoreService =
    "Earned Point of Service And More Service.";

//message
String lableUpcomingfeature = "Upcoming feature.";
String lableDatabaseDeletedSuccessfully = "Database deleted successfully.";
String lableUpdateSadhanaCard = "Update : Sadhana Card";
String lableUpdateNewSadhanaCard = "New : Sadhana Card";
//Widget Lable
String chantingWidgetBarLable = "CHANTING";
String readingWidgetBarLable = "READING";
String hearingWidgetBarLable = "HEARING";
String serviceWidgetBarLable = "SERVICE";
String moreServiceWidgetBarLable = "MORE SERVICE";

// --------------------
// // Global Variable for Image Path for WIDGET ICON....
// --------------------
const chantingWidgetImage1 = "assets/images/gif/chanting/chanting-1.gif";
const readingWidgetImage2 = "assets/images/gif/reading/reading-4.gif";
const hearingWidgetImage3 = "assets/images/gif/hearing/listening-2.gif";
const serviceWidgetImage4 = "assets/images/gif/service/Service-3.gif";
const moreServiceWidgetImage5 = "assets/images/gif/service/Service-1.gif";

// --------------------
// // Global Variable for WIDGET Lable backgroundColor....
// --------------------

Color chantingWidgeLableBackgroundColor = Colors.white;
Color readingWidgetLableBackgroundColor = Colors.white;
Color hearingWidgetLableBackgroundColor = Colors.white;
Color serviceWidgetLableBackgroundColor = Colors.white;
Color moreServiceWidgetLableBackgroundColor = Colors.white;
// --------------------
// // Global Variable for WIDGET Lable textColor....
// --------------------

Color chantingWidgeLableTextColor = Colors.black;
Color readingWidgetLableTextColor = Colors.black;
Color hearingWidgetLableTextColor = Colors.black;
Color serviceWidgetLableTextColor = Colors.black;
Color moreServiceWidgetLableTextColor = Colors.black;
// --------------------
// Global Dynamic Variable
// --------------------

// FOR SET LOGINED USER.
String loggedInUser = "";
String kGblFontFamily = "empty";
// TIMER VALUE
const kLaunchScreenTimerSeconds = 3;

// --------------------

// --------------------
// Global Settings for SIZES
// --------------------
const kGblButtonWidth = 0.8;
double kGblTextWidth = 0.8;
// --------------------

//get the Registered User
String get getloginUser {
  return loggedInUser;
}

//Set the register user.
set setloginUser(String userName) {
  loggedInUser = userName;
}

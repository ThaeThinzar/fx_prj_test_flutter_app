import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:intl/intl.dart';

class ScreenURLPath {
  static const String TUTORIAL_WALKTTHROUGH = '/turorial_walkthrough';
  static const String LOGIN = '/login';
  static const String HELP_PAGE = '/home_navigation';
  static const String TOP_PAGE = '/home';
  static const String SHARE_SNS = '/share_sns';
  static const String TAB = '/tab';
  static const String MY_PAGE = '/my_page';
  static const String MAGNIFINE = '/magnifine';
  static const String SLIDEUPLIBRARY = '/slide_up_libray';
  static const String BOTTOM_DRAWER = '/bottom_drawer';
  static const String SLIABLELIST = '/sliable';
  static const String SLIABLE_BUTTON = '/sliable_button';
  static const String RATING_PAGE = '/rating_screen';
  static const String HISTORYTRADING = '/history_trading_view';
  static const String HISTORY_OF_DEMON_LIST = '/history_demonstration_view';
  static const String HISTORY_OF_DEMON_LATER = '/history_demonstration_later';
  static const String FORCE_UPDATE = '/notification_to_update';
}
class Constants {

  static String changeDateFormat(DateTime dateTime,String format){
    DateFormat dateFormat = new  DateFormat(format);
    String date = dateFormat.format(dateTime);
    return date;
  }
  static DateTime convertDateFromString(String strDate){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime todayDate = dateFormat.parse(strDate);
    print(todayDate);
   return todayDate;
  }
}
class DateTimeFormat{
  static const String CALENDAR_FORMAT = 'yyyy-MMM-dd on EEEE';
  static const String YMD_FORMAT = 'yyyy/MMM/dd';
}
const TOP_DATA =[
  {
    "play_style":"プレイ調み",
    "event_note":"#リーマンショック¥ドルリーマンショックをもう一度イベント1",
    "event_title":"リーマンショック¥ドルリーマンショックをもう一度イベント1",
    "event_time":"イベント時間 2020/01/04 20:30",
    "image": 'view1.jpg'
  },
  {
    "play_style":"プレイ調み",
    "event_note":"#リーマンショック¥ドルリーマンショックをもう一度イベント2",
    "event_title":"リーマンショック¥ドルリーマンショックをもう一度イベント2",
    "event_time":"イベント時間 2020/01/04 20:30",
    "image": 'view2.jpg'
  },
  {
    "play_style":"プレイ調み",
    "event_note":"#リーマンショック¥ドルリーマンショックをもう一度イベント3",
    "event_title":"リーマンショック¥ドルリーマンショックをもう一度イベント4",
    "event_time":"イベント時間 2020/01/04 20:30",
    "image": 'view3.jpg'
  },
  {
    "play_style":"プレイ調み",
    "event_note":"#リーマンショック¥ドルリーマンショックをもう一度イベント",
    "event_title":"リーマンショック¥ドルリーマンショックをもう一度イベント",
    "event_time":"イベント時間 2020/01/04 20:30",
    "image": 'view4.jpg'
  },
  {
    "play_style":"プレイ調み",
    "event_note":"#リーマンショック¥ドルリーマンショックをもう一度イベント",
    "event_title":"リーマンショック¥ドルリーマンショックをもう一度イベント",
    "event_time":"イベント時間 2020/01/04 20:30",
    "image": 'view5.jpg'
  },
];

class Data{
final  List<TopData> topDataList = [
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック1",
        eventTitle: "リーマンショックをもう一もう一度体験!",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'view5.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "##リーマンショック2",
        eventTitle: "リーマンショックをもう一もう一度体験!",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'view5.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック3",
        eventTitle: "リーマンショックをもう一もう一度体験!",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'view5.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック4",
        eventTitle: "リーマンショックをもう一もう一度体験!",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'view5.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック5",
        eventTitle: "リーマンショックをもう一もう一度体験!5",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'view5.jpg'),

  ];
}
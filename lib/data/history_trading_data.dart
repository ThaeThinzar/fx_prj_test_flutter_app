import 'Constants.dart';

class HistoryTradingData{
  String title;
  DateTime date;
  int pointLostData;


  HistoryTradingData({this.title, this.date, this.pointLostData});
  static List<HistoryTradingData> getHistoryTradingDataList(){
    final  List<HistoryTradingData> tradingList = [
      HistoryTradingData(
          title: "History of Trading 1",date:Constants.convertDateFromString("2019-08-19 8:40:23"), pointLostData: 112),
      HistoryTradingData(
          title: "History of Trading 2", date:Constants.convertDateFromString("2019-05-19 8:40:23"), pointLostData: 30),
      HistoryTradingData(
          title: "History of Trading 3",date:Constants.convertDateFromString("2020-10-25 8:40:23"), pointLostData: 98),
      HistoryTradingData(
          title: "History of Trading 4", date:Constants.convertDateFromString("2019-02-19 8:40:23"), pointLostData: 21),
      HistoryTradingData(
          title: "History of Trading 5" ,date:Constants.convertDateFromString("2020-02-19 8:40:23"), pointLostData: 65 ),
      HistoryTradingData(
          title: "History of Trading 6",date:Constants.convertDateFromString("2020-05-19 8:40:23"), pointLostData: 121),
      HistoryTradingData(
          title: "History of Trading 7", date:Constants.convertDateFromString("2020-07-20 8:40:23"), pointLostData: 283),
      HistoryTradingData(
          title: "History of Trading 8", date:Constants.convertDateFromString("2020-06-19 8:40:23"), pointLostData: 145),
      HistoryTradingData(
          title: "History of Trading 9",date:Constants.convertDateFromString("2019-07-16 8:40:23"), pointLostData: 56),
      HistoryTradingData(
          title: "History of Trading 10",date:Constants.convertDateFromString("2019-07-25 8:40:23"), pointLostData: 66),
      HistoryTradingData(
          title: "History of Trading 11", date:Constants.convertDateFromString("2020-07-20 8:40:23"), pointLostData: 8),
      HistoryTradingData(
          title: "History of Trading 12", date:Constants.convertDateFromString("2020-06-19 8:40:23"), pointLostData: 145),
      HistoryTradingData(
          title: "History of Trading 13",date:Constants.convertDateFromString("2020-10-27 8:40:23"), pointLostData: 113),
      HistoryTradingData(
          title: "History of Trading 14",date:Constants.convertDateFromString("2019-01-25 8:40:23"), pointLostData: 88),
    ];
    return tradingList;
  }

}
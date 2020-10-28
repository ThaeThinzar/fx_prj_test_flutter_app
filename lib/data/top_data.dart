class TopData{
  String playStyle;
  String eventNote;
  String eventTitle;
  String eventTime;
  String imgUrl;

  TopData({this.playStyle, this.eventNote, this.eventTitle, this.eventTime, this.imgUrl});

 static List<TopData> getTopDataList(){
    final  List<TopData> topDataList = [
      TopData(
          playStyle: "プレイ調み",
          eventNote: "#リーマンショック ¥ドルリ1",
          eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント1",
          eventTime: "イベント時間 2020/01/04 20:30",
          imgUrl: 'assets/images/view1.jpg'),
      TopData(
          playStyle: "プレイ調み",
          eventNote: "#リーマンショック¥ # 調み",
          eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント2",
          eventTime: "イベント時間 2020/01/04 20:30",
          imgUrl: 'assets/images/view2.jpg'),
      TopData(
          playStyle: "プレイ調み",
          eventNote: "#リーマンショック¥ドルリ",
          eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント3",
          eventTime: "イベント時間 2020/01/04 20:30",
          imgUrl: 'assets/images/view3.jpg'),
      TopData(
          playStyle: "プレイ調み",
          eventNote: "#リーマンショック¥ドルリーマンショックをもう一度イベント4",
          eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント4",
          eventTime: "イベント時間 2020/01/04 20:30",
          imgUrl: 'assets/images/view4.jpg'),
      TopData(
          playStyle: "プレイ調み",
          eventNote: "#リーマンショック¥ドルリーマンショックをもう一度イベント5",
          eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント5",
          eventTime: "イベント時間 2020/01/04 20:30",
          imgUrl: 'assets/images/view5.jpg'),

    ];
    return topDataList;
  }
}
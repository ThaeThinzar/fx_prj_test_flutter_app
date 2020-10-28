class CurrencyData{
  String countryCode;
  double exchangeRate;


  CurrencyData({this.countryCode,  this.exchangeRate});

  static List<CurrencyData> getCurrencyList(){
    final  List<CurrencyData> currencyList = [
      CurrencyData(countryCode: "USD", exchangeRate: 1288),
      CurrencyData(countryCode: "JPY", exchangeRate: 12),
      CurrencyData(countryCode: "KRW", exchangeRate:  113.94),
      CurrencyData(countryCode: "THB", exchangeRate:  41.14),
      CurrencyData(countryCode: "SGD", exchangeRate:   946.8),
    ];
    return currencyList;
  }

}
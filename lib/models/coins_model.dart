class Coins_Model {
  int? id;
  String? symbol;
  String? name;
  String? persianName;
  double? exfee;
  double? glfee;
  bool? active;
  bool? buy;
  bool? sell;
  bool? limit;
  bool? stoploss;
  bool? withdraw;
  bool? deposit;
  bool? transfer;
  int? decimalPlaceIrt;
  int? decimalPlaceUsdt;
  int? decimalPlaceAmount;
  int? decimalPlaceStep;
  String? miniChartId;
  int? rank;
  int? exchange;
  double? usdtPrice;
  double? buyPrice;
  double? sellPrice;
  double? priceChange24h;
  double? precentChange24h;
  double? marketVolume;
  double? marketQuoteVolume;

  Coins_Model(
      {this.id,
      this.symbol,
      this.name,
      this.persianName,
      this.exfee,
      this.glfee,
      this.active,
      this.buy,
      this.sell,
      this.limit,
      this.stoploss,
      this.withdraw,
      this.deposit,
      this.transfer,
      this.decimalPlaceIrt,
      this.decimalPlaceUsdt,
      this.decimalPlaceAmount,
      this.decimalPlaceStep,
      this.miniChartId,
      this.rank,
      this.exchange,
      this.usdtPrice,
      this.buyPrice,
      this.sellPrice,
      this.priceChange24h,
      this.precentChange24h,
      this.marketVolume,
      this.marketQuoteVolume});

  Coins_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    persianName = json['persian_name'];
    exfee = json['exfee'];
    glfee = json['glfee'];
    active = json['active'];
    buy = json['buy'];
    sell = json['sell'];
    limit = json['limit'];
    stoploss = json['stoploss'];
    withdraw = json['withdraw'];
    deposit = json['deposit'];
    transfer = json['transfer'];
    decimalPlaceIrt = json['decimal_place_irt'];
    decimalPlaceUsdt = json['decimal_place_usdt'];
    decimalPlaceAmount = json['decimal_place_amount'];
    decimalPlaceStep = json['decimal_place_step'];
    miniChartId = json['mini_chart_id'];
    rank = json['rank'];
    exchange = json['exchange'];
    usdtPrice = json['usdt_price'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    priceChange24h = json['price_change_24h'];
    precentChange24h = json['precent_change_24h'];
    marketVolume = json['market_volume'];
    marketQuoteVolume = json['market_quote_volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['persian_name'] = this.persianName;
    data['exfee'] = this.exfee;
    data['glfee'] = this.glfee;
    data['active'] = this.active;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['limit'] = this.limit;
    data['stoploss'] = this.stoploss;
    data['withdraw'] = this.withdraw;
    data['deposit'] = this.deposit;
    data['transfer'] = this.transfer;
    data['decimal_place_irt'] = this.decimalPlaceIrt;
    data['decimal_place_usdt'] = this.decimalPlaceUsdt;
    data['decimal_place_amount'] = this.decimalPlaceAmount;
    data['decimal_place_step'] = this.decimalPlaceStep;
    data['mini_chart_id'] = this.miniChartId;
    data['rank'] = this.rank;
    data['exchange'] = this.exchange;
    data['usdt_price'] = this.usdtPrice;
    data['buy_price'] = this.buyPrice;
    data['sell_price'] = this.sellPrice;
    data['price_change_24h'] = this.priceChange24h;
    data['precent_change_24h'] = this.precentChange24h;
    data['market_volume'] = this.marketVolume;
    data['market_quote_volume'] = this.marketQuoteVolume;
    return data;
  }
}

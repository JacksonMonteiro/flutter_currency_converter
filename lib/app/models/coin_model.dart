class CoinModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CoinModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  static List<CoinModel> getCurrencies() {
    return <CoinModel>[
      CoinModel(
          name: 'Real', real: 1.0, dolar: 0.21, euro: 0.2, bitcoin: 0.0000055),
      CoinModel(
          name: 'Dólar', real: 4.7, dolar: 1.0, euro: 0.93, bitcoin: 0.000026),
      CoinModel(
          name: 'Euro', real: 5.08, dolar: 1.08, euro: 1.0, bitcoin: 0.000028),
      CoinModel(
          name: 'Bitcoin',
          real: 183550.86,
          dolar: 39051.5,
          euro: 36125.37,
          bitcoin: 1.0),
    ];
  }
}

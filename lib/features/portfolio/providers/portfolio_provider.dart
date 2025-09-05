import 'package:flutter/material.dart';

class PortfolioProvider extends ChangeNotifier {
  double _totalValue = 0.0;
  double _totalGain = 0.0;
  double _totalGainPercentage = 0.0;
  List<Map<String, dynamic>> _holdings = [];

  double get totalValue => _totalValue;
  double get totalGain => _totalGain;
  double get totalGainPercentage => _totalGainPercentage;
  List<Map<String, dynamic>> get holdings => _holdings;

  void updatePortfolio({
    double? totalValue,
    double? totalGain,
    double? totalGainPercentage,
    List<Map<String, dynamic>>? holdings,
  }) {
    if (totalValue != null) _totalValue = totalValue;
    if (totalGain != null) _totalGain = totalGain;
    if (totalGainPercentage != null) _totalGainPercentage = totalGainPercentage;
    if (holdings != null) _holdings = holdings;

    notifyListeners();
  }

  void addHolding(Map<String, dynamic> holding) {
    _holdings.add(holding);
    notifyListeners();
  }

  void removeHolding(String symbol) {
    _holdings.removeWhere((holding) => holding['symbol'] == symbol);
    notifyListeners();
  }
}

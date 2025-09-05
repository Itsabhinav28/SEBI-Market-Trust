import 'package:flutter/material.dart';

class MarketProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _marketNews = [];
  List<Map<String, dynamic>> _topGainers = [];
  List<Map<String, dynamic>> _topLosers = [];
  Map<String, dynamic> _marketIndices = {};

  List<Map<String, dynamic>> get marketNews => _marketNews;
  List<Map<String, dynamic>> get topGainers => _topGainers;
  List<Map<String, dynamic>> get topLosers => _topLosers;
  Map<String, dynamic> get marketIndices => _marketIndices;

  void updateMarketNews(List<Map<String, dynamic>> news) {
    _marketNews = news;
    notifyListeners();
  }

  void updateTopGainers(List<Map<String, dynamic>> gainers) {
    _topGainers = gainers;
    notifyListeners();
  }

  void updateTopLosers(List<Map<String, dynamic>> losers) {
    _topLosers = losers;
    notifyListeners();
  }

  void updateMarketIndices(Map<String, dynamic> indices) {
    _marketIndices = indices;
    notifyListeners();
  }
}


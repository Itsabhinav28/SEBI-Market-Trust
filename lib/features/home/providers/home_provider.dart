import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _currentTabIndex = 0;
  List<Map<String, dynamic>> _recentActivities = [];
  Map<String, dynamic> _quickStats = {};

  int get currentTabIndex => _currentTabIndex;
  List<Map<String, dynamic>> get recentActivities => _recentActivities;
  Map<String, dynamic> get quickStats => _quickStats;

  void setCurrentTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void updateRecentActivities(List<Map<String, dynamic>> activities) {
    _recentActivities = activities;
    notifyListeners();
  }

  void updateQuickStats(Map<String, dynamic> stats) {
    _quickStats = stats;
    notifyListeners();
  }
}


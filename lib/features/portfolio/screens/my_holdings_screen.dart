import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/responsive_wrapper.dart';

class MyHoldingsScreen extends StatelessWidget {
  const MyHoldingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsiveWrapper(
      child: Scaffold(
        backgroundColor: AppTheme.lightBackground,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: const Text('My Holdings'),
          backgroundColor: AppTheme.lightSurface,
          foregroundColor: AppTheme.lightOnSurface,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                // TODO: Navigate to view all holdings
              },
              child: Text(
                'View All',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: AppConstants.defaultPadding),
          ],
        ),
        body: Column(
          children: [
            // Enhanced Header Section with Portfolio Summary
            Container(
              margin: const EdgeInsets.all(AppConstants.defaultPadding),
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF667eea).withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.pie_chart,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: AppConstants.defaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Holdings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Total Value: ₹2,45,670',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '+12.5%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  // Mini Portfolio Chart
                  SizedBox(
                    height: 80,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 20,
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xFF4CAF50),
                            value: 35,
                            title: '35%',
                            radius: 25,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF2196F3),
                            value: 30,
                            title: '30%',
                            radius: 25,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF9C27B0),
                            value: 20,
                            title: '20%',
                            radius: 25,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            color: const Color(0xFFFF9800),
                            value: 15,
                            title: '15%',
                            radius: 25,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Enhanced Holdings List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                children: [
                  _buildEnhancedHoldingCard(
                    context,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4CAF50), Color(0xFF8BC34A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    fundIcon: 'HDFC',
                    fundName: 'HDFC Top 100 Fund',
                    category: 'Equity • Large Cap',
                    units: '1,245.67',
                    currentValue: '₹85,670',
                    performance: '+15.2% (+₹11,340)',
                    nav: '₹68.78',
                    sparklineData: [
                      1.0,
                      1.1,
                      0.9,
                      1.2,
                      1.0,
                      1.3,
                      1.1,
                      1.2,
                      1.4,
                      1.1,
                      1.3,
                      1.2
                    ],
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  _buildEnhancedHoldingCard(
                    context,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2196F3), Color(0xFF03DAC6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    fundIcon: 'SBI',
                    fundName: 'SBI Bluechip Fund',
                    category: 'Equity • Large Cap',
                    units: '1,456.23',
                    currentValue: '₹72,450',
                    performance: '+13.8% (+₹8,790)',
                    nav: '₹49.75',
                    sparklineData: [
                      1.0,
                      1.0,
                      1.1,
                      0.9,
                      1.2,
                      1.0,
                      1.1,
                      1.3,
                      1.0,
                      1.2,
                      1.1,
                      1.2
                    ],
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  _buildEnhancedHoldingCard(
                    context,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9C27B0), Color(0xFFE91E63)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    fundIcon: 'ICICI',
                    fundName: 'ICICI Prudential Balanced',
                    category: 'Hybrid • Aggressive',
                    units: '1,678.90',
                    currentValue: '₹55,230',
                    performance: '+9.5% (+₹4,780)',
                    nav: '₹32.89',
                    sparklineData: [
                      1.0,
                      0.9,
                      1.0,
                      1.1,
                      0.8,
                      1.0,
                      1.1,
                      0.9,
                      1.0,
                      1.1,
                      1.0,
                      1.1
                    ],
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  _buildEnhancedHoldingCard(
                    context,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    fundIcon: 'NIPPON',
                    fundName: 'Nippon Gold ETF',
                    category: 'Gold • Commodity',
                    units: '678.45',
                    currentValue: '₹32,320',
                    performance: '+8.2% (+₹2,450)',
                    nav: '₹47.65',
                    sparklineData: [
                      1.0,
                      1.0,
                      0.9,
                      1.0,
                      1.1,
                      0.9,
                      1.0,
                      1.1,
                      0.9,
                      1.0,
                      1.1,
                      1.0
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoldingCard(
    BuildContext context, {
    required String fundIcon,
    required Color fundIconColor,
    required String fundName,
    required String category,
    required String units,
    required String currentValue,
    required String performance,
    required String nav,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: fundIconColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            fundIcon,
                            style: TextStyle(
                              color: fundIconColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.smallPadding),
                      Expanded(
                        child: Text(
                          fundName,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    category,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    'Units: $units',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    currentValue,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    performance,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    'NAV: $nav',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedHoldingCard(
    BuildContext context, {
    required LinearGradient gradient,
    required String fundIcon,
    required String fundName,
    required String category,
    required String units,
    required String currentValue,
    required String performance,
    required String nav,
    required List<double> sparklineData,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Fund Icon and Name
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    fundIcon,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fundName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    performance,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            // Financial Details Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Value',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentValue,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Units',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        units,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NAV',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        nav,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            // Sparkline Chart
            SizedBox(
              height: 40,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: sparklineData.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value);
                      }).toList(),
                      isCurved: true,
                      color: Colors.white,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

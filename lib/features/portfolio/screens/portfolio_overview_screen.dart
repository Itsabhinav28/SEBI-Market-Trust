import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/responsive_wrapper.dart';
import '../../../core/widgets/professional_app_bar.dart';

class PortfolioOverviewScreen extends StatefulWidget {
  const PortfolioOverviewScreen({super.key});

  @override
  State<PortfolioOverviewScreen> createState() =>
      _PortfolioOverviewScreenState();
}

class _PortfolioOverviewScreenState extends State<PortfolioOverviewScreen> {
  int _selectedTimeframe = 1; // 0: 1D, 1: 1W, 2: 1M

  @override
  Widget build(BuildContext context) {
    return AppResponsiveWrapper(
      child: Scaffold(
        backgroundColor: AppTheme.lightBackground,
        appBar: ProfessionalAppBar(
          title: 'Portfolio Overview',
          showBackButton: false,
          customLeading: Builder(
            builder: (context) => Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFF1E293B)),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ),
        drawer: _buildNavigationDrawer(context),
        body: ListView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          children: [
            _buildPortfolioOverviewCard(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildAssetAllocationCard(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildRiskAnalysisCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioOverviewCard(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Portfolio Overview',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                  ),
                ),
                _buildTimeframeSelector(context),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    context,
                    label: 'Total Investment',
                    value: '₹2,18,000',
                    valueColor: Colors.black87,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    context,
                    label: 'Current Value',
                    value: '₹2,45,670',
                    valueColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    context,
                    label: 'Total Returns',
                    value: '+₹27,670',
                    valueColor: Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    context,
                    label: 'Returns %',
                    value: '+12.69%',
                    valueColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.smallPadding),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 50000,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withValues(alpha: 0.2),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 1,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            Widget text;
                            switch (value.toInt()) {
                              case 0:
                                text = const Text('Jan', style: style);
                                break;
                              case 1:
                                text = const Text('Feb', style: style);
                                break;
                              case 2:
                                text = const Text('Mar', style: style);
                                break;
                              case 3:
                                text = const Text('Apr', style: style);
                                break;
                              case 4:
                                text = const Text('May', style: style);
                                break;
                              case 5:
                                text = const Text('Jun', style: style);
                                break;
                              case 6:
                                text = const Text('Jul', style: style);
                                break;
                              default:
                                text = const Text('', style: style);
                                break;
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: text,
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 50000,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            return Text(
                              '${(value / 1000).toInt()}k',
                              style: style,
                            );
                          },
                          reservedSize: 42,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border:
                          Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                    ),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 300000,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 180000),
                          FlSpot(1, 195000),
                          FlSpot(2, 210000),
                          FlSpot(3, 200000),
                          FlSpot(4, 225000),
                          FlSpot(5, 240000),
                          FlSpot(6, 245670),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.primaryColor,
                            AppTheme.secondaryColor,
                          ],
                        ),
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.primaryColor.withValues(alpha: 0.3),
                              AppTheme.primaryColor.withValues(alpha: 0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeframeSelector(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTimeframeButton(context, '1D', 0),
          _buildTimeframeButton(context, '1W', 1),
          _buildTimeframeButton(context, '1M', 2),
        ],
      ),
    );
  }

  Widget _buildTimeframeButton(BuildContext context, String text, int index) {
    final isSelected = _selectedTimeframe == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTimeframe = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.smallPadding,
          vertical: AppConstants.smallPadding,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context, {
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: valueColor,
              ),
        ),
      ],
    );
  }

  Widget _buildAssetAllocationCard(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Asset Allocation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppConstants.defaultRadius),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.smallPadding),
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  return;
                                }
                              });
                            },
                          ),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 2,
                          centerSpaceRadius: 20,
                          sections: [
                            PieChartSectionData(
                              color: Colors.blue,
                              value: 65,
                              title: '65%',
                              radius: 25,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.green,
                              value: 25,
                              title: '25%',
                              radius: 25,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.orange,
                              value: 10,
                              title: '10%',
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
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _buildLegendItem('Equity Funds', Colors.blue, '65%'),
                      const SizedBox(height: AppConstants.smallPadding),
                      _buildLegendItem('Debt Funds', Colors.green, '25%'),
                      const SizedBox(height: AppConstants.smallPadding),
                      _buildLegendItem('Gold ETF', Colors.orange, '10%'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color, String percentage) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppConstants.smallPadding),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          percentage,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildRiskAnalysisCard(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Risk Analysis',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: AppConstants.smallPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Moderate',
                    style: TextStyle(
                      color: Colors.orange[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              children: [
                Expanded(
                  child: _buildRiskMetric(
                    context,
                    label: 'Volatility',
                    value: '15.2%',
                  ),
                ),
                Expanded(
                  child: _buildRiskMetric(
                    context,
                    label: 'Sharpe Ratio',
                    value: '1.45',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskMetric(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
        ),
      ],
    );
  }

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Asha Sharma',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'asha@sebimarkettrust.com',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            'Dashboard',
            Icons.home,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Portfolio',
            Icons.pie_chart,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Chat',
            Icons.chat,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Learning Hub',
            Icons.school,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Smart Alerts',
            Icons.notifications,
            () {
              Navigator.pop(context);
              context.push('/alerts');
            },
          ),
          _buildDrawerItem(
            context,
            'Financial Goals',
            Icons.flag,
            () {
              Navigator.pop(context);
              context.push('/goals');
            },
          ),
          _buildDrawerItem(
            context,
            'Market News',
            Icons.newspaper,
            () {
              Navigator.pop(context);
              context.push('/news');
            },
          ),
          _buildDrawerItem(
            context,
            'My Holdings',
            Icons.account_balance_wallet,
            () {
              Navigator.pop(context);
              context.push('/holdings');
            },
          ),
          _buildDrawerItem(
            context,
            'Buy/Sell',
            Icons.trending_up,
            () {
              Navigator.pop(context);
              context.push('/trading/buy-sell');
            },
          ),
          const Divider(),
          _buildDrawerItem(
            context,
            'Settings',
            Icons.settings,
            () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            context,
            'Help & Support',
            Icons.help,
            () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF1E293B),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1E293B),
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: const Color(0xFF3B82F6).withValues(alpha: 0.1),
    );
  }
}

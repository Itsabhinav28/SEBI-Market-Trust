import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/responsive_wrapper.dart';

class RegulatoryInfoScreen extends StatelessWidget {
  const RegulatoryInfoScreen({super.key});

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
          title: const Text('Regulatory Information'),
          backgroundColor: AppTheme.lightSurface,
          foregroundColor: AppTheme.lightOnSurface,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: AppConstants.defaultPadding),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shield,
                color: Colors.green[700],
                size: 20,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          children: [
            _buildSEBICard(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildInfoCard(
              context,
              title: 'Risk Disclosure',
              description: 'Read important risk factors before investing',
              actionText: 'View',
              onTap: () {
                // TODO: Navigate to risk disclosure
              },
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildInfoCard(
              context,
              title: 'Privacy Policy',
              description: 'How we protect your financial data',
              actionText: 'View',
              onTap: () {
                // TODO: Navigate to privacy policy
              },
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildInfoCard(
              context,
              title: 'Terms of Service',
              description: 'Platform usage terms and conditions',
              actionText: 'View',
              onTap: () {
                // TODO: Navigate to terms of service
              },
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildImportantNoticeCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSEBICard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(
          color: Colors.green.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: AppConstants.defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SEBI Registered Platform',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    'Investment Advisor Registration: INA000012345',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    'FinBot AI is a SEBI registered investment advisor. All investment advice is provided in compliance with SEBI regulations. Mutual fund investments are subject to market risks.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                          height: 1.4,
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

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required String description,
    required String actionText,
    required VoidCallback onTap,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onTap,
              child: Text(
                actionText,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImportantNoticeCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(
          color: Colors.orange.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: AppConstants.defaultPadding),
            Expanded(
              child: Text(
                'Mutual fund investments are subject to market risks. Please read all scheme related documents carefully before investing. Past performance is not indicative of future returns.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black87,
                      height: 1.4,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

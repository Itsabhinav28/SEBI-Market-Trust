import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

class ChatInterfaceScreen extends StatefulWidget {
  const ChatInterfaceScreen({super.key});

  @override
  State<ChatInterfaceScreen> createState() => _ChatInterfaceScreenState();
}

class _ChatInterfaceScreenState extends State<ChatInterfaceScreen>
    with TickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late AnimationController _typingController;
  late Animation<double> _typingAnimation;

  bool _isPortfolioExpanded = false;
  bool _isTyping = false;

  final List<ChatMessage> _messages = [
    ChatMessage(
      text:
          'Hello! I\'m FinBot AI, your financial companion. How can I help you with your investments today? 💰',
      isUser: false,
      timestamp: '9:45 AM',
    ),
  ];

  // Intelligent hardcoded responses
  final Map<String, String> _responses = {
    'sip': '''📈 **Top SIP Funds for 2024:**

**Large Cap Funds:**
• HDFC Top 100 Fund - 15.2% returns
• ICICI Prudential Bluechip Fund - 14.8% returns
• SBI Bluechip Fund - 14.5% returns

**Mid Cap Funds:**
• HDFC Mid-Cap Opportunities Fund - 18.3% returns
• Franklin India Prima Fund - 17.9% returns
• DSP Midcap Fund - 17.2% returns

**Small Cap Funds:**
• Nippon India Small Cap Fund - 22.1% returns
• HDFC Small Cap Fund - 21.8% returns

**Recommended SIP Amount:** ₹5,000-₹10,000 monthly for optimal growth! 🚀''',
    'mutual fund': '''💼 **Best Mutual Funds 2024:**

**Equity Funds:**
• Axis Bluechip Fund - 16.2% returns
• Mirae Asset Large Cap Fund - 15.8% returns
• Kotak Emerging Equity Fund - 19.1% returns

**Debt Funds:**
• HDFC Corporate Bond Fund - 7.8% returns
• ICICI Prudential Corporate Bond Fund - 7.5% returns

**Hybrid Funds:**
• HDFC Balanced Advantage Fund - 12.3% returns
• ICICI Prudential Equity & Debt Fund - 11.9% returns

**Tax Saving (ELSS):**
• Axis Long Term Equity Fund - 15.6% returns
• DSP Tax Saver Fund - 15.2% returns

Start with ₹1,000 minimum investment! 💡''',
    'sebi': '''⚖️ **SEBI Regulations & Investor Protection:**

**Key Regulations:**
• **KYC Compliance:** Mandatory for all investments
• **Risk Disclosure:** All risks must be clearly stated
• **Transparency:** Regular portfolio disclosures required
• **Investor Grievance:** Redressal mechanism in place

**Investor Rights:**
• Right to information about investments
• Right to fair treatment
• Right to timely settlement
• Right to grievance redressal

**Protection Measures:**
• Investor Protection Fund (IPF)
• Investor Education & Protection Fund (IEPF)
• Ombudsman for dispute resolution

**Complaint Channels:**
• SEBI SCORES portal
• Toll-free: 1800-266-7575
• Email: scores@sebi.gov.in

Your investments are protected! 🛡️''',
    'market': '''📊 **Current Market Analysis:**

**Market Indices:**
• **Nifty 50:** 24,850 (+1.2%)
• **Sensex:** 81,750 (+1.1%)
• **Nifty Bank:** 52,100 (+0.8%)

**Top Performing Sectors:**
• **IT:** +2.3% (TCS, Infosys leading)
• **Pharma:** +1.9% (Sun Pharma, Dr. Reddy's)
• **FMCG:** +1.6% (HUL, ITC strong)

**Market Outlook:**
• Bullish trend continues
• Strong FII inflows: ₹2,500 cr
• Domestic institutions buying
• GDP growth at 7.2%

**Investment Opportunities:**
• Large cap stocks for stability
• Mid cap for growth potential
• SIP in equity funds recommended

Market is showing positive momentum! 📈''',
    'portfolio': '''💼 **Portfolio Analysis & Management:**

**Your Current Portfolio:**
• **Total Value:** ₹5,23,456
• **Invested Amount:** ₹2,50,000
• **Current Gain/Loss:** ₹2,73,456 (+109.4%)

**Asset Allocation:**
• **Equity:** 70% (₹3,66,419)
• **Debt:** 20% (₹1,04,691)
• **Gold:** 10% (₹52,346)

**Performance Analysis:**
• **1 Year Return:** +45.2%
• **3 Year CAGR:** +28.7%
• **5 Year CAGR:** +22.1%

**Recommendations:**
• Rebalance portfolio quarterly
• Increase SIP amount by 10%
• Consider tax-saving investments
• Diversify across sectors

Your portfolio is performing excellently! 🎯''',
    'tax': '''💰 **Tax Planning Strategies 2024:**

**Tax Saving Investments:**
• **ELSS:** ₹1.5L deduction (80C)
• **PPF:** ₹1.5L deduction (80C)
• **NPS:** ₹50K additional (80CCD)
• **Health Insurance:** ₹25K (80D)

**Capital Gains Tax:**
• **LTCG:** 10% on gains >₹1L
• **STCG:** 15% on equity gains
• **Debt Funds:** As per income slab

**Tax Optimization Tips:**
• Use ₹1L LTCG exemption
• Harvest losses to offset gains
• Invest in tax-free bonds
• Consider REITs for diversification

**Deadlines:**
• **ELSS:** March 31st
• **PPF:** March 31st
• **NPS:** March 31st

Save maximum tax legally! 🏆''',
    'risk': '''⚠️ **Risk Management Guide:**

**Risk Assessment:**
• **Conservative:** 20% equity, 80% debt
• **Moderate:** 50% equity, 50% debt
• **Aggressive:** 80% equity, 20% debt

**Risk Mitigation:**
• Diversify across asset classes
• Regular portfolio rebalancing
• Emergency fund (6 months expenses)
• Insurance coverage

**Market Risks:**
• Volatility management
• Sector rotation strategy
• Dollar-cost averaging
• Stop-loss implementation

**Personal Risks:**
• Health insurance coverage
• Life insurance protection
• Disability insurance
• Critical illness cover

**Risk Monitoring:**
• Monthly portfolio review
• Quarterly rebalancing
• Annual risk assessment
• Regular goal review

Protect your wealth! 🛡️''',
    'investment': '''🎯 **Investment Strategies:**

**Goal-Based Investing:**
• **Short-term (1-3 years):** Debt funds, FDs
• **Medium-term (3-7 years):** Hybrid funds, balanced funds
• **Long-term (7+ years):** Equity funds, direct stocks

**Investment Principles:**
• Start early for compound growth
• Invest regularly (SIP)
• Stay invested for long term
• Diversify across assets

**Popular Strategies:**
• **Value Investing:** Buy undervalued stocks
• **Growth Investing:** Focus on growth companies
• **Index Investing:** Low-cost passive investing
• **Dividend Investing:** Regular income focus

**Investment Tools:**
• SIP calculator
• Goal-based planning
• Risk assessment tools
• Portfolio tracker

Build wealth systematically! 💪''',
    'nifty': '''📈 **Nifty 50 Analysis:**

**Current Nifty 50:** 24,850 (+1.2%)

**Top Gainers:**
• **TCS:** ₹4,250 (+3.2%)
• **Infosys:** ₹1,850 (+2.8%)
• **HDFC Bank:** ₹1,650 (+2.1%)

**Top Losers:**
• **Reliance:** ₹2,850 (-1.2%)
• **ITC:** ₹450 (-0.8%)

**Sector Performance:**
• **IT:** +2.3% (Strong earnings)
• **Banking:** +1.1% (Rate cut expectations)
• **FMCG:** +0.9% (Stable demand)

**Technical Analysis:**
• Support: 24,200
• Resistance: 25,000
• RSI: 65 (Neutral)
• MACD: Bullish crossover

**Outlook:**
• Bullish trend intact
• Target: 25,500
• Stop-loss: 24,000

Nifty showing strong momentum! 🚀''',
    'sensex': '''📊 **Sensex Market Update:**

**Current Sensex:** 81,750 (+1.1%)

**Market Cap:** ₹275 lakh crore
**P/E Ratio:** 22.5 (Fair value)
**Dividend Yield:** 1.8%

**Key Drivers:**
• Strong FII inflows
• Robust corporate earnings
• Government reforms
• Global market rally

**Top Contributors:**
• **HDFC Bank:** +180 points
• **TCS:** +150 points
• **Infosys:** +120 points

**Market Breadth:**
• Advances: 1,850
• Declines: 1,200
• Unchanged: 150

**Foreign Investment:**
• FIIs: +₹2,500 cr (net buying)
• DIIs: +₹1,800 cr (net buying)

**Outlook:**
• Bullish momentum continues
• Target: 85,000
• Support: 79,000

Sensex on a strong footing! 💪''',
  };

  @override
  void initState() {
    super.initState();
    _typingController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _typingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _typingController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _typingController.dispose();
    super.dispose();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      final userMessage = _messageController.text.trim();
      setState(() {
        _messages.add(ChatMessage(
          text: userMessage,
          isUser: true,
          timestamp: _getCurrentTime(),
        ));
      });
      _messageController.clear();
      _scrollToBottom();

      // Simulate typing and send intelligent response
      _simulateTyping(userMessage);
    }
  }

  void _simulateTyping(String userMessage) {
    setState(() {
      _isTyping = true;
    });

    _typingController.forward();

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isTyping = false;
        });
        _typingController.reset();

        final response = _getIntelligentResponse(userMessage);
        setState(() {
          _messages.add(ChatMessage(
            text: response['text'],
            isUser: false,
            timestamp: _getCurrentTime(),
            graphType: response['graphType'],
            graphData: response['graphData'],
          ));
        });
        _scrollToBottom();
      }
    });
  }

  Map<String, dynamic> _getIntelligentResponse(String userMessage) {
    final message = userMessage.toLowerCase();

    // Keyword matching for intelligent responses with graphs
    if (message.contains('sip') || message.contains('systematic')) {
      return {
        'text': _responses['sip']!,
        'graphType': null,
        'graphData': null,
      };
    } else if (message.contains('mutual fund') || message.contains('fund')) {
      return {
        'text': _responses['mutual fund']!,
        'graphType': null,
        'graphData': null,
      };
    } else if (message.contains('sebi') || message.contains('regulation')) {
      return {
        'text': _responses['sebi']!,
        'graphType': null,
        'graphData': null,
      };
    } else if (message.contains('market') ||
        message.contains('sensex') ||
        message.contains('nifty')) {
      String responseText;
      String? graphType;
      Map<String, dynamic>? graphData;

      if (message.contains('nifty')) {
        responseText = _responses['nifty']!;
        graphType = 'line_chart';
        graphData = {
          'points': [
            {'x': 0, 'y': 22000},
            {'x': 1, 'y': 22150},
            {'x': 2, 'y': 22080},
            {'x': 3, 'y': 22200},
            {'x': 4, 'y': 22350},
            {'x': 5, 'y': 22400},
            {'x': 6, 'y': 22600},
          ]
        };
      } else if (message.contains('sensex')) {
        responseText = _responses['sensex']!;
        graphType = 'line_chart';
        graphData = {
          'points': [
            {'x': 0, 'y': 74000},
            {'x': 1, 'y': 74200},
            {'x': 2, 'y': 74100},
            {'x': 3, 'y': 74300},
            {'x': 4, 'y': 74500},
            {'x': 5, 'y': 74600},
            {'x': 6, 'y': 74800},
          ]
        };
      } else {
        responseText = _responses['market']!;
        graphType = 'bar_chart';
        graphData = {
          'maxY': 100,
          'bars': [
            {'value': 85, 'label': 'IT'},
            {'value': 78, 'label': 'Pharma'},
            {'value': 65, 'label': 'Banking'},
            {'value': 72, 'label': 'Auto'},
            {'value': 88, 'label': 'FMCG'},
          ]
        };
      }

      return {
        'text': responseText,
        'graphType': graphType,
        'graphData': graphData,
      };
    } else if (message.contains('portfolio') ||
        message.contains('investment')) {
      String responseText;
      String? graphType;
      Map<String, dynamic>? graphData;

      if (message.contains('portfolio')) {
        responseText = _responses['portfolio']!;
        graphType = 'portfolio_performance';
        graphData = {
          'title': 'Your Portfolio Performance (6 Months)',
          'points': [
            {'x': 0, 'y': 100000},
            {'x': 1, 'y': 105000},
            {'x': 2, 'y': 108000},
            {'x': 3, 'y': 112000},
            {'x': 4, 'y': 115000},
            {'x': 5, 'y': 118000},
            {'x': 6, 'y': 120000},
          ]
        };
      } else {
        responseText = _responses['investment']!;
        graphType = 'pie_chart';
        graphData = {
          'sections': [
            {'color': 0xFF3B82F6, 'value': 40, 'title': 'Equity'},
            {'color': 0xFF10B981, 'value': 30, 'title': 'Debt'},
            {'color': 0xFFF59E0B, 'value': 20, 'title': 'Gold'},
            {'color': 0xFFEF4444, 'value': 10, 'title': 'Cash'},
          ]
        };
      }

      return {
        'text': responseText,
        'graphType': graphType,
        'graphData': graphData,
      };
    } else if (message.contains('tax') || message.contains('saving')) {
      return {
        'text': _responses['tax']!,
        'graphType': null,
        'graphData': null,
      };
    } else if (message.contains('risk') || message.contains('safe')) {
      return {
        'text': _responses['risk']!,
        'graphType': null,
        'graphData': null,
      };
    } else if (message.contains('hello') ||
        message.contains('hi') ||
        message.contains('help')) {
      return {
        'text': '''👋 **Welcome to FinBot AI!**

I'm here to help you with:

📈 **Investment Guidance**
• SIP & Mutual Fund recommendations
• Portfolio analysis & management
• Market insights & trends

⚖️ **SEBI Regulations**
• Investor protection guidelines
• Compliance requirements
• Grievance redressal

💰 **Tax Planning**
• Tax-saving investment options
• Capital gains optimization
• Financial planning strategies

🛡️ **Risk Management**
• Risk assessment & mitigation
• Asset allocation strategies
• Insurance planning

**Ask me anything about:**
• "Best SIP funds for 2024"
• "Current market analysis"
• "Tax saving strategies"
• "Portfolio rebalancing"

How can I assist you today? 🚀''',
        'graphType': null,
        'graphData': null,
      };
    } else {
      return {
        'text': '''🤖 **I'm here to help with your financial queries!**

I can assist you with:

📊 **Market Analysis** - Current trends, indices, sector performance
💼 **Investment Advice** - SIP funds, mutual funds, portfolio management
⚖️ **SEBI Regulations** - Compliance, investor protection, guidelines
💰 **Tax Planning** - Tax-saving investments, optimization strategies
🛡️ **Risk Management** - Assessment, mitigation, insurance planning

**Try asking:**
• "What are the best SIP funds?"
• "How is the market performing?"
• "Tell me about SEBI regulations"
• "Help with tax planning"
• "Portfolio analysis"

What would you like to know? 💡''',
        'graphType': null,
        'graphData': null,
      };
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildPortfolioSection(context),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    _buildFinBotHeader(context),
                    _buildKnowledgeBaseTabs(context),
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        itemCount: _messages.length + (_isTyping ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == _messages.length && _isTyping) {
                            return _buildTypingIndicator();
                          }
                          return _buildMessageBubble(_messages[index]);
                        },
                      ),
                    ),
                    _buildInputField(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF334155)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(30, 41, 59, 0.2),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.smart_toy_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.language_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.1),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF059669)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isPortfolioExpanded = !_isPortfolioExpanded;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Your Portfolio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isPortfolioExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isPortfolioExpanded)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                children: [
                  const Divider(color: Colors.white24, height: 1),
                  const SizedBox(height: 8),
                  _buildPortfolioRow('Total Value', '₹ 5,23,456'),
                  const SizedBox(height: 4),
                  _buildPortfolioRow('Invested Amount', '₹ 2,50,000'),
                  const SizedBox(height: 4),
                  _buildPortfolioRow('Current Gain/Loss', '₹ 2,73,456'),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPortfolioRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildFinBotHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.smart_toy_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FinBot AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'आपका वित्तीय साथी',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: const Text(
              'Online',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKnowledgeBaseTabs(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildKnowledgeTab(
                'SEBI Regulations', Icons.gavel, const Color(0xFF3B82F6)),
            const SizedBox(width: 6),
            _buildKnowledgeTab('Market Fundamentals', Icons.trending_up,
                const Color(0xFF10B981)),
            const SizedBox(width: 6),
            _buildKnowledgeTab(
                'Product Features', Icons.inventory, const Color(0xFFF59E0B)),
            const SizedBox(width: 6),
            _buildKnowledgeTab(
                'Risk Management', Icons.shield, const Color(0xFFEF4444)),
            const SizedBox(width: 6),
            _buildKnowledgeTab(
                'Tax Planning', Icons.calculate, const Color(0xFF8B5CF6)),
          ],
        ),
      ),
    );
  }

  Widget _buildKnowledgeTab(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.isUser
                ? const Color(0xFF10B981)
                : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: message.isUser
                  ? const Radius.circular(16)
                  : const Radius.circular(4),
              bottomRight: message.isUser
                  ? const Radius.circular(4)
                  : const Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: (message.isUser
                        ? const Color(0xFF10B981)
                        : const Color(0xFF64748B))
                    .withValues(alpha: 0.15),
                blurRadius: 6,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(
                  color:
                      message.isUser ? Colors.white : const Color(0xFF1E293B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                  height: 1.3,
                ),
              ),
              if (message.graphType != null && message.graphData != null) ...[
                const SizedBox(height: 8),
                _buildGraphWidget(message.graphType!, message.graphData!),
              ],
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    message.isUser ? Icons.person : Icons.smart_toy_outlined,
                    color: message.isUser
                        ? Colors.white.withValues(alpha: 0.7)
                        : const Color(0xFF64748B),
                    size: 10,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    message.timestamp,
                    style: TextStyle(
                      color: message.isUser
                          ? Colors.white.withValues(alpha: 0.7)
                          : const Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF64748B).withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.smart_toy_outlined,
              color: const Color(0xFF64748B),
              size: 12,
            ),
            const SizedBox(width: 8),
            AnimatedBuilder(
              animation: _typingAnimation,
              builder: (context, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Transform.scale(
                        scale: 1.0 + (_typingAnimation.value * 0.5),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xFF64748B).withValues(
                              alpha: 0.3 + (_typingAnimation.value * 0.7),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            const SizedBox(width: 8),
            Text(
              'FinBot is typing...',
              style: TextStyle(
                color: const Color(0xFF64748B),
                fontSize: 11,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphWidget(String graphType, Map<String, dynamic> graphData) {
    switch (graphType) {
      case 'line_chart':
        return _buildLineChart(graphData);
      case 'bar_chart':
        return _buildBarChart(graphData);
      case 'pie_chart':
        return _buildPieChart(graphData);
      case 'portfolio_performance':
        return _buildPortfolioChart(graphData);
      default:
        return Container();
    }
  }

  Widget _buildLineChart(Map<String, dynamic> data) {
    final List<FlSpot> spots = (data['points'] as List)
        .map((point) => FlSpot(point['x'].toDouble(), point['y'].toDouble()))
        .toList();

    // Calculate min and max values for proper scaling
    final minY = spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    final range = maxY - minY;
    final padding = range * 0.1; // 10% padding

    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: LineChart(
        LineChartData(
          minY: minY - padding,
          maxY: maxY + padding,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: range / 4, // Show 4 horizontal lines
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade200,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.shade200,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: range / 4,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: const Color(0xFF10B981),
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: const Color(0xFF10B981).withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(Map<String, dynamic> data) {
    final List<BarChartGroupData> barGroups = (data['bars'] as List)
        .asMap()
        .entries
        .map((entry) => BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value['value'].toDouble(),
                  color: const Color(0xFF3B82F6),
                  width: 20,
                ),
              ],
            ))
        .toList();

    final maxY = data['maxY']?.toDouble() ?? 100;
    final interval = maxY / 4; // Show 4 horizontal lines

    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade200,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: interval,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < data['bars'].length) {
                    return Text(
                      data['bars'][index]['label'] ?? index.toString(),
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          barGroups: barGroups,
        ),
      ),
    );
  }

  Widget _buildPieChart(Map<String, dynamic> data) {
    final List<PieChartSectionData> sections = (data['sections'] as List)
        .map((section) => PieChartSectionData(
              color: Color(section['color']),
              value: section['value'].toDouble(),
              title: '${section['value']}%',
              radius: 50,
              titleStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))
        .toList();

    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                sections: sections,
                centerSpaceRadius: 30,
                sectionsSpace: 2,
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    // Handle touch events if needed
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Legend
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: (data['sections'] as List).map((section) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Color(section['color']),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    section['title'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioChart(Map<String, dynamic> data) {
    final List<FlSpot> spots = (data['points'] as List)
        .map((point) => FlSpot(point['x'].toDouble(), point['y'].toDouble()))
        .toList();

    // Calculate min and max values for proper scaling
    final minY = spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    final range = maxY - minY;
    final padding = range * 0.1; // 10% padding

    return Container(
      height: 180,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            data['title'] ?? 'Portfolio Performance',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: LineChart(
              LineChartData(
                minY: minY - padding,
                maxY: maxY + padding,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: range / 4,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35,
                      interval: range / 4,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '₹${(value / 1000).toStringAsFixed(0)}K',
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 15,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          'M${value.toInt() + 1}',
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: const Color(0xFF10B981),
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF10B981).withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.mic,
                color: Color(0xFF64748B),
                size: 18,
              ),
              onPressed: () {},
              padding: const EdgeInsets.all(6),
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                hintStyle: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              ),
              cursorColor: const Color(0xFF3B82F6),
              onSubmitted: (value) => _sendMessage(),
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF059669)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF10B981).withValues(alpha: 0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 18,
              ),
              onPressed: _sendMessage,
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final String timestamp;
  final String? graphType;
  final Map<String, dynamic>? graphData;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.graphType,
    this.graphData,
  });
}

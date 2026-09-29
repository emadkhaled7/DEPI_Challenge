import 'package:flutter/material.dart';

class Screen11 extends StatefulWidget {
  const Screen11({super.key});

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11> {
  int selectedBottomItem = 0;

  final List<Map<String, dynamic>> transactions = [
    {
      'name': 'Ahmed Mohamed',
      'type': 'Money received',
      'amount': '+1,500 EGP',
      'icon': Icons.arrow_downward_rounded,
      'color': Colors.green,
    },
    {
      'name': 'Mohamed Ali',
      'type': 'Money sent',
      'amount': '-750 EGP',
      'icon': Icons.arrow_upward_rounded,
      'color': Colors.red,
    },
    {
      'name': 'Omar Hassan',
      'type': 'Money received',
      'amount': '+2,000 EGP',
      'icon': Icons.arrow_downward_rounded,
      'color': Colors.green,
    },
    {
      'name': 'Youssef Ahmed',
      'type': 'Money sent',
      'amount': '-500 EGP',
      'icon': Icons.arrow_upward_rounded,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              _buildHeader(),
              _buildBalanceCard(),
              _buildQuickActions(),
              _buildTransactions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Good morning 👋',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Ammar',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF1D2433),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFF252D3B),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF252D3B).withOpacity(.18),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A4658),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        color: Colors.white70,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Hide',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  'Available Balance',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Text(
              '24,850.75 EGP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF3A4658),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Text(
                    '**** **** **** 5824',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      letterSpacing: 2,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.credit_card_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {
        'icon': Icons.arrow_upward_rounded,
        'title': 'Send',
      },
      {
        'icon': Icons.arrow_downward_rounded,
        'title': 'Receive',
      },
      {
        'icon': Icons.add_card_rounded,
        'title': 'Add Money',
      },
      {
        'icon': Icons.more_horiz_rounded,
        'title': 'More',
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actions.map((action) {
          return Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDF3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  action['icon'] as IconData,
                  color: const Color(0xFF252D3B),
                  size: 23,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                action['title'] as String,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'See All',
                style: TextStyle(
                  color: Color(0xFF252D3B),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...transactions.map(
            (transaction) => _transactionCard(transaction),
          ),
        ],
      ),
    );
  }

  Widget _transactionCard(Map<String, dynamic> transaction) {
    final bool received = transaction['amount'].toString().startsWith('+');

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Text(
            transaction['amount'],
            style: TextStyle(
              color: received ? Colors.green.shade600 : Colors.red.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transaction['name'],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transaction['type'],
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 9,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: received
                  ? Colors.green.withOpacity(.10)
                  : Colors.red.withOpacity(.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              transaction['icon'],
              color: transaction['color'],
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: selectedBottomItem,
      onTap: (index) {
        setState(() {
          selectedBottomItem = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF252D3B),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz_rounded),
          label: 'Transfer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_rounded),
          label: 'Cards',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
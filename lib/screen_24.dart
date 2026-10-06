import 'package:flutter/material.dart';
import 'screen_23.dart';
import 'screen_25.dart';

class Screen24 extends StatefulWidget {
  const Screen24({super.key});

  @override
  State<Screen24> createState() => _Screen24State();
}

class _Screen24State extends State<Screen24> {
  int selectedFilter = 0;
  String search = '';

  final transactions = [
    {
      'title': 'Shopping',
      'date': 'Today, 10:42 AM',
      'amount': '-\$84.00',
      'category': 'Expenses',
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'title': 'Food & Drinks',
      'date': 'Today, 08:15 AM',
      'amount': '-\$32.50',
      'category': 'Expenses',
      'icon': Icons.restaurant_outlined,
    },
    {
      'title': 'Salary',
      'date': 'Yesterday, 09:00 AM',
      'amount': '+\$2,500.00',
      'category': 'Income',
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'title': 'Electricity Bill',
      'date': 'Yesterday, 04:20 PM',
      'amount': '-\$76.40',
      'category': 'Bills',
      'icon': Icons.receipt_long_outlined,
    },
    {
      'title': 'Transportation',
      'date': 'Sep 28, 06:30 PM',
      'amount': '-\$45.00',
      'category': 'Transport',
      'icon': Icons.directions_car_outlined,
    },
  ];

  final filters = [
    'All',
    'Income',
    'Expenses',
    'Shopping',
    'Food',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = transactions.where((transaction) {
      final title = transaction['title'].toString().toLowerCase();
      final query = search.toLowerCase();

      final matchesSearch = title.contains(query);

      if (selectedFilter == 0) {
        return matchesSearch;
      }

      final filter = filters[selectedFilter];

      if (filter == 'Shopping') {
        return matchesSearch && transaction['title'] == 'Shopping';
      }

      if (filter == 'Food') {
        return matchesSearch &&
            transaction['title'] == 'Food & Drinks';
      }

      return matchesSearch &&
          transaction['category'] == filter;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Search transactions',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final selected = selectedFilter == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 9),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF17191C)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filters[index],
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : Colors.grey.shade700,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 22),
            Expanded(
              child: filteredTransactions.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 48,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'No transactions found',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: [
                        _dateTitle('Recent'),
                        ...filteredTransactions.map(
                          (transaction) => _transaction(
                            transaction['icon'] as IconData,
                            transaction['title'].toString(),
                            transaction['date'].toString(),
                            transaction['amount'].toString(),
                            income: transaction['category'] == 'Income',
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF17191C),
        foregroundColor: Colors.white,
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const Screen25(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const Screen23(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Screen25(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long_rounded),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
        ],
      ),
    );
  }

  Widget _dateTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _transaction(
    IconData icon,
    String title,
    String time,
    String amount, {
    bool income = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F1F3),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: income ? const Color(0xFF32945C) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
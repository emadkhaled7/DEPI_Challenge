import 'package:flutter/material.dart';
import 'screen_23.dart';

class Screen25 extends StatefulWidget {
  const Screen25({super.key});

  @override
  State<Screen25> createState() => _Screen25State();
}

class _Screen25State extends State<Screen25> {
  int selectedCategory = 0;
  int selectedPayment = 0;

  final categories = [
    (Icons.restaurant_outlined, 'Food'),
    (Icons.shopping_bag_outlined, 'Shopping'),
    (Icons.directions_car_outlined, 'Transport'),
    (Icons.receipt_long_outlined, 'Bills'),
    (Icons.movie_outlined, 'Entertainment'),
    (Icons.more_horiz_rounded, 'Other'),
  ];

  final payments = [
    (Icons.credit_card_rounded, 'Card'),
    (Icons.account_balance_wallet_outlined, 'Cash'),
    (Icons.account_balance_outlined, 'Bank'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close_rounded),
        ),
        title: const Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Amount',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '\$0.00',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            _label('Category'),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                final item = categories[index];
                final selected = selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFF17191C)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.$1,
                          size: 23,
                          color: selected
                              ? Colors.white
                              : Colors.black87,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          item.$2,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: selected
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            _label('Details'),
            const SizedBox(height: 10),
            Container(
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.edit_note_rounded),
                  hintText: 'Description',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                        initialDate: DateTime.now(),
                      );
                    },
                    child: _input(
                      Icons.calendar_today_outlined,
                      'Oct 06, 2026',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _input(
                    Icons.attach_money_rounded,
                    'USD',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _label('Payment Method'),
            const SizedBox(height: 10),
            SizedBox(
              height: 58,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  final item = payments[index];
                  final selected = selectedPayment == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF17191C)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item.$1,
                            size: 19,
                            color: selected
                                ? Colors.white
                                : Colors.black87,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.$2,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: selected
                                  ? Colors.white
                                  : Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Screen23(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF17191C),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: const Text(
                  'Add Expense',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _input(IconData icon, String text) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
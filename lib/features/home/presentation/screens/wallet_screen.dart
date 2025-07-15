import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Balans', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text(
                  '100 000.00 so’m',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7C4DFF),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.download, color: Colors.white),
                        label: Text(
                          'Pul chiqarish',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.upload),
                        label: const Text('To‘ldirish'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(12),
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Karta turi"),
                Text("Status"),
                Text("Summa"),
                Text("Sana"),
              ],
            ),
          ),
          Expanded(child: _buildHistoryList()),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    final transactions = [
      {
        'card': '****9878',
        'status': 'To‘landi',
        'amount': '-1 000',
        'color': Colors.green,
        'time': '12.12.2024\n13:00',
      },
      {
        'card': '****9878',
        'status': 'To‘ldirildi',
        'amount': '+100 000',
        'color': Colors.green,
        'time': '12.12.2024\n13:00',
      },
      {
        'card': '****9878',
        'status': 'Bekor qilindi',
        'amount': '-10 000',
        'color': Colors.red,
        'time': '12.12.2024\n13:00',
      },
      {
        'card': '****9878',
        'status': 'Kutilmoqda',
        'amount': '-1 000',
        'color': Colors.orange,
        'time': '12.12.2024\n13:00',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/uzcard_logo.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(item['card'] as String)),
              Expanded(
                child: Text(
                  item['status'] as String,
                  style: TextStyle(
                    color: item['color'] as Color,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item['amount'] as String,
                  style: TextStyle(
                    color: item['color'] as Color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item['time'] as String,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'khata_model.dart';
import 'add_khata_page.dart';
import 'account_details_page.dart';

class KhataHome extends StatefulWidget {
  const KhataHome({super.key});

  @override
  State<KhataHome> createState() => _KhataHomeState();
}

class _KhataHomeState extends State<KhataHome> {
  Map<String, KhataAccount> accounts = {};

  double getTotalWorkAmount() {
    double total = 0;
    for (var acc in accounts.values) {
      for (var e in acc.entries) total += e.price;
    }
    return total;
  }

  double getTotalPaid() {
    double total = 0;
    for (var acc in accounts.values) {
      for (var e in acc.entries) total += e.totalPaid;
    }
    return total;
  }

  double getTotalRemaining() => getTotalWorkAmount() - getTotalPaid();

  void addOrUpdateEntry(String name, KhataEntry entry) {
    if (accounts.containsKey(name)) {
      accounts[name]!.entries.add(entry);
    } else {
      accounts[name] = KhataAccount(name: name)..entries.add(entry);
    }
  }

  void openAddEntry({String? existingName}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddKhataPage(existingName: existingName),
      ),
    );

    if (result != null) {
      final name = result['name'];
      final entry = result['entry'];
      setState(() {
        addOrUpdateEntry(name, entry);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Khata Book"), backgroundColor: Colors.red),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.red.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Work Amount: ₹${getTotalWorkAmount()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total Paid: ₹${getTotalPaid()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Total Remaining: ₹${getTotalRemaining()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => openAddEntry(),
            child: Text("Add New Farmer"),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: accounts.values.map((acc) {
                double paid = acc.entries.fold(
                  0,
                  (sum, e) => sum + e.totalPaid,
                );
                return Card(
                  child: ListTile(
                    title: Text(acc.name),
                    subtitle: Text("Total Paid: ₹$paid"),
                    onTap: () {
                      // Tap an existing farmer → add new entry for that farmer
                      openAddEntry(existingName: acc.name);
                    },
                    onLongPress: () {
                      // Long press → view account details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AccountDetailsPage(account: acc),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

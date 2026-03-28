import 'package:flutter/material.dart';
import 'khata_model.dart';

class AccountDetailsPage extends StatefulWidget {
  final KhataAccount account;
  const AccountDetailsPage({super.key, required this.account});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  void addPayment(KhataEntry entry) async {
    final result = await showDialog<double>(
      context: context,
      builder: (context) {
        TextEditingController paymentController = TextEditingController();
        return AlertDialog(
          title: Text("Add Payment"),
          content: TextField(
            controller: paymentController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Amount Paid"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                double amt = double.tryParse(paymentController.text) ?? 0;
                Navigator.pop(context, amt);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );

    if (result != null && result > 0) {
      setState(() {
        entry.payments.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.account.name),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: widget.account.entries.length,
        itemBuilder: (context, index) {
          final e = widget.account.entries[index];
          return Card(
            child: ListTile(
              title: Text("${e.tool} - ${e.area}"),
              subtitle: Text(
                "Date: ${e.date} | Total: ₹${e.price} | Paid: ₹${e.totalPaid} | Remaining: ₹${e.remaining}",
              ),
              trailing: IconButton(
                icon: Icon(Icons.payment, color: Colors.green),
                onPressed: () => addPayment(e),
              ),
            ),
          );
        },
      ),
    );
  }
}

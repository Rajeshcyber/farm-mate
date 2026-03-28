import 'package:flutter/material.dart';
import 'khata_model.dart';

class AddKhataPage extends StatefulWidget {
  final String? existingName; // null if new farmer
  const AddKhataPage({super.key, this.existingName});

  @override
  State<AddKhataPage> createState() => _AddKhataPageState();
}

class _AddKhataPageState extends State<AddKhataPage> {
  TextEditingController name = TextEditingController();
  TextEditingController tool = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingName != null) {
      name.text = widget.existingName!;
    }
  }

  void saveEntry() {
    final entry = KhataEntry(
      tool: tool.text,
      area: area.text,
      date: date.text,
      price: double.tryParse(price.text) ?? 0,
    );

    Navigator.pop(context, {'name': name.text, 'entry': entry});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingName != null ? "Add Entry" : "New Farmer"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            if (widget.existingName == null)
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),
            TextField(
              controller: tool,
              decoration: InputDecoration(labelText: "Tool Used"),
            ),
            TextField(
              controller: area,
              decoration: InputDecoration(labelText: "Area"),
            ),
            TextField(
              controller: date,
              decoration: InputDecoration(labelText: "Date"),
            ),
            TextField(
              controller: price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Price"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveEntry, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}

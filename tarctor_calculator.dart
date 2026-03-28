import 'package:flutter/material.dart';

class TractorCalculator extends StatefulWidget {
  const TractorCalculator({super.key});

  @override
  _TractorCalculatorState createState() => _TractorCalculatorState();
}

class _TractorCalculatorState extends State<TractorCalculator> {
  // Dynamic tool list
  List<String> tools = ["Cultivator", "Rotavator", "Nagali"];
  String selectedTool = "Cultivator";

  // Controllers for price and area input
  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  // Unit selection
  String selectedUnit = "Acre";

  // Total cost
  double total = 0;

  // Calculation function
  void calculateTotal() {
    if (priceController.text.isEmpty || areaController.text.isEmpty) return;

    double pricePerAcre = double.parse(priceController.text);
    double area = double.parse(areaController.text);

    if (selectedUnit == "Acre") {
      total = area * pricePerAcre;
    } else if (selectedUnit == "Cent") {
      double pricePerCent = pricePerAcre / 100;
      total = area * pricePerCent;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tractor Work Calculator"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // TOOL SELECTION + ADD NEW
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: selectedTool,
                    items: tools
                        .map(
                          (tool) =>
                              DropdownMenuItem(value: tool, child: Text(tool)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTool = value.toString();
                      });
                    },
                    decoration: InputDecoration(labelText: "Select Tool"),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add new tool dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController newToolController =
                            TextEditingController();
                        return AlertDialog(
                          title: Text("Add New Tool"),
                          content: TextField(
                            controller: newToolController,
                            decoration: InputDecoration(
                              hintText: "Enter tool name",
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                String newTool = newToolController.text.trim();
                                if (newTool.isNotEmpty) {
                                  setState(() {
                                    tools.add(newTool);
                                    selectedTool = newTool;
                                  });
                                }
                                Navigator.pop(context);
                              },
                              child: Text("Add"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                  child: Text("Add New"),
                ),
              ],
            ),

            SizedBox(height: 20),

            // PRICE INPUT
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price per Acre",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // AREA INPUT
            TextField(
              controller: areaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Area",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // UNIT SELECTION
            DropdownButtonFormField(
              initialValue: selectedUnit,
              items: ["Acre", "Cent"]
                  .map(
                    (unit) => DropdownMenuItem(value: unit, child: Text(unit)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnit = value.toString();
                });
              },
              decoration: InputDecoration(labelText: "Unit"),
            ),

            SizedBox(height: 25),

            // CALCULATE BUTTON
            ElevatedButton(
              onPressed: calculateTotal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text("CALCULATE"),
            ),

            SizedBox(height: 30),

            // DISPLAY RESULT
            Text(
              "Selected Tool: $selectedTool",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Total Cost: ₹ $total",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

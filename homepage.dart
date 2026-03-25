import 'package:flutter/material.dart';
import 'tractor_calculator.dart';
import 'khatha_book/khatha_home.dart';
import 'account Holder/account_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farmer Tool App"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2, // 2x2 grid
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [

            // 1️⃣ AREA CALCULATOR
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TractorCalculator()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calculate, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Area Calculator",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // 2️⃣ GPS MEASUREMENT
            ElevatedButton(
              onPressed: () {
                // Future feature
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text("GPS Measure",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // 3️⃣ ACCOUNT HOLDINGS
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountHome()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Account Holdings",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // 4️⃣ KHATA BOOK
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KhataHome()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Khata Book",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
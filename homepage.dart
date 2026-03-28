import 'package:flutter/material.dart';
import 'khata book/khata_home.dart';

void navigateTo(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildFeatureCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.red,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔥 HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Welcome 👋",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  "Farm Assistant",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // 💰 SUMMARY CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Earnings", style: TextStyle(fontSize: 16)),
                    Text(
                      "₹ 0",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // 🔥 FEATURES GRID
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  // MAIN FEATURE
                  buildFeatureCard(
                    icon: Icons.book,
                    title: "Khata Book",
                    onTap: () {
                      navigateTo(context, KhataHome());
                    },
                    color: Colors.red,
                  ),

                  buildFeatureCard(
                    icon: Icons.calculate,
                    title: "Calculator",
                    onTap: () {
                      // navigateTo(context, Calculator());
                    },
                    color: Colors.blue,
                  ),

                  buildFeatureCard(
                    icon: Icons.location_on,
                    title: "GPS Measure",
                    onTap: () {},
                    color: Colors.green,
                  ),

                  buildFeatureCard(
                    icon: Icons.person,
                    title: "Accounts",
                    onTap: () {},
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

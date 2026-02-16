import 'package:flutter/material.dart';

class ShopRules extends StatelessWidget {
  const ShopRules({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (_) => EventRulesScreen(id:'2007',tittle: 'Shop Rules',)));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4e2e1e), Color(0xFF2c1507)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.menu_book_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Shop Rules",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'PT Serif',
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}

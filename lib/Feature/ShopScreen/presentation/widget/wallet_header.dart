import 'package:flutter/material.dart';

class WalletHeader extends StatelessWidget {
  final int points;
  const WalletHeader({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12,top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.brown.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF2c1507).withOpacity(0.1),
            ),
            child:  Image.asset('assets/Coins.png',height: 30,width: 30,),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'My Empyra Coins',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'PT Serif',
                fontWeight: FontWeight.bold,
                color: Color(0xFF2c1507),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orange.shade300),
            ),
            child: Row(
              children:  [
                Image.asset('assets/coin.png',height: 18,width: 18,),
                //Icon(Icons.monetization_on, size: 18, color: Colors.orange),
                SizedBox(width: 6),
                Text(
                  points.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2c1507),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

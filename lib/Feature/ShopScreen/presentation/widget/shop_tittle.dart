import 'package:flutter/material.dart';

class ShopTittle extends StatelessWidget {
  const ShopTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4e2e1e), Color(0xFF2c1507)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Empyra Exchange',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'PT Serif',
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 2,),
            Text(
              'Conquer and Collect',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'PT Serif',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft:  Radius.circular(10)),
          border: Border.all(color: Colors.black26),
          color: Colors.white60 ,
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 12.0,left: 8,right: 8,bottom: 8),
          child: Text(
            "Step into the Empyra Exchange, the official reward shop of the realm, where your efforts don’t go unnoticed!\n\n"
                "Every task you complete, every quest you conquer, earns you Empyra Coins, the currency of the kingdom. Here, you can redeem your hard-earned coins for exclusive goodies and stall discounts.",
            style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ],);
  }
}

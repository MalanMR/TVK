import 'package:bloc_code/Feature/ShopScreen/presentation/cubit/shop_cubit.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/cubit/shop_state.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/widget/empty_view.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/widget/shop_rules.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/widget/shop_tittle.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/widget/wallet_header.dart';
import 'package:bloc_code/core/constant/api_constant.dart';
import 'package:bloc_code/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShopCubit>(context).getShopList('${ApiConstant.shopListUrl}749415a3-d6c7-42f5-aebc-2f28625c84ee');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  AppColors.background,
        body:BlocBuilder<ShopCubit,ShopState>(
          builder:(context,state) {
            if(state is ShopLoadingState){
              return Center(child: CircularProgressIndicator.adaptive());
            }else if(state is ShopSucessState){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Description
                          const ShopTittle(),

                          // Shop Event rules
                          const ShopRules(),

                          //   Wallet Header
                          WalletHeader(points: state.shopEntity.points),

                          // Shop Item List
                          state.shopEntity.shop.isEmpty
                              ? Center(
                            child: EmptyView(),
                          )
                              : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.shopEntity.shop.length,
                            itemBuilder: (context, index) {
                              final product = state.shopEntity.shop[index];
                              final maxQty = product.maxPurchaseQty;
                              final stockLabel = product.stockLabel;

                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 3))],
                                  border: Border.all(color: Colors.grey.shade200),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Product Image
                                          Column(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey.shade200,
                                                  border: Border.all(color: Colors.grey.shade300),
                                                  image: DecorationImage(
                                                    //image: AssetImage('assets/Keychain.jpg'),
                                                    image: NetworkImage(product.img),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 10),

                                          // Info
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start, // ✅ Align top if text goes multiline
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '${product.name}',
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        maxLines: 2, // ✅ allow 2 lines
                                                        overflow: TextOverflow.ellipsis, // ✅ adds "..." if still too long
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.only(top: 6, left: 6),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/coin.png', height: 18, width: 18),
                                                          const SizedBox(width: 4),
                                                          Text(
                                                            '${product.point}',
                                                            style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 6),
                                                product.remQty==0?Container(
                                                  padding: const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green.shade50,
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: Colors.green.shade200),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.emoji_events, color: Colors.green.shade700, size: 24),
                                                      const SizedBox(width: 8),
                                                      Expanded(
                                                        child: Text(
                                                          'Congratulations! You collected your rewards',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.green.shade800,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                    :Text(stockLabel, style: TextStyle(fontSize: 14, color: stockLabel.startsWith("In") ? Colors.green : Colors.red, fontWeight: FontWeight.w600)),
                                                const SizedBox(height: 10),
                                                product.remQty!=0?
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    // Points
                                                    product.claim==0?
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                                                      decoration: BoxDecoration(
                                                        color: Colors.orange.shade50,
                                                        borderRadius: BorderRadius.circular(6),
                                                        border: Border.all(color: Colors.orange.shade200),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/coin.png',height: 18,width: 18,),
                                                              Text('${product.point * product.qty}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                                        ],
                                                      ),
                                                    ):Container(),
                                                    const Spacer(),

                                                    // Quantity Buttons
                                                    if (product.claim == 0) ...[
                                                      IconButton(
                                                        onPressed: product.qty > 0
                                                            ? () => context.read<ShopCubit>().decrementQty(index)
                                                            : null,
                                                        icon: const Icon(Icons.remove_circle_outline),
                                                      ),

                                                      Text(
                                                        '${product.qty}',
                                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                      ),

                                                      IconButton(
                                                        onPressed: product.qty < product.maxPurchaseQty
                                                            ? () => context.read<ShopCubit>().incrementQty(index)
                                                            : null,
                                                        icon: const Icon(Icons.add_circle_outline),
                                                      ),
                                                    ],

                                                    // Claim Button
                                                    if (product.claim == 0)
                                                      ElevatedButton(
                                                        onPressed: product.qty > 0
                                                            ? () {
                                                          final shopQty = product.qty;
                                                          final shopCoin = product.point * shopQty;

                                                          if (state.shopEntity.points < shopCoin) {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              const SnackBar(
                                                                content: Text('You don’t have enough coins'),
                                                              ),
                                                            );
                                                            return;
                                                          }

                                                          // 🔥 Call Cubit / UseCase for claim
                                                        //  context.read<ShopCubit>().claimProduct(index);
                                                        }
                                                            : null,
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color(0xFF2c1507),
                                                          foregroundColor: Colors.white,
                                                        ),
                                                        child: const Text("Claim"),
                                                      )
                                                  ],
                                                ):Container(),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                      product.claim==1?
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Claimed Qty Text
                                          Text(
                                            'Claimed Qty: ${product.qty}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.brown,
                                            ),
                                          ),
                                          // Buttons Row
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // REST button action
                                                  // shop_id= product['id'].toString();
                                                  // shop_name= product['name'];
                                                  // shop_qty=product['qty'].toString();
                                                  // fetchData(7);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.orange.shade100,
                                                  foregroundColor: Colors.orange.shade900,
                                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                ),
                                                child: const Text("Revoke"),
                                              ),
                                              const SizedBox(width: 10),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  // Navigate to TaskDetailsScreen and wait for the user to return
                                                  // final result = await Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => TaskDetailsScreen(
                                                  //       task: product,
                                                  //       screen: 'shop',
                                                  //     ),
                                                  //   ),
                                                  // );
                                                  //
                                                  // // result can be used if you want to pass info back
                                                  // // After coming back, refresh data or call API
                                                  // await fetchData(5); // Replace this with your API function
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green.shade600,
                                                  foregroundColor: Colors.white,
                                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                ),
                                                child: const Text("Collect"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ):Container()
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    //  SponsorSection()
                  ],
                ),
              );
            }else if(state is ShopErrorState){
              return Center(child: Text(state.message));
            }
            return Text('Something Went Wrong');
          }
        ));
  }
}
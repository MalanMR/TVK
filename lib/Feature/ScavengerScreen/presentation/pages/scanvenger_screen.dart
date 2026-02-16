import 'dart:ui';
import 'package:bloc_code/Feature/ScavengerScreen/presentation/cubit/scavenger_cubit.dart';
import 'package:bloc_code/Feature/ScavengerScreen/presentation/cubit/scavenger_state.dart';
import 'package:bloc_code/Feature/ScavengerScreen/presentation/widget/showLockUnlockPopup.dart';
import 'package:bloc_code/core/constant/api_constant.dart';
import 'package:bloc_code/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScavengerScreen extends StatefulWidget {
  const ScavengerScreen({super.key});
  @override
  State<ScavengerScreen> createState() => _ScavengerScreenState();
}

class _ScavengerScreenState extends State<ScavengerScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ScavengerCubit>(context).getScavengerTask('${ApiConstant.scavengerUrl}749415a3-d6c7-42f5-aebc-2f28625c84ee');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<ScavengerCubit,ScavengerState>(
        builder: (context,state) {
          if(state is ScavengerLoadingState){
            return Center(child: CircularProgressIndicator.adaptive());
          }else if(state is ScavengerSucessState){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Game Title
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.black,width: 2),
                            image: const DecorationImage(
                              image: AssetImage("assets/ach_back.jpeg"), // your image path
                              fit: BoxFit.fitWidth, // cover entire background
                              // optional: make it faint so text is visible
                            ),
                          ),
                          child: Column(
                            children:  [
                              Text(
                                "The Knight’s Gambit",
                                style: TextStyle(
                                    fontFamily: 'PT Serif',
                                    fontSize: 20, color: Colors.brown.shade900, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "(Tasks, Chaos and Glory)",
                                style: TextStyle(fontFamily: 'PT Serif',fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.brown.shade900,
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.brown.shade600),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children:  [
                                          SizedBox(height: 10),
                                          Text("Tasks Completed", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown.shade900,fontFamily: 'PT Serif',)),
                                          SizedBox(height: 8),
                                          //Text(completedTasks.toString(), style: TextStyle(fontSize: 28, fontFamily: 'PT Serif',fontWeight: FontWeight.bold,color: Colors.brown.shade900)),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 70,
                                      color: Colors.brown.shade600,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children:  [
                                          SizedBox(height: 10),
                                          Text("Total No Of Tasks", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown.shade900,fontFamily: 'PT Serif',)),
                                          SizedBox(height: 8),
                                          //Text(totalTasks.toString(), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.brown.shade900,fontFamily: 'PT Serif',)),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Description
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "Complete as many fun and quirky tasks as you can from the list below!\n\n"
                                "Each completed task earns you coins that will be tracked in the app. "
                                "The more you do, the more coins you collect - and yes, they’re redeemable!\n\n"
                                "Use your coins at the official Empower Shop to grab free goodies!",
                            style: TextStyle(height: 1.4),
                          ),
                        ),
                        // Event Rules Header
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => EventRulesScreen(id:'2000',tittle: 'Event Rules',)));
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
                                  "Read Event Rules",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PT Serif',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.white70),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        //Task List Header
                        //  sectionHeader(sh_admin==1?"Scavenger Hunt Tasks (Admin)":"Scavenger Hunt Tasks"),
                        // List of tasks
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(1),
                              bottomLeft: Radius.circular(1),
                            ),
                            //border: Border.all(color: Colors.white),
                            color: const Color(0xFFf2f2f2),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.scavengerEntity.data.length,
                            itemBuilder: (context, index) {
                              final task = state.scavengerEntity.data[index];
                              final isHidden = task.h == "1";
                              final isdone = task.c=='1';
                              final no_qr = task.noQr=='1';

                              return GestureDetector(
                                onLongPress: () => showLockUnlockPopup(context, task),
                                // onLongPress: sh_admin == 1
                                //     ? () {
                                //   _showLockUnlockPopup(context, task);
                                // }
                                //    : null,
                                onTap:isHidden||isdone||no_qr
                                    ? null
                                    :() {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         TaskDetailsScreen(task: task,screen:'sh'),
                                  //   ),
                                  // );
                                },
                                child: ImageFiltered(
                                  imageFilter: isHidden
                                      ? ImageFilter.blur(sigmaX: 4, sigmaY: 4)
                                      : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            task.img ?? '', // empty string if null
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return const Icon(Icons.error, size: 50, color: Colors.red);
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                task.t,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Image.asset('assets/coin.png',height: 18,width: 18,),
                                                  // const Icon(Icons.monetization_on_rounded,
                                                  //     size: 16, color: Colors.orange),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${task.p} Coins",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        no_qr? Container():isdone? Icon(Icons.verified, size: 18,color: Colors.green,):
                                        IconButton(
                                          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                                          color: Colors.brown, onPressed: isHidden
                                            ? null
                                            :() {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         TaskDetailsScreen(task: task,screen:'sh'),
                                          //   ),
                                          // );
                                        },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );

                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  // SponsorSection()
                ],
              ),
            );
          }else if( state is ScavengerErrorState){
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Something went wrong'));
        }
      )
    );
  }
}
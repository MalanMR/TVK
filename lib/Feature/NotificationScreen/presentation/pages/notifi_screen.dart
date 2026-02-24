import 'package:bloc_code/Feature/NotificationScreen/presentation/cubit/notifi_cubit.dart';
import 'package:bloc_code/Feature/NotificationScreen/presentation/cubit/notifi_state.dart';
import 'package:bloc_code/core/constant/app_colors.dart';
import 'package:bloc_code/core/constant/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_code/core/constant/api_constant.dart';

class NotifiScreen extends StatefulWidget {
  const NotifiScreen({super.key});

  @override
  State<NotifiScreen> createState() => _NotifiScreenState();
}

class _NotifiScreenState extends State<NotifiScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotifiCubit>(context).getNotifiData('${ApiConstant.fetchUserLogs}749415a3-d6c7-42f5-aebc-2f28625c84ee');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(
        centerTitle: true,
        title:  Text('My Logs',style: AppTextStyle.heading),
        backgroundColor: AppColors.background,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: BlocBuilder<NotifiCubit,NotifiState>(
        builder: ( context, state) {
          if(state is NotifiLoadingState){
            return Center(child: CircularProgressIndicator.adaptive());
          }else if (state is NotifiErrorState){
            return Center(child: Text(state.message));
          }else if (state is NotifiSucessState){
            return  ListView.builder(
              itemCount: state.notifiEntity.data.length,
              itemBuilder: (context, index) {
                final log = state.notifiEntity.data[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                log.n ,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                log.t ,
                                style: const TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: Text('Something went wrong'));
          },
      ),
    );
  }
}
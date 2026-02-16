import 'package:bloc_code/Feature/ScavengerScreen/data/dataSource/scavenger_data_source.dart';
import 'package:bloc_code/Feature/ScavengerScreen/data/repositories/scavenger_repo_impl.dart';
import 'package:bloc_code/Feature/ScavengerScreen/domain/useCases/scavenger_use_case.dart';
import 'package:bloc_code/Feature/ScavengerScreen/presentation/cubit/scavenger_cubit.dart';
import 'package:bloc_code/Feature/ShopScreen/data/dataSource/shop_data_source.dart';
import 'package:bloc_code/Feature/ShopScreen/data/repositories/shop_repository_impl.dart';
import 'package:bloc_code/Feature/ShopScreen/domain/useCases/shop_usecase.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/cubit/shop_cubit.dart';
import 'package:bloc_code/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>ScavengerCubit(scavengerUseCase: ScavengerUseCase(scavengerRepository: ScavengerRepoImpl(scavengerDataSource: ScavengerDataSourceImpl())))),
      BlocProvider(create: (_)=>ShopCubit(shopUsecase: ShopUsecase(shopRepository: ShopRepositoryImpl(shopDataSource: ShopDataSourceImpl()))))
    ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BottomNavScreen(),
    );
  }
}

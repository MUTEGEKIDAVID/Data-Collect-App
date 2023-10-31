import 'package:data_collect/Logic%20layer/Functional%20logic/cubit/plant_no_cubit.dart';
import 'package:data_collect/Logic%20layer/Functional%20logic/cubit/plot_no_cubit_cubit.dart';
import 'package:data_collect/Logic%20layer/Functional%20logic/cubit/range_no_cubit.dart';
import 'package:data_collect/Presentation/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlotNoCubitCubit(),
        ),
        BlocProvider(
          create: (context) => PlantNoCubit(),
        ),
         BlocProvider(
          create: (context) => RangeNoCubit(),
        ),
        
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Data Collection',
          home: HomeScreen()),
    );
  }
}

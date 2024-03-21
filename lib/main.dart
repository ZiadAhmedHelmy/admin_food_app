import 'package:admin_app_foodi/View/HomePage.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/DashBoardCubit/dash_board_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/Orders/orders_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/SectionCubit/section_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/UserCubit/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ViewModel/Bloc/BlocObserver.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SectionCubit(),),
        BlocProvider(create: (context) => DashBoardCubit(),),
        BlocProvider(create: (context) => OrdersCubit(),),
        BlocProvider(create: (context) => UserCubit(),),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Rubik"),
        home: const HomePage(),
      ),
    );
  }
}


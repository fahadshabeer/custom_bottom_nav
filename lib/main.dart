import 'package:custom_bottom_nav/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:custom_bottom_nav/view/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>BottomNavCubit())
      ],
      child: MaterialApp(
        home: RootScreen(),
        ),
    );
  }
}

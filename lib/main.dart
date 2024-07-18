import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/ecommerce_home/presentation/view_model/ecommerce_cubit.dart';
import 'Features/splash_view/presentation/view/splash_view.dart';

void main ()async{
  runApp(BlocProvider<EcommerceCubit>(
    create: (context) => EcommerceCubit(EcommerceState()),
    child: const RouteApp(),
  ));
}

class RouteApp extends StatelessWidget {
  const RouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCustomSplashScreen(),
    );
  }
}

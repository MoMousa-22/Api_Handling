import 'package:api_handling/core/api/dio_consumer.dart';
import 'package:api_handling/screens/sign_in_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/user_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(
          dio:
              Dio())), // ( i can replace "DioConsumer()" with ex: "HttpConsumer" if i want to change )
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

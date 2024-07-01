import 'package:auth_task/auth/pages/number_name.dart';
import 'package:auth_task/database/hive_db.dart';
import 'package:auth_task/main/cubit/tile_cubit.dart';
import 'package:auth_task/models/tile.dart';
import 'package:auth_task/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TileAdapter());
  await Hive.openBox('MyBox');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TileCubit(ToDoDatabase()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: basicTheme(),
        home: const AuthWithNumber(),
      ),
    );
  }
}

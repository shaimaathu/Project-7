import 'package:cv_maker_app/pages/bloc/cv_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/data_layer.dart';
import 'pages/bottom nav page/bottom_nav_page.dart';
import 'pages/logIn/log_in_page.dart';
import 'service/supabase_configration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfig();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<AllData>();
    locator.getToken();
    return BlocProvider(
      create: (context) => CvBloc(),
      child: MaterialApp(
        home: locator.token.isNotEmpty ? const BottomNavScreen() : SignIn(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

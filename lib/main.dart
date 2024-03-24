import 'package:flutter/material.dart';
import 'src/core/route/route_generator.dart';
import 'src/core/constants/route_consts.dart';
import 'src/core/service_locator/service_locator.dart';
import 'src/features/splash_screen/presentation/pages/splash_screen.dart';

void main() async {
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MHEALTHCOP APP',
      initialRoute: RouteConsts.loginRoute,
      onGenerateRoute: generateRoute,
      
      routes: {
        RouteConsts.splashRoute : (context ) => const SplashScreen(),
      },
    );
  }
}
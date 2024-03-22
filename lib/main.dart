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
      initialRoute: RouteConsts.splashRoute,
      onGenerateRoute: generateRoute,
      routes: {
        RouteConsts.splashRoute : (context ) => const SplashScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}
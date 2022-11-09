import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wearhouse/provider/login_auth_provider.dart';
import 'package:wearhouse/screens/login_page.dart';

import 'provider/device_info.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: DeviceInformation()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
        routes: {'login-screen': (context) => const LoginPage()},
      ),
    );
  }
}

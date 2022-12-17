import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/screens/PutAway/put_away_provider/put_away_provider.dart';
import 'provider/device_info.dart';
import 'provider/login_auth_provider.dart';
import 'provider/login_details.provider.dart';
import 'provider/recive_orders_provider.dart';
import 'screens/splashscreen.dart';
import 'services/api/recive_api.dart';

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
        // ChangeNotifierProvider.value(value: RecievedDetails()),
        ChangeNotifierProvider.value(value: UserDetails()),
        ChangeNotifierProvider.value(
          value: RecieveAPI(),
        ),
        ChangeNotifierProvider.value(value: ParticularOrders()),
        ChangeNotifierProvider.value(value: RecieveAPI()),
        ChangeNotifierProvider.value(value: PutAwayProvider())

        // ChangeNotifierProvider.value(value: const MyHomePage())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: const {
          // 'login-screen': (context) => const LoginPage(),
          // 'recieve-page': (context) => const ReceiveOrders(),
          // 'home_page': (context) => const MyHomePage(),
          // 'orders_page': (context) =>  OrdersSelectPage(),
        },
      ),
    );
  }
}
